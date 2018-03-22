functor RedBlackTree (Value: ORDERED) : BINARYTREE =
struct

structure Element = Value
type Elem = Element.T
                        
datatype Color = RED | BLACK
datatype Tree = E
              | T of Color * Tree * Elem * Tree


val empty = E

fun member (x, E) = false
  | member (x, T (_, l, v, r)) =
    if      Element.lt (x, v) then member (x, l)
    else if Element.lt (v, x) then member (x, r)
    else    true

fun height E = 0
  | height (T (_, l, _, r)) = 1 + Int.max (height l, height r)
                
fun insert (x, t) =
  let fun balance (BLACK, T (RED, T (RED, a, x, b), y, c), z, d)   = T (RED, T (BLACK, a, x, b), y, T (BLACK, c, z, d))
        | balance (BLACK, T (RED, a, x, T (RED, b, y, c)), z, d)   = T (RED, T (BLACK, a, x, b), y, T (BLACK, c, z, d))
        | balance (BLACK, a, x, T (RED, T (RED, b, y, c), z, d))   = T (RED, T (BLACK, a, x, b), y, T (BLACK, c, z, d))
        | balance (BLACK, a, x, T (RED, b, y, T (RED, c, z, d)))   = T (RED, T (BLACK, a, x, b), y, T (BLACK, c, z, d))
        | balance body = T body
                           
      fun ins E = T (RED, E, x, E)
        | ins (s as T (color, l, v, r)) =
          if Element.lt (x, v) then balance (color, ins l, v, r)
          else if Element.lt (v, x) then balance (color, l, v, ins r)
          else s
      val T (_, l, v, r) = ins t  
  in  T (BLACK, l, v, r)
  end

fun inOrder E = []
  | inOrder (T (_, l, v, r)) = (inOrder l) @ (v::(inOrder r))

end

structure IntOrdered : ORDERED =
struct

type T = int

fun eq (a, b) = (a = b)
fun lt (a, b) = (a < b)
fun leq (a, b) = (a <= b)

end
