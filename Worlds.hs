module Worlds
(
  World(..),
  undercityE1
) where 

import Data.Map (Map)
import qualified Data.Map as M

data World = 
  World
  { wordlName       :: String
  , episode         :: String
  , worldStory      :: String
  , nextWorlds      :: [World]
  , keywords        :: [String]
  } 
  deriving (Eq, Show)


undercityE1  :: World
undercityE1  = World "Entrañas" "Episodio 1" "Extraordinario! al fin has llegado, te he esperado por mucho tiempo. Nirvana está anciosa por conocerte. Debes viajar a Draenor ella te dará tus primeras misiones  " [draenorE2] []

draenorE2 :: World
draenorE2  = World "Draenor" "Episodio 2" "Bienvenido a Draenor, estaba anciosa por conocerte, necesito tu ayuda para estas misiones. Empieza por una de estas dos: Primera - Debes viajar a Suramar y hablar con la princesa Lina, ella te explicará." [] ["viajar", "Draenor"]