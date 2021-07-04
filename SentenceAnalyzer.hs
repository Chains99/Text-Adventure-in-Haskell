module SentenceAnalyzer where

import Worlds
import Data.Maybe
import qualified Data.Map as Map
import Data.Char
import Synonyms

splitSentence :: String -> [String]
splitSentence "" = []
splitSentence xs = ys : (splitSentence . drop 1) zs
   where (ys, zs) = span (/=' ') xs

isKeywordWorld :: [String]  -> [String] -> Bool 
isKeywordWorld [] _ = True
isKeywordWorld (x:xs) splitList | ( isNotElem && isNothing value) || (isNotElem && isJust value && not (inCommon splitList (fromJust value) ))= False
                                | otherwise = isKeywordWorld xs splitList
                                where value =  Map.lookup x allSynonyms
                                      isNotElem = x `notElem` splitList

inCommon :: [String] -> [String] -> Bool 
inCommon [] _ = False 
inCommon _ [] = False 
inCommon (x:xs) syn |  x `elem` syn = True 
                    | otherwise  = inCommon xs syn
                                   
isContained :: [World] -> [String] -> (Maybe World,Bool) 
isContained [] _ = (Nothing , False  )  
isContained _ [] = (Nothing, False)
isContained (x:xs) splitList | isKeywordWorld (keywords x) splitList = (Just x,True)  
                             | otherwise = isContained xs splitList                        

manageAnalyzer :: World -> String -> (Maybe World,Bool)
manageAnalyzer world line = do
   let nextW = nextWorlds world
   case nextW of
         []  -> (Nothing , True )
         _   -> isContained nextW (splitSentence $ map toLower line)