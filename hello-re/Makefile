# https://github.com/aeternity/aesophia/blob/master/test/contracts/Makefile
default : hello
# take in a .re file return a .ml file.
%.ml : %.re
	refmt -p ml $< > $@


# now call %.ml on hello which return hello.re
# the ocamlopt -o returns the result .re
hello :  hello.ml goodbye.ml
	ocamlopt -o $@ $^
	# Output the original source
	cat hello.re
	# Output the converted file
	cat hello.ml
	# Output the converted file
	cat goodbye.ml
	# Delete the original source to show its not the file
	# we are calling.
	# rm -f hello.re
	# Run the program
	./hello
# delete the build file including the .ml files you 
clean :
	rm -f *.cmi *.cmx *.ml *.o hello