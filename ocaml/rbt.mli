module type OrderedType = sig
  type t
  val compare : t -> t -> int
end
                            
module type BinaryTree =
  sig
    type t
    type tree
    val empty : tree
    val member : t -> tree -> bool
    val height : tree -> int
    val insert : t -> tree -> tree
    val in_order : tree -> t list
  end
    
module IntOrdered : sig
  type t = int
  val compare : t -> t -> int
end

module RedBlackTree :
  functor (Val : OrderedType) ->
    sig
      type t = Val.t
      type tree
      val empty : tree
      val member : t -> tree -> bool
      val height : tree -> int
      val insert : t -> tree -> tree
      val in_order : tree -> t list
    end
