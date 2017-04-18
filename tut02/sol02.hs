-- Autor:  Tobias Denkinger <tobias.denkinger@tu-dresden.de>
-- Benutzung:  Lade diese Datei in ghci mit: `ghci sol02.hs`

module Sol02 where

import Prelude hiding (unwords, words)

pack :: [Char] -> [[Char]]
pack [] = []
pack (x:xs) = ys : pack zs where
  (ys, zs) = takeall x xs -- takeall :: Char -> [Char] -> ([Char], [Char])
  takeall x [] = ([x], [])
  takeall x (y:ys)
    | x == y = let (us, vs) = takeall x ys
               in (y:us, vs)
    | otherwise = ([x], y:ys)

encode, encode' :: [Char] -> [(Int, Char)]
encode = e' . pack where
  e' [] = []
  e' (y:ys) = (length y, head y) : e' ys

encode' = map (\y -> (length y, head y)) . pack

decode, decode' :: [(Int, Char)] -> [Char]
decode [] = []
decode ((n, x) : xs) = times n x ++ decode xs where
  times 0 _ = []
  times n x = x : times (n - 1) x

decode' = concatMap (\(n, x) -> take n $ repeat x)

rotate :: [Int] -> Int -> [Int]
rotate [] _ = []
rotate xss@(x:xs) n
  | n `mod` length xss == 0 = xss
  | n > 0  = rotate (xs ++ [x]) (n `mod` length xss - 1)
  | otherwise = rotate xss (n `mod` length xss + length xss)
 
unwords :: [String] -> String
unwords [] = ""
unwords [x] = x
unwords (x:xs) = x ++ " " ++ unwords xs

words :: String -> [String]
words "" = []
words (' ':xs) = words xs
words xs = let (w, xs') = takeWord [] xs
           in w : words xs'
             where
               takeWord x [] = (reverse x, [])
               takeWord x yss@(' ':_) = (reverse x, yss)
               takeWord x (y:ys) = takeWord (y:x) ys

maxLength, maxLength' :: [[Int]] -> Int
maxLength xs = mL 0 xs where
  mL m [] = m
  mL m (y:ys)
    | length y > m = mL (length y) ys
    | otherwise    = mL m          ys

maxLength' = maximum . map length
