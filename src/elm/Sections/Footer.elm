module Sections.Footer exposing (footerComponent)

import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Browser
import FontAwesome.Attributes as Icon
import FontAwesome.Brands as Icon
import FontAwesome.Icon as Icon exposing (Icon)
import FontAwesome.Layering as Icon
import FontAwesome.Solid as Icon
import FontAwesome.Styles as Icon
import FontAwesome.Svg as SvgIcon
import FontAwesome.Transforms as Icon
import Html exposing (Html, a, button, div, footer, form, h4, input, li, p, span, text, ul)
import Html.Attributes exposing (action, class, href, id, method, placeholder, target, type_)


listItems =
    [ ( Icon.facebookF |> Icon.present |> Icon.view, "https://www.facebook.com" )
    , ( Icon.twitter |> Icon.present |> Icon.view, "https://www.twitter.com" )
    , ( Icon.dribbble |> Icon.present |> Icon.styled [ Icon.pulse ] |> Icon.view, "https://www.dribbble.com" )
    , ( Icon.behance |> Icon.present |> Icon.view, "https://www.behance.com" )
    ]


listItem ( icon, menuLink ) =
    li [] [ a [ href menuLink ] [ icon ] ]


socialIcons =
    ul [ class "footer-social" ] (List.map listItem listItems)


footerSectionHeading : String -> Html msg
footerSectionHeading title =
    h4 [ class "footer-section-title" ] [ text title ]


footerSectionText : String -> Html msg
footerSectionText title =
    p [ class "footer-section-text" ] [ text title ]


newsLetterForm : Html msg
newsLetterForm =
    form [ action "/", target "_blank", method "get", class "news-letter-form" ]
        [ div [ class "input-group" ]
            [ input [ type_ "email", placeholder "Enter Email Address", id "news-letter-input", class "form-control" ] []
            , button
                [ type_ "submit", class "btn" ]
                [ Icon.arrowRight |> Icon.present |> Icon.view ]
            ]
        ]


footerSectionOne : Html msg
footerSectionOne =
    div [ class "section-wrapper" ]
        [ footerSectionHeading "About Me"
        , footerSectionText "We have tested a number of registry fix and clean utilities and present our top 3 list on our site for your convenience."
        , p [ class "footer-section-text heart-section" ] [ span [] [ text "Copyright ©2019 All rights reserved | This template is made with" ], Icon.heart |> Icon.present |> Icon.view, span [] [ text "by " ], a [ href "/" ] [ text "Colorlib" ] ]
        ]


footerSectionTwo : Html msg
footerSectionTwo =
    div [ class "section-wrapper" ]
        [ footerSectionHeading "Newsletter"
        , footerSectionText "Stay updated with our latest trends"
        , newsLetterForm
        ]


footerSectionThree : Html msg
footerSectionThree =
    div [ class "section-wrapper" ]
        [ footerSectionHeading "Follow Me"
        , footerSectionText "Let us be social"
        , socialIcons
        ]


footerSectionGrid : Html msg
footerSectionGrid =
    Grid.container []
        [ Grid.row []
            [ Grid.col [ Col.lg5, Col.md6, Col.sm6 ] [ footerSectionOne ]
            , Grid.col [ Col.lg5, Col.md6, Col.sm6 ] [ footerSectionTwo ]
            , Grid.col [ Col.lg2, Col.md6, Col.sm6 ] [ footerSectionThree ]
            ]
        ]


footerComponent : Html msg
footerComponent =
    footer [ class "footer", id "footer" ]
        [ footerSectionGrid
        ]
