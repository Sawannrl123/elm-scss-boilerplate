module Sections.About exposing (aboutComponent)

import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row
import Browser
import Html exposing (Html, a, div, h2, h6, img, p, section, text)
import Html.Attributes exposing (alt, class, href, id, src)


aboutRight : Html msg
aboutRight =
    div [ class "home-about-right" ]
        [ h6 [ class "text-uppercase" ]
            [ text "About Me" ]
        , h2 [ class "text-uppercase" ]
            [ text "Personal Details" ]
        , p []
            [ text "Here, I focus on a range of items and features that we use in life without giving them a second thought. such as Coca Cola. Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco." ]
        , a [ href "#", class "primary-btn text-uppercase" ] [ text "View Full Details" ]
        ]


aboutLeft : String -> Html msg
aboutLeft image =
    div [ class "home-about-left" ]
        [ img [ src image, alt "About Image", class "img-fluid" ] []
        ]


aboutGrid : String -> Html msg
aboutGrid image =
    Grid.container []
        [ Grid.row [ Row.betweenXs, Row.middleXs ]
            [ Grid.col [ Col.lg6, Col.md6 ]
                [ aboutLeft image
                ]
            , Grid.col [ Col.lg5, Col.md6 ]
                [ aboutRight
                ]
            ]
        ]


aboutComponent : String -> Html msg
aboutComponent image =
    section [ class "home-about pt-120", id "about" ]
        [ aboutGrid image
        ]
