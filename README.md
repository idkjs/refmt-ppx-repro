# refmt example

Running `make` will convert the `.re` file to `.ml`.

```sh
~/Github/refmt-ppx-repro
❯ make
refmt -p ml sample_input.re > sample_input.ml
refmt -p ml ppx_test_simple.re > ppx_test_simple.ml
ocamlopt -o ppx_test_simple sample_input.ml ppx_test_simple.ml
File "sample_input.ml", line 1, characters 30-40:
1 | let _ = Printf.printf "%d" ([%simple_tag ])
                                  ^^^^^^^^^^
Error: Uninterpreted extension 'simple_tag'.
make: *** [ppx_test_simple] Error 2
```

Note the extra space after `simple_tag`

```ocaml
let _ = Printf.printf "%d" ([%simple_tag ])
```

If you manually correct it and run `make -f MakeTest` the program runs to completion.

I guess `refmt` is not reading the `ppx` hole correctly?