-- Autor:  Tobias Denkinger <tobias.denkinger@tu-dresden.de>
-- Benutzung:  Lade diese Datei in ghci mit: `ghci Sol03.hs`

module Sol03 where

-- * Übung 3.1

data ITree = ILeaf Int | IBranch ITree ITree deriving Show


-- ** Übung 3.1(a)

-- | an example for an `ITree` with at least 5 leaves
exampleIntTree :: ITree
exampleIntTree
  = IBranch
      (ILeaf 1)
      (
        IBranch
          (IBranch (ILeaf 2) (ILeaf 3))
          (IBranch (ILeaf 2) (ILeaf 3))
      )


-- ** Übung 3.1(b)

-- | given an `ITree`, returns the number of its leaves
countLeaves :: ITree -> Int
countLeaves (ILeaf _)
  = 1
countLeaves (IBranch t₁ t₂)
  = countLeaves t₁ + countLeaves t₂

-- | given an `ITree`, returns a list of its leaves from left to right
yield :: ITree -> [Int]
yield (ILeaf x)
  = [x]
yield (IBranch t₁ t₂)
  = yield t₁ ++ yield t₂


-- * Übung 3.2

data BTree a = BBranch a (BTree a) (BTree a) | BLeaf a deriving Show

exampleBTree :: BTree Char
exampleBTree
  = BBranch 'x'
      (BLeaf '1')
      (
        BBranch 'y'
          (BBranch 'z' (BLeaf '2') (BLeaf '3'))
          (BBranch 'z' (BLeaf '2') (BLeaf '3'))
      )


-- ** Übung 3.2(a)

-- | given a `BTree a`, returns the length of the shortest path from the root to a leaf
depth :: BTree a -> Int
depth (BLeaf _)
  = 1
depth (BBranch _ t₁ t₂)
  = (1 +) $ depth t₁ `min` depth t₂


-- ** Übung 3.2(b)

-- | given a `BTree a`, returns the label of each node with the labels along the path from the root to this node
paths :: BTree a -> BTree [a]
paths = paths' [] where
  paths' l (BLeaf a)
    = BLeaf $ l ++ [a]
  paths' l (BBranch a t₁ t₂)
    = let l' = l ++ [a]
      in BBranch l' (paths' l' t₁) (paths' l' t₂)


-- ** Übung 3.3

-- map :: (a -> b) -> [a] -> [b]
-- filter :: (a -> Bool) -> [a] -> [a]
-- foldr :: (a -> b -> b) -> b -> [a] -> b

-- | returns the product of squares of the even numbers in the given list
f :: [Int] -> Int
f = foldr (*) 1 . map (\ x -> x * x) . filter even


-- * Übung 3.4

data Tree a = Leaf a | Node a (Tree a) (Tree a) deriving Show

exampleTree :: Tree Char
exampleTree
  = Node 'x'
      (Leaf '1')
      (
        Node 'y'
          (Node 'z' (Leaf '2') (Leaf '3'))
          (Node 'z' (Leaf '2') (Leaf '3'))
      )

-- | applies a function to the label of each node of the given `Tree a`
tmap :: (a -> b) -> Tree a -> Tree b
tmap g (Leaf a)
  = Leaf $ g a
tmap g (Node a t₁ t₂)
  = Node (g a) (tmap g t₁) (tmap g t₂)


-- * Übung 3.Z1

-- * Übung 3.Z1(a)

avg :: [Double] -> Double
avg = (\ (s, z) -> s / z)
      . foldr (\ d (s, z) -> (s + d, z + 1.0)) (0.0, 0.0)
