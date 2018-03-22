open Core
open Rbt

module IntRBT = RedBlackTree(IntOrdered)
       
let up_to (n: int) = 
  let rec up_to' n acc =
    match n with
    | 1 -> n::acc
    | _ -> up_to' (n-1) (n::acc)
  in up_to' n []
                            
let (empty: IntRBT.tree) = IntRBT.empty
              
let (bigList: int list) = up_to 1000000
                    
let (tree: IntRBT.tree) = List.fold_left ~init:empty ~f:(Fn.flip IntRBT.insert) bigList
                          
let print_int_list (xs: int list) = List.iter xs (Printf.printf "%d\n")

let main _ =
  Printf.printf "Height of tree: %d\n" (IntRBT.height tree);
  print_int_list (IntRBT.in_order tree);
;;


main ()
