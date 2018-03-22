signature ORDERED =
sig
    type T
             
    val eq : (T * T) -> bool
    val lt : (T * T) -> bool
    val leq : (T * T) -> bool
end

signature BINARYTREE =
sig
    structure Element : ORDERED
    type Elem = Element.T
                         
    type Tree

    val empty : Tree
    val member : (Elem * Tree) -> bool
    val height : Tree -> int
    val insert : (Elem * Tree) -> Tree
    val inOrder : Tree -> Elem list
end
