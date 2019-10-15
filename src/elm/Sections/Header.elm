module Sections.Header exposing (headerComponent)

import Browser
import Components.Logo as Logo
import Components.Menu as Menu
import Html exposing (Html, div, header)
import Html.Attributes exposing (class)


headerComponent : String -> Html msg
headerComponent logo =
    header [ class "header header-scrolled" ]
        [ div [ class "container nav" ]
            [ Logo.logoComponent logo
            , Menu.menuComponent
            ]
        ]
