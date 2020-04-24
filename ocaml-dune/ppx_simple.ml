open Asttypes
open Parsetree
open Ast_mapper

let my_expression_mapper mapper expr =
  match expr with
  | { pexp_desc = Pexp_extension ({txt = "simple_tag"}, PStr []) } ->
     Ast_helper.Exp.constant (Pconst_integer ("1234567890", None))
  | other -> default_mapper.expr mapper other;

let mapper_test_simple () =
  { default_mapper with expr = my_expression_mapper };

let () =
  register "simple_ppx" mapper_test_simple;