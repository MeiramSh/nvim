;; ----------------------------------------------------------------------------
;; Literals and comments

(integer) @number
(exp_negation) @number
(exp_literal (float)) @float
(char) @character
(string) @string

(comment) @comment


;; ----------------------------------------------------------------------------
;; Punctuation
(exp_literal
  [
    (con_list)
    (con_unit)
  ] @hsconstructor
)
(type_literal
  [
    (con_list)
    (con_unit)
  ] @type
)

[
  (comma)
  ";"
] @punctuation.delimiter


;; ----------------------------------------------------------------------------
;; Keywords, operators, includes
;; "LANGUAGE" @macro

(pragma) @constant.macro

(module) @hsnamespace

[
  "forall"
  "∀"
] @repeat


[
  "if"
  "then"
  "else"
  "case"
  "of"
] @conditional

[
  "import"
  "qualified"
  "module"
] @include


[
  (operator)
  (constructor_operator)
  (type_operator)
  (tycon_arrow)
  (qualified_module)  ; grabs the `.` (dot), ex: import System.IO
  (all_names)
  (wildcard)
  "="
  "|"
  "::"
  "=>"
  "->"
  "<-"
  "\\"
  "`"
  "@"
] @hsoperator

(qualified_module (module) @constructor)
(qualified_type (module) @hsnamespace)
(qualified_variable (module) @hsnamespace)
(import (module) @hsnamespace)
[
  (where)
  "let"
  "in"
  "class"
  "instance"
  "data"
  "newtype"
  "family"
  "type"
  "as"
  "hiding"
  "deriving"
  "via"
  "stock"
  "anyclass"
  "do"
  "mdo"
  "rec"
] @keyword


;; ----------------------------------------------------------------------------
;; Functions and variables

"data" @joke


(variable) @variable

(signature name: (variable) @hstype)
(function name: (variable) @hsfunction)
(import_item (variable) @hstype)
(field (variable) @hstype)

"_" @punctuation.special

(exp_infix (variable) @hsoperator)  ; consider infix functions as operators

("@" @hsnamespace)  ; "as" pattern operator, e.g. x@Constructor


;; ----------------------------------------------------------------------------
;; Types

(type) @type

(constructor) @hsconstructor

; True or False
;;((constructor) @_bool (#match? @_bool "(True|False)")) @boolean


;; ----------------------------------------------------------------------------
;; Quasi-quotes

(quoter) @function
; Highlighting of quasiquote_body is handled by injections.scm
