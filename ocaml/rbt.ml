open Core

module type OrderedType = sig
  type t
  val compare: t -> t -> int
end

module type BinaryTree = sig
  type t               
  type tree
         
  val empty : tree
  val member : t -> tree -> bool
  val height : tree -> int
  val insert : t -> tree -> tree
  val in_order : tree -> t list
end

module IntOrdered : (OrderedType with type t = int) = struct
  type t = int
  let compare a b =
    if a > b then 1
    else if a < b then -1
    else 0
end

module RedBlackTree(Val : OrderedType) : (BinaryTree with type t = Val.t) = struct

  type t = Val.t

  type color = Red | Black
  type tree =
      E
    | T of color * tree * t * tree

  let empty = E

  let rec member x t =
    match t with
    | E -> false
    | T (_, l, v, _) when Val.compare x v < 0 -> member x l
    | T (_, _, v, _) when Val.compare x v = 0 -> true
    | T (_, _, v, r) when Val.compare x v > 0 -> member x r

  let rec height = function
    | E -> 0
    | T (_, l, _, r) -> 1 + max (height l) (height r)

  let insert x t =
    let balance c l v r =
      match (c, l, v, r) with
      | (Black, T (Red, T (Red, a, x, b), y, c), z, d)
      | (Black, T (Red, a, x, T (Red, b, y, c)), z, d)
      | (Black, a, x, T (Red, T (Red, b, y, c), z, d))
      | (Black, a, x, T (Red, b, y, T (Red, c, z, d))) -> T (Red, T (Black, a, x, b), y, T (Black, c, z, d))
      | (c, l, v, r) -> T (c, l, v, r)
    in
    let rec ins = function
      | E -> T (Red, E, x, E)
      | T (color, l, v, r) as s->
         if Val.compare x v < 0 then balance color (ins l) v r
         else if Val.compare x v > 0 then balance color l v (ins r)
         else s
    in let T (_, l, v, r) = ins t in 
       T (Black, l, v, r)

  let rec in_order = function
    | E -> []
    | T (_, l, v, r) -> (in_order l) @ (v :: (in_order r))
end
