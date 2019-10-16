module Main exposing (..)

import Browser
import Components.Dummy as Dummy
import Html exposing (Html, button, div, h1, img, text)
import Html.Attributes exposing (class, id, src, type_)
import Html.Events exposing (onClick)
import Ports
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
    ( { initModel | images = flags.images }, Ports.common () )



---- UPDATE ----


type Msg
    = HeaderMsg Header.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        HeaderMsg headerMsg ->
            ( model, Ports.handleNav () )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ Html.map HeaderMsg (Header.headerComponent model.images.logo)
        , div [ class "leave-header" ] []
        , Dummy.dummyComponent
        , div [ class "overlay hide", id "overlay" ] []
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
