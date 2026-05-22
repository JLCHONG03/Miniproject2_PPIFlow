#!/bin/bash

# Generate de novo CD39-targeting nanobody binders using PPIFlow

python sample_antibody_nanobody.py \
\
# Input antigen structure (tetrameric CD39)
--antigen_pdb /mnt/JL_Chong/CD39_tetramer.pdb \
\
# Nanobody framework structure
--framework_pdb /mnt/JL_Chong/PPIFlow-main/Framework/8coh_nanobody_framework_G.pdb \
\
# Define antigen and nanobody chains
--antigen_chain A \
--heavy_chain A \
\
# Selected CD39 epitope residues (138–144)
--specified_hotspots "A138,A139,A140,A141,A142,A143,A144" \
\
# Define CDR length ranges for nanobody generation
--cdr_length "CDRH1,8-8,CDRH2,8-8,CDRH3,9-21" \
\
# Number of binders generated per run
--samples_per_target 5 \
\
# PPIFlow inference configuration and pretrained model
--config /mnt/JL_Chong/PPIFlow-main/configs/inference_nanobody.yaml \
--model_weights /mnt/JL_Chong/PPIFlow-main/ckpts/nanobody.ckpt \
\
# Output directory for generated nanobody binders
--output_dir /mnt/JL_Chong/PPIFlow-main/output/CD39_nanobody \
--name CD39_nanobody
