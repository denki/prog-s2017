-- Autor:  Tobias Denkinger <tobias.denkinger@tu-dresden.de>
-- Benutzung:  Lade diese Datei in ghci mit: `ghci sol01.hs`

module Sol01 where

import Prelude hiding (rem, product)

-- * Übung 1.1

-- | Fakultät der gegebenen Zahl (durch Rekursion)
fac :: Int -> Int
fac 0 = 1
fac n = n * fac (n - 1)

-- | Fakultät der gegebenen Zahl (mit Prelude-Funktion `prod`)
fac' :: Int -> Int
fac' n = prod [1 .. n]

-- | Summe der Fakultäten der Zahlen von `n` bis `m` (durch Rekursion)
sumFacs :: Int -> Int -> Int
sumFacs n m
  | n > m     = 0
  | otherwise = fac n + sumFacs (n + 1) m

-- | Summe der Fakultäten der Zahlen von `n` bis `m` (durch Listen-Comprehension)
sumFacs' :: Int -> Int -> Int
sumFacs' n m = sum [fac i | i <- [n .. m]]


-- * Übung 1.2

-- | `i`-te Zahl der Fibonaccifolge (naiv)
fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib i = fib (i - 2) + fib (i - 1)

-- | `i`-te Zahl der Fibonaccifolge (optimiert)
fib' :: Int -> Int
fib' n = go 1 1 n where
  go :: Int -> Int -> Int -> Int
  go x _ 0  = x
  go x y n' = go y (x + y) (n' - 1)


-- * Übung 1.3

-- | Produkt der Zahlen der gegebenen Liste
prod :: [Int] -> Int
prod []     = 1
prod (i:is) = i * prod is

-- | Umkehrung der gegebenen Liste (naiv)
rev :: [a] -> [a]
rev []     = []
rev (x:xs) = rev xs ++ [x]

-- | Umkehrung der gegebenen Liste (optimiert)
rev' :: [a] -> [a]
rev' zs = go zs [] where
  go []     ys = ys
  go (x:xs) ys = go xs (x:ys)

-- | Entfernt alle Einträge `x` aus der gegebenen Liste
rem :: Eq a => a -> [a] -> [a]
rem _ [] = []
rem x (y:ys)
  | x == y    =     rem x ys
  | otherwise = y : rem x ys

-- | Gibt `True` zurück, wenn die Liste aufsteigend sortiert ist, sonst `False`
isOrd :: Ord a => [a] -> Bool
isOrd []     = True
isOrd (z:zs) = go z zs where
  go _ []       = True
  go x (y:ys)
    | x <= y    = go y ys
    | otherwise = False

