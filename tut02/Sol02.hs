-- Autor:  Tobias Denkinger <tobias.denkinger@tu-dresden.de>
-- Benutzung:  Lade diese Datei in ghci mit: `ghci Sol02.hs`

module Sol02 where

import Prelude hiding (unwords, words)

-- * Übung 1.1

-- ** Übung 1.1(a)

-- | Fasst eine Liste aufeinanderfolgender Wiederholungen des gleichen Wertes in eine Teilliste zusammen.
pack :: [Char] -> [[Char]]
pack [] = []
pack (x:xs) = ys : pack zs where
  (ys, zs) = takeall x xs -- takeall :: Char -> [Char] -> ([Char], [Char])
  takeall x [] = ([x], [])
  takeall x (y:ys)
    | x == y = let (us, vs) = takeall x ys
               in (y:us, vs)
    | otherwise = ([x], y:ys)


-- ** Übung 1.1(b)

-- | Lauflängenkodiert eine Liste.
encode, encode' :: [Char] -> [(Int, Char)]
encode = e' . pack where
  e' [] = []
  e' (y:ys) = (length y, head y) : e' ys

encode' = map (\y -> (length y, head y)) . pack


-- ** Übung 1.1(c)

-- | Dekodiert eine lauflängenkodierte Liste.
decode, decode' :: [(Int, Char)] -> [Char]
decode [] = []
decode ((n, x) : xs) = times n x ++ decode xs where
  times 0 _ = []
  times n x = x : times (n - 1) x

decode' = concatMap (\(n, x) -> take n $ repeat x)


-- ** Übung 1.1(d)

-- | Rotiert die gegebene Liste um die gegebene Anzahl von Elementen nach links.
rotate :: [Int] -> Int -> [Int]
rotate [] _ = []
rotate xss@(x:xs) n
  | n `mod` length xss == 0 = xss
  | n > 0  = rotate (xs ++ [x]) (n `mod` length xss - 1)
  | otherwise = rotate xss (n `mod` length xss + length xss)


-- * Übung 1.2

-- ** Übung 1.2(a)

-- | Fügt Wörter der gegebenen Liste zu einem `String` zusammen, in dem die Wörter durch ein Leerzeichen getrennt sind.
unwords :: [String] -> String
unwords [] = ""
unwords [x] = x
unwords (x:xs) = x ++ " " ++ unwords xs


-- ** Übung 1.2(b)

-- | Zerlegt den gegebene `String` in seine Wörter.
words :: String -> [String]
words "" = []
words (' ':xs) = words xs
words xs = let (w, xs') = takeWord [] xs
           in w : words xs'
             where
               takeWord x [] = (reverse x, [])
               takeWord x yss@(' ':_) = (reverse x, yss)
               takeWord x (y:ys) = takeWord (y:x) ys


-- * Übung 1.3

-- ** Übung 1.3(b)

-- | Gibt die maximale Länge eine `[Int]`-Liste in der gegebenen `[[Int]]`-Liste zurück.
maxLength, maxLength' :: [[Int]] -> Int
maxLength xs = mL 0 xs where
  mL m [] = m
  mL m (y:ys)
    | length y > m = mL (length y) ys
    | otherwise    = mL m          ys

maxLength' = maximum . map length
