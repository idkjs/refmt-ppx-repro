# default : ppx_test_simple
# # take in a .re file return a .ml file.
# %.ml : %.re
# 	refmt -p ml $< > $@


# # now call %.ml on ppx_test_simple which return ppx_test_simple.re
# # the ocamlopt -o returns the result .re
# ppx_test_simple :  sample_input.ml ppx_test_simple.ml
#     # call ocamlopt -o to convert to .ml
# 	ocamlopt -o $@ $^
# 	./replace "simple_tag " simple_tag sample_input.ml 
# 	ocamlc -I +compiler-libs ocamlcommon.cma ppx_test_simple.ml -o ppx_test_simple
	# Create the executable ppx_test_simple
	# ocamlc -I +compiler-libs ocamlcommon.cma $@ $^
	# Output the original source
	# cat sample_input.re
	# Output the converted file
	# cat sample_input.ml
	# Output the modified source
	# ocamlc -dsource -ppx ./ppx_test_simple sample_input.ml -c
	# # Compile with ppx extension
	# ocamlc -ppx ./ppx_test_simple sample_input.ml -o test
	# # Run the program
	# ./test
# delete the build file including the .ml files you 
%.ml : %.re
	refmt -p ml $< > $@

all:
	ocamlopt -o $@ $^
	# ./replace "simple_tag " simple_tag sample_input.ml 
	# Create the executable ppx_test_simple
	ocamlc -I +compiler-libs ocamlcommon.cma ppx_test_simple.ml -o ppx_test_simple
	# Output the original source
	cat sample_input.ml
	# Output the modified source
	ocamlc -dsource -ppx ./ppx_test_simple sample_input.ml -c
	# Compile with ppx extension
	ocamlc -ppx ./ppx_test_simple sample_input.ml -o test
	# Run the program
	./test


clean :
	rm -f *cmo *cmi *cmx *.o *.ml ppx_test_simple