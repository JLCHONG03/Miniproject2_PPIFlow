#!/bin/bash

RESULT_DIR="/mnt/JL_Chong/PPIFlow-main/prodigy_results"
TOP_DIR="$RESULT_DIR/top5_binders"
CSV="$RESULT_DIR/binder_prodigy_all_results.csv"

mkdir -p "$RESULT_DIR" "$TOP_DIR"
echo "rank,file,folder,affinity_kcal_mol,Kd_M,full_path" > "$CSV.tmp"

count=0

for folder in /mnt/JL_Chong/PPIFlow-main/output/CD39_binder_200 /mnt/JL_Chong/PPIFlow-main/output/CD39_binder_large /mnt/JL_Chong/PPIFlow-main/output/CD39_binder_large_2
do
  for pdb in "$folder"/*.pdb
  do
    [ -e "$pdb" ] || continue
    filename=$(basename "$pdb")
    foldername=$(basename "$folder")
    output=$(prodigy "$pdb" 2>/dev/null)
    affinity=$(echo "$output" | grep "Predicted binding affinity" | awk '{print $6}')
    kd=$(echo "$output" | grep "Predicted dissociation constant" | awk '{print $NF}')
    [ -z "$affinity" ] && affinity="NA" && kd="NA"
    echo "0,$filename,$foldername,$affinity,$kd,$pdb" >> "$CSV.tmp"
    count=$((count+1))
    echo "Processed $count: $foldername/$filename affinity=$affinity"
  done
done

{
  echo "rank,file,folder,affinity_kcal_mol,Kd_M,full_path"
  grep -v ",NA," "$CSV.tmp" | tail -n +2 | sort -t, -k4,4n | awk -F, 'BEGIN{OFS=","} {$1=NR; print}'
} > "$CSV"

rm "$CSV.tmp"

tail -n +2 "$CSV" | head -5 | while IFS=, read -r rank file folder affinity kd path
do
  cp "$path" "$TOP_DIR/rank${rank}_${folder}_${file}"
done

echo "Done."
head -6 "$CSV"
