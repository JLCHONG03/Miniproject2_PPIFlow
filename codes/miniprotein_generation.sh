#!/bin/bash

# Generate de novo CD39-targeting mini-protein binders using PPIFlow

python sample_binder.py \
\
# Input tetrameric CD39 structure
--input_pdb /mnt/JL_Chong/CD39_tetramer.pdb \
\
# Define target antigen chain and generated binder chain
--target_chain A \
--binder_chain T \
\
# PPIFlow binder generation configuration
--config /mnt/JL_Chong/PPIFlow-main/configs/inference_binder.yaml \
\
# Selected CD39 epitope residues (138–144)
--specified_hotspots "A138,A139,A140,A141,A142,A143,A144" \
\
# Define binder length range
--samples_min_length 75 \
--samples_max_length 76 \
\
# Number of binders generated per run
--samples_per_target 5 \
\
# Pretrained PPIFlow model weights
--model_weights /mnt/JL_Chong/PPIFlow-main/ckpts/binder.ckpt \
\
# Output directory for generated mini-protein binders
--output_dir /mnt/JL_Chong/PPIFlow-main/output/CD39_binder \
--name CD39_binder
