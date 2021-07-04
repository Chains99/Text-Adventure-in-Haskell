module Synonyms (
    allSynonyms
    ) where

import Data.Map (Map)
import qualified Data.Map as Map


allSynonyms :: Map String [String]
allSynonyms = Map.fromList
    [("tomar" ,["tomar", "coger", "asir", "agarrar", "atrapar"]), 
    ("hablar" ,["hablar", "conversar", "dialogar", "charlar", "platicar"]),
    ("viajar" ,["viajar", "trasladar", "explorar",  "navegar", "ir"]),
    ("luchar" ,["enfrentar", "pelear", "confrontar", "encarar", "carear", "oponer", "contender", "pelear", "luchar", "combatir", "desafiar", "rivalizar"]),
    ("ayudar" ,["ayudar", "auxiliar", "asistir", "apoyar", "cooperar", "coadyuvar", "contribuir"]),
    ("acercarme" ,["acercarse"]),
    ("comprar" ,["adquirir","negociar", "comerciar"]),
    ("regresar" ,["volver","retornar" ]),
    ("lado" ,["parte","costado","ala","banda","flanco" ]),
    ("usar" ,["emplear","utilizar" ])]
    

