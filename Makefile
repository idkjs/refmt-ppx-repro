default : ppx_test_simple
# take in a .re file return a .ml file.
%.ml : %.re
	refmt -p ml $< > $@


# now call %.ml on ppx_test_simple which return ppx_test_simple.re
# the ocamlopt -o returns the result .re
ppx_test_simple :  sample_input.ml ppx_test_simple.ml
    # call ocamlopt -o to convert to .ml
	ocamlopt -o $@ $^
	# Create the executable ppx_test_simple
	# ocamlc -I +compiler-libs ocamlcommon.cma $@ $^
	# Output the original source
	cat sample_input.re
	# Output the converted file
	cat sample_input.ml
	# Output the modified source
	# ocamlc -dsource -ppx ./ppx_test_simple sample_input.ml -c
	# # Compile with ppx extension
	# ocamlc -ppx ./ppx_test_simple sample_input.ml -o test
	# # Run the program
	# ./test
# delete the build file including the .ml files you 
clean :
	rm -f *.cmi *.cmx *.ml *.o ppx_test_simple