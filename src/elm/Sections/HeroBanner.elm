module Sections.HeroBanner exposing (heroBannerComponent)

import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row
import Browser
import Html exposing (Html, a, div, h1, h6, img, p, section, text)
import Html.Attributes exposing (alt, class, href, id, src)


heroBannerLeft : Html msg
heroBannerLeft =
    div [ class "banner-left" ]
        [ h6 [ class "text-uppercase" ]
            [ text "This is me" ]
        , h1 [ class "text-uppercase" ]
            [ text "Philip Gilbert" ]
        , p []
            [ text "You will begin to realise why this exercise is called the Dickens Pattern with reference to the ghost showing Scrooge some different futures." ]
        , a [ href "#", class "primary-btn text-uppercase" ] [ text "Discover Now" ]
        ]


heroBannerRight : String -> Html msg
heroBannerRight image =
    div [ class "banner-right" ]
        [ img [ src image, alt "Hero Banner", class "img-fluid" ] []
        ]


heroBannerGrid : String -> Html msg
heroBannerGrid image =
    Grid.container []
        [ Grid.row [ Row.betweenXs, Row.middleXs ]
            [ Grid.col [ Col.lg6, Col.md6 ]
                [ heroBannerLeft
                ]
            , Grid.col [ Col.lg6, Col.md6 ]
                [ heroBannerRight image
                ]
            ]
        ]


heroBannerComponent : String -> Html msg
heroBannerComponent image =
    section [ class "hero-banner", id "home" ]
        [ heroBannerGrid image
        ]
