include helpers.make

species = Mus_musculus
readlen = 75
genome = ${species}.GRCm38.dna.primary_assembly
reference = data/reference/${genome}.fasta
gem-index = data/reference/${genome}.index.gem
mappability = data/reference/${genome}.mappability-${readlen}.mappability
mappability-wig = data/reference/${genome}.mappability-${readlen}.wig

$(call ext_dep,tetk,install)

$(call dirs,data data/reference)

.PHONY: reference
## Download the reference genome.
reference: ${reference}

${reference}: | data/reference
	curl -o $@.gz 'ftp://ftp.ensembl.org/pub/release-79/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna.primary_assembly.fa.gz'
	gunzip $@.gz

.PHONY: mappability
## Compute per-base mappability scores
mappability: ${mappability-wig}

${gem-index}: ${reference}
	${bsub} -n10 $(call memreq,65000) -R'span[hosts=1]' \
		'gem-indexer -i $< -T 8 -o ${@:.gem=}'

${mappability}: ${gem-index}
	${bsub} -n10 $(call memreq,20000) -R'span[hosts=1]' \
		'gem-mappability -I $< -l ${readlen} -T 8 -o ${@:.gem=}'

${mappability-wig}: ${mappability}
	${bsub} -n2 $(call memreq,4000) \
		'gem-2-wig -I ${gem-index} -i $< -o ${@:.wig=}'
