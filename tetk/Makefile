source_location = 'git@github.com:mhammell-laboratory/tetoolkit.git'
bin_name = tetoolkit

install:
	mkdir -p source
	git clone ${source_location} 'source/${bin_name}'
	mkdir -p etc/bin
	python source/${bin_name}/setup.py install --prefix etc

# vim: ft=make
