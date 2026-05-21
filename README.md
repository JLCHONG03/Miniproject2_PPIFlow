# Miniproject2_PPIFlow

AI-guided de novo protein binder design against a conserved extracellular CD39 epitope using PPIFlow, AlphaFold3, and Prodigy.

## Project Overview

This project aimed to identify conserved and structurally accessible CD39 epitope regions and generate de novo mini-protein binders, antibodies, and nanobodies targeting the selected epitope using PPIFlow. Generated binders were evaluated through computational binding affinity screening and structural validation.

## Workflow

1. Multiple sequence alignment of CD39 homologues using Clustal Omega
2. Epitope prediction using DiscoTope3
3. Structural visualization using PyMol
4. De novo binder generation using PPIFlow
5. Binding affinity screening using Prodigy
6. Structural refinement and validation using AlphaFold3

## Repository Structure

### `/codes`
Contains workflow scripts used throughout the project:
- `miniprotein_generation.sh`
- `antibody_generation.sh`
- `nanobody_generation.sh`
- `miniprotein_prodigy_result.sh`
- `antibody_prodigy_result.sh`
- `nanobody_prodigy_result.sh`
- `extract_seq.py`

### `/results`
Contains representative computational outputs:
- PPIFlow-generated structures (`.pdb`)
- AlphaFold3-refined structures (`.cif`)
- Prodigy affinity screening results (`.csv`)
- Structural comparison figures (`.png`)
- Extracted sequence summaries

## Software and Tools

- PPIFlow
- AlphaFold3
- Prodigy
- Clustal Omega
- DiscoTope3
- PyMol
- Biopython

## Notes

All binding affinities and structural interactions reported in this project are computational predictions and have not been experimentally validated.

## Author

Junliang Chong  
CMML ICA2 Mini Project
