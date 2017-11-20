import Html exposing (Html, text, div)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Mouse exposing (..)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias Model = {
  x: Int
  , y : Int
}

initialModel: Model
initialModel =
  { x = 0
  , y = 0
  }

init : (Model, Cmd Msg)
init =
  (initialModel, Cmd.none)

-- UPDATE

type Msg
  = Position Int Int

update: Msg -> Model -> (Model, Cmd a)
update msg model =
  case msg of
    Position x y ->
      let
        log = Debug.log "x: " x
        log2 = Debug.log "y: " y
      in
        ({model | x = x, y = y} , Cmd.none)

-- SUBSCRIPTIONS

subscriptions: Model -> Sub Msg
subscriptions model =
  Mouse.moves (\{x, y} -> Position x y)

-- VIEW

view: Model -> Html Msg
view model =
  let
    x =
      toString model.x
    y =
      toString model.y
  in
    svg [ viewBox "0 0 1000 1000", width "1000px" ]
      [
        circle [ cx x, cy y, r "45", fill "#0B79CE" ] []
      ]
