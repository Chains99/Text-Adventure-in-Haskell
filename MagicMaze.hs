import SentenceAnalyzer
import Worlds
import Data.Maybe


gameIntro :: IO () 
gameIntro = do
    putStrLn ">> El origen de la Horda se remonta a los antiguos clanes orcos de Draenor donde habían convididio pacíficamente con los draenei. Ner'zhul, uno de los chamanes orcos, contactó con un ente extradimensional llamado Kil'Jaeden que lo persuadió para que creyera que era un espíritu. A pesar de haber dedicado toda su vida al equilibrio y la naturaleza, Ner'zhul respondió a los cantos de sirena que el demonio le ofreció, abandonando sus enseñanzas y entregándose a una nueva senda de conocimiento: el de la brujería. Las consecuencias fueron salvajes. Una vez que hubo aprendido las técnicas más básicas de manipulación que su nueva magia le ofrecía, su fama creció entre sus coetáneos que abandonaron los viejos caminos del chamanismo y comenzaron a destruir la naturaleza a la que anteriormente habían servido."
    putStrLn ""
    putStrLn ">> Tu objetivo sera realizar las misiones para ayudar a la Horda y ganarte un renombre en los distintos mundos\n"

manageGame :: World -> IO()
manageGame (World name episode story nW kW )  =  do
    printStory name episode story
    line <- getLine
    putStrLn $ "<< " ++ line
    let processedLine = manageAnalyzer (World name episode story nW kW ) line
    if not $ snd processedLine
    then  
        manageGame (World name episode story nW kW )
    else do
        let newWorld = fst processedLine
        manageGame $ fromJust newWorld


printStory :: String -> String ->String -> IO()
printStory name episode story = do
    putStrLn $ episode ++ ": " ++ name
    putStrLn $ ">> " ++ story

main = do
    gameIntro
    manageGame undercityE1