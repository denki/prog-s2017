-- Autor:  Tobias Denkinger <tobias.denkinger@tu-dresden.de>
-- Benutzung:  Lade diese Datei in ghci mit: `ghci sol03.hs`

module Sol03 where

-- * Übung 3.1

data ITree = ILeaf Int | IBranch ITree ITree


-- ** Übung 3.1(a)

-- | an example for an `ITree` with at least 5 leaves
exampleIntTree :: ITree
exampleIntTree = undefined


-- ** Übung 3.1(b)

-- | given an `ITree`, returns the number of its leaves
countLeaves :: ()
countLeaves = undefined

-- | given an `ITree`, returns a list of its leaves from left to right
yield :: ()
yield = undefined


-- * Übung 3.2

data BTree a = BBranch a (BTree a) (BTree a) | BLeaf a


-- ** Übung 3.2(a)

-- | given a `BTree a`, returns the length of the shortest path from the root to a leaf
depth :: BTree a -> Int
depth = undefined


-- ** Übung 3.2(b)

-- | given a `BTree a`, returns the label of each node with the labels along the path from the root to this node
paths :: BTree a -> BTree [a]
paths = undefined


-- ** Übung 3.3

-- map :: (a -> b) -> [a] -> [b]
-- filter :: (a -> Bool) -> [a] -> [a]
-- foldr :: (a -> b -> b) -> b -> [a] -> b

-- | returns the product of squares of the even numbers in the given list
f :: [Int] -> Int
f = undefined


-- * Übung 3.4

data Tree a = Leaf a | Node a (Tree a) (Tree a)

-- | applies a function to the label of each node of the given `Tree a`
tmap :: (a -> b) -> Tree a -> Tree b
tmap = undefined
