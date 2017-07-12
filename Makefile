include helpers.make

species = Mus_musculus
readlen = 75
genome = ${species}.GRCm38.dna.primary_assembly
reference = data/reference/${genome}.fasta

$(call ext_dep,tetk,install)
