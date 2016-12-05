include ../helpers.make

source_location = 'git@github.com:mhammell-laboratory/tetoolkit.git'
bin_name = tetoolkit
source_name = $(call q,source/$(call u,${bin_name}))

python-minor-version = $(shell python --version 2>&1 | grep -o '2\..')

install:
	mkdir -p source
	rm -rf ${source_name}
	git clone ${source_location} ${source_name}
	mkdir -p etc/bin
	cd ${source_name}; \
		PYTHONPATH=../../etc/lib/python$(python-minor-version)/site-packages/ \
		python setup.py install --prefix ../../etc

# vim: ft=make
