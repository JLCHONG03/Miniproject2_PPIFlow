# Extract amino acid sequences from all protein chains in a PDB structure file using Biopython

# Import modules for parsing PDB structures
from Bio.PDB import PDBParser, PPBuilder
import sys

# Read input PDB file from command line
pdb_file = sys.argv[1]

# Parse the PDB structure
parser = PDBParser(QUIET=True)
structure = parser.get_structure("structure", pdb_file)

# Initialize peptide builder for sequence extraction
ppb = PPBuilder()

# Loop through all models and chains in the structure
for model in structure:
    for chain in model:
        
        # Store extracted amino acid sequence
        sequence = ""

        # Extract peptide sequences from the chain
        for peptide in ppb.build_peptides(chain):
            sequence += str(peptide.get_sequence())

        # Print chain ID and extracted sequence
        if sequence:
            print(f">Chain_{chain.id}")
            print(sequence)
