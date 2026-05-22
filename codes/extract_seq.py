from Bio.PDB import PDBParser, PPBuilder
import sys

pdb_file = sys.argv[1]

parser = PDBParser(QUIET=True)
structure = parser.get_structure("structure", pdb_file)

ppb = PPBuilder()

for model in structure:
    for chain in model:
        sequence = ""

        for peptide in ppb.build_peptides(chain):
            sequence += str(peptide.get_sequence())

        if sequence:
            print(f">Chain_{chain.id}")
            print(sequence)
