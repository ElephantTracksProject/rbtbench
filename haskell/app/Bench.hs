module Main (main) where

import qualified RedBlackTree

main :: IO ()
main = do
  let rbt = foldl (flip RedBlackTree.insert) RedBlackTree.E [1..1000000]
  putStr "Height of tree: "
  print (RedBlackTree.height rbt)
  mapM_ print (RedBlackTree.inOrder rbt)
