module Sections.Header exposing (Msg, headerComponent)

import Browser
import Components.Logo as Logo
import Components.Menu as Menu
import Html exposing (Html, div, header)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)


type Msg
    = MenuMsg Menu.Msg
    | HideOverlay


headerComponent : String -> Html Msg
headerComponent logo =
    header [ class "header", id "header" ]
        [ div [ class "container nav" ]
            [ Logo.logoComponent logo
            , Html.map MenuMsg Menu.menuComponent
            ]
        , div [ class "menu-overlay hide" ] []
        ]
