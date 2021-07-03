module SentenceAnalyzer where

import Worlds
import Data.List

splitSentence :: String -> [String]
splitSentence "" = []
splitSentence xs = ys : (splitSentence . drop 1) zs
   where (ys, zs) = span (/=' ') xs

findVerb :: [String] ->  String
findVerb [] = "" 
findVerb (x:xs) | isSuffixOf  "ar" x || isSuffixOf  "er" x || isSuffixOf  "ir" x = x
                | otherwise = findVerb xs

isKeywordWorld :: [String]  -> [String] -> Bool 
isKeywordWorld [] _ = True
isKeywordWorld (x:xs) splitList | not (x `elem` splitList) = False
                                | otherwise = isKeywordWorld xs splitList

isContained :: [World] -> [String] -> (Maybe World,Bool) 
isContained [] _ = (Nothing , False)  
isContained _ [] = (Nothing,False)
isContained (x:xs) splitList | isKeywordWorld (keywords x) splitList = (Just x,True)  
                             | otherwise = isContained xs splitList                        

manageAnalyzer :: World -> String -> (Maybe World,Bool)
manageAnalyzer world line =  isContained (nextWorlds world) (splitSentence line)