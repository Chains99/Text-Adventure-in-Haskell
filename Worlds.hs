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
  , actionWorld     :: String
  , nextWorlds      :: [World]
  , keywords        :: [String]
  } 
  deriving (Eq, Show)

--Episode 1
undercityE1  :: World
undercityE1  = World "Entrañas" "Episodio 1" "Extraordinario! al fin has llegado, te he esperado por mucho tiempo. Sylvanas está anciosa por conocerte. Debes viajar a Draenor ella te dará tus primeras misiones " "" [draenorE2] []

--Episode 2
draenorE2 :: World
draenorE2  = World "Draenor" "Episodio 2" "Bienvenido a Draenor, estaba anciosa por conocerte, necesito tu ayuda para estas misiones. Escoge una de estas dos:\n 1 - Debes viajar a Suramar y hablar con la princesa Lina, ella te explicará.\n 2 - Debes ir a Claros de Tristral y encontrar el collar de escama de Dragón en el fondo del río" "Viajando a Draenor..." [clarosdeTristalE3,suramarE3] ["viajar", "draenor"]

--Episode 3
clarosdeTristalE3 :: World
clarosdeTristalE3  = World "Claros de Tristal" "Episodio 3" "Bienvenido a Claros de Tristal. Cerca del río se encuentra un granjero talando árboles. Te mira detenidamente, al parecer quiere decirte algo, debes acercarte a él" "Yendo a Claros de Tristal..." [clarosdeTristalE4] ["viajar", "claros" , "tristal"]

suramarE3 :: World
suramarE3  = World "Suramar" "Episodio 3" "Holaaaaaaaaa?! A dónde me habrá llevado ese portal? pffff... Se acerca una joven hermosa y respode:\n -Hola estás en Suramar, a quién buscas?" "Viajando a Suramar..." [suramarE4] ["viajar", "suramar" ]

--Episode 4
suramarE4 :: World
suramarE4  = World "Suramar" "Episodio 4" "Aquí estoy, soy yo. Mmm y tu has de ser el joven enviado por Sylvanas para las nuevas misiones.\n Estaba impaciente por conocerte me han hablado muy bien de ti. Bueno..., mejor conversamos otro día que la guerra a penas comienza. \n Esta es tu nueva misión: \n -Regresa con Sylvanas y entrega este pergamino. Por favor cuídalo si la Alianza lo descubre estaremos perdidos" "Joven hermosa oyendo tu respuesta..." [suramarE5] ["princesa", "lina" ]

clarosdeTristalE4 :: World
clarosdeTristalE4 = World "Claros de Tristal" "Episodio 4" "He encontrado esto en el fondo del río, parece ser un collar de valor, te lo vendo por 20 monedas de oro, a menos que vayas al otro lado del río y recojas 5 Flores Sangrientas para mi" "Caminando hacia el granjero..." [clarosdeTristalE5_1,clarosdeTristalE5_2] ["acercarme", "granjero"]

--Episode 5
clarosdeTristalE5_1 :: World
clarosdeTristalE5_1 = World "Claros de Tristal" "Episodio 5" "Tratas de robarme? Esta bolsa solo trae monedas de bronce..., ahora por intentar robarme no te doy la bolsa si no vas al otro lado del río y traes lo que te pedí" "Comprando el collar..." [clarosdeTristalE5_2] ["comprar", "collar"]

clarosdeTristalE5_2 :: World
clarosdeTristalE5_2 = World "Claros de Tristal" "Episodio 5" "Hay exactamente 5 Flores Sangrientas" "Cruzando el río..." [clarosdeTristalE6] ["viajar", "otro", "lado", "rio"]

suramarE5 :: World
suramarE5 = World "Suramar" "Episodio 5" "Saliendo de Suramar aparecen 5 elfos de la noche en menos de 1 segundo, todos con monturas y poderosos trajes, debes luchar por tu vida y por ese pergamino que llevas, perderlo podría significar el fin de los mundos" "Regresando a Draenor" [suramarE6] ["regresar","sylvanas"]

--Episode 6
clarosdeTristalE6 :: World
clarosdeTristalE6 = World "Claros de Tristal" "Episodio 6" "Ahora estamos a mano. Continúa tu camino y recuerda ¡Todo Por la Horda!\n Has recuperado el collar deber volver con Sylvanas y completar la misión" "Entregando las flores... " [draenorE7] ["tomar","flores"]

suramarE6 :: World
suramarE6 = World "Suramar" "Episodio 6" "Te has desmayado y has perdido el pergamino. Medio borroso se acerca alguien y preguntas ¿Quién eres?. Ella responde: \n Soy yo, Lina, la guerra ha comenzado Sylvanas necesita tu ayuda. Usa esta piedra, te transportá al portal más cercano a la guerra en Dalarán" "Regresando a Draenor" [dalaranE9] ["luchar"]

--Episode 7
draenorE7 :: World
draenorE7 = World "Draenor" "Episodio 7" "Hola me alegra saber que estás vivo, ya puedes completar la misión.\n Tu próxima misión es viajar Ogrimar y matar al jefe de la aldea y entregarme su cabeza " "Regresando a Draenor..." [ogrimarE8] ["regresar","sylvanas"]

--Episode 8
ogrimarE8 :: World
ogrimarE8 = World "Ogrimar" "Episodio 8" "El mercader de la ciudad viene corriendo hacia a ti gritando: ¡No te vayas! Al llegar a ti habla agitadamente, dice:\n - La alianza está atacando en Dalarán debes ayudar a Sylvanas, usa esta piedra, te transportá al portal más cercano a la guerra en Dalarán" "Viajando a Ogrimar..." [dalaranE9] ["viajar", "ogrimar"]

--Episode 9
dalaranE9 :: World
dalaranE9 = World "Dalarán" "Episodio 9" "Ayudaaaaaaaaaa, desde lejos sientes la voz de Sylvanas, por otro lado el jefe de la Alianza lucha con uno de los orcos, y deja caer su cetro mágico. En tu interior piensas:\n -Si lo tuviese fuera el jefe más poderoso de la Horda, Sylvanas no reinaría más\n. - No se que hacer, conciencia mía, ayúdame a decidir" "Transportándose a Dalarán" [dalaranE10_1,dalaranE10_2] ["usar", "piedra" ]

--Episode 10 Final
dalaranE10_1 :: World
dalaranE10_1 = World "Dalarán" "Episodio 10" "Has salvado la vida de Sylvanas, y en ese exacto momento grita ¡Por la Horda!, y cuando todos pensaban que ya no quedaban fuerzas, esta consigna denotó esa reserva de energía en sus interiores, permitiendo que ganasen la guerra en menos de 10 minutos. Todos corrieron a abrazarte, ganaste ese renombre que tanto buscabas, de ahora en lo adelante serás reconocido como el héroe de Azeroth.\n\n Continuará...  " "Corriendo a salvar a Sylvanas..." [] ["ayudar", "sylvanas" ]

dalaranE10_2 :: World
dalaranE10_2 = World "Dalarán" "Episodio 10" "Has robado el cetro, y lo peor es que has desatado el más oscuros de los poderes en contra de la Horda, Sylvanas ha muerto, la mayoría del ejército ahora pertenece a la Alianza. Una lástima todos te recordarán como un traidor. La Horda ha perdido la batalla de Azeroth." "Tomando el cetro..." [] ["tomar", "cetro" ]