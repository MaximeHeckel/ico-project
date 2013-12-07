type primitive =
  | Write
  | Writeln
  | Readln
  | Alloc

type calle =
  | CUserFunction of string
  | CPrimitiveFunction of primitive
