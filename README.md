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


Here is the `ast`:

```sh
~/Github/refmt-ppx-repro master*
❯ refmt sample_input.re --print=ast
[
  structure_item (sample_input.re[1,0+0]..[1,0+41]) ghost
    Pstr_value Nonrec
    [
      <def>
        pattern (sample_input.re[1,0+4]..[1,0+5])
          Ppat_any
        expression (sample_input.re[1,0+8]..[1,0+41])
          Pexp_apply
          expression (sample_input.re[1,0+8]..[1,0+21])
            Pexp_ident "Printf.printf" (sample_input.re[1,0+8]..[1,0+21])
          [
            <arg>
            Nolabel
              expression (sample_input.re[1,0+22]..[1,0+26])
                attribute "reason.raw_literal"
                  [
                    structure_item (_none_[0,0+-1]..[0,0+-1]) ghost
                      Pstr_eval
                      expression (_none_[0,0+-1]..[0,0+-1]) ghost
                        Pexp_constant PConst_string("%d",None)
                  ]
                Pexp_constant PConst_string("%d",None)
            <arg>
            Nolabel
              expression (sample_input.re[1,0+27]..[1,0+40])
                Pexp_extension "simple_tag"
                []
          ]
    ]
]

~/Github/refmt-ppx-repro master*
❯ 
```