#!/bin/bash
python sample_antibody_nanobody.py \
--antigen_pdb /mnt/JL_Chong/CD39_tetramer.pdb \
--framework_pdb /mnt/JL_Chong/PPIFlow-main/Framework/6tcs_scfv_framework.pdb \
--antigen_chain C \
--heavy_chain A \
--light_chain B \
--specified_hotspots "C138,C139,C140,C141,C142,C143,C144" \
--cdr_length "CDRH1,8-8,CDRH2,8-8,CDRH3,10-20,CDRL1,6-9,CDRL2,3-3,CDRL3,9-11" \
--samples_per_target 5 \
--config /mnt/JL_Chong/PPIFlow-main/configs/inference_nanobody.yaml \
--model_weights /mnt/JL_Chong/PPIFlow-main/ckpts/antibody.ckpt \
--output_dir /mnt/JL_Chong/PPIFlow-main/output/CD39_antibody \
--name CD39_antibody
