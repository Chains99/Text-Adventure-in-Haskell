module SentenceAnalyzer where

import Worlds
import Synonyms
import Data.List 
import Data.Char 
import Data.Maybe
import Data.Map (Map)
import qualified Data.Map as Map

splitSentence :: String -> [String]
splitSentence "" = []
splitSentence xs = ys : (splitSentence . drop 1) zs
   where (ys, zs) = span (/=' ') xs

isKeywordWorld :: [String]  -> [String] -> Bool 
isKeywordWorld [] _ = True
isKeywordWorld (x:xs) splitList | (notElem x splitList && isNothing value) || (not (isNothing value) && notElem x (fromJust value))= False
                                | otherwise = isKeywordWorld xs splitList
                                where value =  Map.lookup x allSynonyms
                                   

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