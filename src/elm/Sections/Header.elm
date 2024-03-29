module Sections.Header exposing (Msg, headerComponent)

import Bootstrap.Grid as Grid
import Browser
import Components.Logo as Logo
import Components.Menu as Menu
import Html exposing (Html, div, header)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)


type Msg
    = MenuMsg Menu.Msg


headerComponent : String -> Html Msg
headerComponent logo =
    header [ class "header", id "header" ]
        [ Grid.container [ class "nav" ]
            [ Logo.logoComponent logo
            , Html.map MenuMsg Menu.menuComponent
            ]
        , div [ class "menu-overlay hide" ] []
        ]
