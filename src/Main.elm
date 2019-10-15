module Main exposing (..)

import Browser
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (class, src)
import Sections.Header as Header


type alias Flags =
    { images : { logo : String } }



---- MODEL ----


type alias Model =
    { images : { logo : String }
    }


initModel : Model
initModel =
    { images = { logo = "" } }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { initModel | images = flags.images }, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ Header.headerComponent model.images.logo
        ]



---- PROGRAM ----


main : Program Flags Model Msg
main =
    Browser.element
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
