module Main exposing (..)

import Browser
import Components.Dummy as Dummy
import Html exposing (Html, button, div, h1, img, text)
import Html.Attributes exposing (class, id, src, type_)
import Html.Events exposing (onClick)
import Ports
import Sections.About as About
import Sections.Footer as Footer
import Sections.Header as Header
import Sections.HeroBanner as HeroBanner


type alias Flags =
    { images :
        { logo : String
        , heroBanner : String
        , aboutImage : String
        }
    }



---- MODEL ----


type alias Model =
    { images : { logo : String, heroBanner : String, aboutImage : String }
    }


initModel : Model
initModel =
    { images = { logo = "", heroBanner = "", aboutImage = "" } }


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
        , HeroBanner.heroBannerComponent model.images.heroBanner
        , About.aboutComponent model.images.aboutImage
        , div [ class "overlay hide", id "overlay" ] []
        , Footer.footerComponent
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
