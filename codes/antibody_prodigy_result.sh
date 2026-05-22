#!/bin/bash

# Perform Prodigy-based binding affinity screening for generated CD39 antibody binders
RESULT_DIR="/mnt/JL_Chong/PPIFlow-main/prodigy_results_antibody"
TOP_DIR="$RESULT_DIR/top5_antibodies"
CSV="$RESULT_DIR/antibody_prodigy_all_results.csv"

mkdir -p "$RESULT_DIR" "$TOP_DIR"
echo "rank,file,folder,affinity_kcal_mol,Kd_M,full_path" > "$CSV.tmp"

count=0

# Loop through generated antibody binder folders
for folder in \
/mnt/JL_Chong/PPIFlow-main/output/CD39_antibody_300 \
/mnt/JL_Chong/PPIFlow-main/output/CD39_antibody_remaining164 \
/mnt/JL_Chong/PPIFlow-main/output/CD39_antibody_remaining238
do
  for pdb in "$folder"/*.pdb
  do
    [ -e "$pdb" ] || continue

    filename=$(basename "$pdb")
    foldername=$(basename "$folder")
    
    # Run Prodigy affinity prediction
    output=$(prodigy "$pdb" 2>/dev/null)

    affinity=$(echo "$output" | grep "Predicted binding affinity" | awk '{print $6}')
    kd=$(echo "$output" | grep "Predicted dissociation constant" | awk '{print $NF}')

    [ -z "$affinity" ] && affinity="NA" && kd="NA"

    echo "0,$filename,$foldername,$affinity,$kd,$pdb" >> "$CSV.tmp"

    count=$((count+1))
    echo "Processed $count: $foldername/$filename affinity=$affinity Kd=$kd"
  done
done

# Rank binders based on predicted binding affinity
{
  echo "rank,file,folder,affinity_kcal_mol,Kd_M,full_path"
  grep -v ",NA," "$CSV.tmp" | tail -n +2 | sort -t, -k4,4n | awk -F, 'BEGIN{OFS=","} {$1=NR; print}'
} > "$CSV"

rm "$CSV.tmp"

# Copy top 5 binders into a separate folder
tail -n +2 "$CSV" | head -5 | while IFS=, read -r rank file folder affinity kd path
do
  cp "$path" "$TOP_DIR/rank${rank}_${folder}_${file}"
done

echo "Done."
echo "Results saved to: $CSV"
echo "Top 5 copied to: $TOP_DIR"

# Display top-ranked binders
head -6 "$CSV"
