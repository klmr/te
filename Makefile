include helpers.make

species = Mus_musculus
readlen = 75
genome = ${species}.GRCm38.dna.primary_assembly
reference = data/reference/${genome}.fasta

$(call ext_dep,tetk,install)

$(call dirs,data data/reference)

.PHONY: reference
## Download the reference genome.
reference: ${reference}

${reference}: | data/reference
	curl -o $@.gz 'ftp://ftp.ensembl.org/pub/release-79/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna.primary_assembly.fa.gz'
	gunzip $@.gz
