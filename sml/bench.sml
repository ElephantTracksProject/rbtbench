structure IntRBT = RedBlackTree(IntOrdered)
                 
val _ =
  let val empty = IntRBT.empty
      val bigList = List.tabulate (1000001, fn x => x)
      val tree = List.foldl IntRBT.insert empty bigList
      fun printIntList xs = print (String.concatWith "\n" (map Int.toString xs))
  in  print "Height of tree: ";
      print (Int.toString (IntRBT.height tree));
      print "\n";
      printIntList (IntRBT.inOrder tree)
  end
