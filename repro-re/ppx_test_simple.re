open Asttypes;
open Parsetree;
open Ast_mapper;

let my_expression_mapper = (mapper, expr) =>
  switch (expr) {
  | {
      pexp_desc:
        [@implicit_arity] Pexp_extension({txt: "simple_tag"}, PStr([])),
    } =>
    Ast_helper.Exp.constant(
      [@implicit_arity] Pconst_integer("1234567890", None),
    )
  | other => default_mapper.expr(mapper, other)
  };

let mapper_test_simple = argv => {
  ...default_mapper,
  expr: my_expression_mapper,
};

let () = register("ppx_test_simple", mapper_test_simple);
