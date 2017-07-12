.SECONDEXPANSION:

# I don’t know exactly how or why the following works. However, it seems to be
# important that the leading space before the target definition is present;
# otherwise, the first word in `$1` won’t be recognised as a target name.
# Similarly, without the trailing semicolon `make` thinks the dependencies end
# in a newline (that is, to build `foo/bar` it searches for a dependency with
# the name `foo/\n`). The newline after `;`, on the other hand, is optional. It
# is left here for readability.
define dirs
 $1: | $$(dir $$@);
	mkdir $$@
endef

# Recursion stop of the above rule. If this is omitted, some systems attempt to
# build the target `./` using the default rule for C files.
./: ;

# To use, call `dirs` with a space-separated list of directories, e.g.:
#
# 	$(call dirs,foo foo/bar foo/bar/baz)
#
# Note that all parts of the path need to be present: if `foo/bar/baz` is
# included, `foo` and `foo/bar` are required as well.

# vim: ft=make
