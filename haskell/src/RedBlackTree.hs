module RedBlackTree
  ( Tree(..)
  , member
  , insert
  , height
  , inOrder
  )
where

data Color = Red | Black
data Tree a = E
            | T Color (Tree a) a (Tree a)

member :: Ord a => a -> Tree a -> Bool
member _ E = False
member x (T _ l v r)
  | x < v  = member x l
  | x == v = True
  | x > v  = member x r

insert :: Ord a => a -> Tree a -> Tree a
insert x t = case ins t of
                T _ l v r -> T Black l v r
  where
    ins E = T Red E x E
    ins (T color l v r)
      | x < v     = balance color (ins l) v r
      | x > v     = balance color l v (ins r)
      | otherwise = T color l v r

balance :: Ord a => Color -> Tree a -> a -> Tree a -> Tree a
balance Black (T Red (T Red a x b) y c) z d = T Red (T Black a x b) y (T Black c z d)
balance Black (T Red a x (T Red b y c)) z d = T Red (T Black a x b) y (T Black c z d)
balance Black a x (T Red (T Red b y c) z d) = T Red (T Black a x b) y (T Black c z d)
balance Black a x (T Red b y (T Red c z d)) = T Red (T Black a x b) y (T Black c z d)
balance c l v r = T c l v r

height :: Ord a => Tree a -> Integer
height E = 0
height (T _ l _ r) = 1 + max (height l) (height r)

inOrder :: Ord a => Tree a -> [a]
inOrder E = []
inOrder (T _ l x r) = inOrder l ++ (x:inOrder r)
