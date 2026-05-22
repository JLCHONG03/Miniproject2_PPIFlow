#!/bin/bash
python sample_antibody_nanobody.py \
--antigen_pdb /mnt/JL_Chong/CD39_tetramer.pdb \
--framework_pdb /mnt/JL_Chong/PPIFlow-main/Framework/8coh_nanobody_framework_G.pdb \
--antigen_chain A --heavy_chain A --specified_hotspots "A138,A139,A140,A141,A142,A143,A144" \
--cdr_length "CDRH1,8-8,CDRH2,8-8,CDRH3,9-21" \
--samples_per_target 5 \
--config /mnt/JL_Chong/PPIFlow-main/configs/inference_nanobody.yaml \
--model_weights /mnt/JL_Chong/PPIFlow-main/ckpts/nanobody.ckpt \
--output_dir /mnt/JL_Chong/PPIFlow\
-main/output/ /mnt/JL_Chong/PPIFlow-main/output/CD39_nanobody \
--name CD39_nanobody
