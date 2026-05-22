#!/bin/bash

# Generate de novo CD39-targeting IgG antibody binders using PPIFlow

python sample_antibody_nanobody.py \
\
# Input antigen structure (tetrameric CD39)
--antigen_pdb /mnt/JL_Chong/CD39_tetramer.pdb \
\
# Antibody framework structure
--framework_pdb /mnt/JL_Chong/PPIFlow-main/Framework/6tcs_scfv_framework.pdb \
\
# Define antigen and antibody chains
--antigen_chain C \
--heavy_chain A \
--light_chain B \
\
# Selected CD39 epitope residues (138–144)
--specified_hotspots "C138,C139,C140,C141,C142,C143,C144" \
\
# Define CDR length ranges for antibody generation
--cdr_length "CDRH1,8-8,CDRH2,8-8,CDRH3,10-20,CDRL1,6-9,CDRL2,3-3,CDRL3,9-11" \
\
# Number of binders generated per run
--samples_per_target 5 \
\
# PPIFlow inference configuration and pretrained model
--config /mnt/JL_Chong/PPIFlow-main/configs/inference_nanobody.yaml \
--model_weights /mnt/JL_Chong/PPIFlow-main/ckpts/antibody.ckpt \
\
# Output directory for generated antibody binders
--output_dir /mnt/JL_Chong/PPIFlow-main/output/CD39_antibody \
--name CD39_antibody
