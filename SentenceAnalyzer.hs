module SentenceAnalyzer where

import Worlds
import Data.List 
import Data.Char 

splitSentence :: String -> [String]
splitSentence "" = []
splitSentence xs = ys : (splitSentence . drop 1) zs
   where (ys, zs) = span (/=' ') xs

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
manageAnalyzer world line =  isContained (nextWorlds world) (splitSentence $ map toLower line)