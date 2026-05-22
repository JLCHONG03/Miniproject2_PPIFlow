#!/bin/bash
python sample_binder.py \
--input_pdb /mnt/JL_Chong/CD39_tetramer.pdb \
--target_chain A \
--binder_chain T \
--config /mnt/JL_Chong/PPIFlow-main/configs/inference_binder.yaml \
--specified_hotspots "A138,A139,A140,A141,A142,A143,A144" \
--samples_min_length 75 \
--samples_max_length 76 \
--samples_per_target 5 \
--model_weights /mnt/JL_Chong/PPIFlow-main/ckpts/binder.ckpt \
--output_dir /mnt/JL_Chong/PPIFlow-main/output/CD39_binder \
--name CD39_binder
