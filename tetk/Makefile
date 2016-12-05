include ../helpers.make

source_location = 'git@github.com:mhammell-laboratory/tetoolkit.git'
bin_name = tetoolkit
source_name = $(call q,source/$(call u,${bin_name}))

install:
	mkdir -p source
	rm -rf ${source_name}
	git clone ${source_location} ${source_name}
	mkdir -p etc/bin
	python ${source_name}/setup.py install --prefix etc

# vim: ft=make
