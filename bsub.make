SHELL := $(shell which bash)

#
# Helpers
#

bsub = scripts/bsub -K
memreq = -M$1 -R'select[mem>$1] rusage[mem=$1]'

# vim: ft=make
