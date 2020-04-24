# Converting to .ml to .re with Makefile

Use the `-n` flag to see what the `Makefile` is trying to do without actually doing it. Known as a `dry-run`.

This our `MakeHello` makefile. Since we didn't call it `Makefile` we will use the `-f` flag to indicate which `Makefile` we want to run.

```sh
~/Github/ocaml_ppx_extension_simple_tutorial/reason master* ⇡
❯ make -n -f MakeHello
refmt -p ml hello.re > hello.ml
ocamlopt -o hello hello.ml
```