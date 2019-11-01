module Components.Menu exposing (Msg, menuComponent)

import Browser
import Html exposing (Html, a, div, input, label, nav, span, text)
import Html.Attributes exposing (alt, class, classList, for, href, id, title, type_)
import Html.Events exposing (onClick)


type Msg
    = HandleNav


type alias Menu =
    { name : String
    , menuLink : String
    }


type alias Payload =
    List Menu


menu : Payload
menu =
    [ { name = "Home"
      , menuLink = "#home"
      }
    , { name = "About"
      , menuLink = "#about"
      }
    , { name = "Services"
      , menuLink = "#services"
      }
    , { name = "Portfolio"
      , menuLink = "#portfolio"
      }
    , { name = "Pricing"
      , menuLink = "#pricing"
      }
    , { name = "Blog"
      , menuLink = "#blog"
      }
    , { name = "Pages"
      , menuLink = "#pages"
      }
    , { name = "Contact"
      , menuLink = "#contact"
      }
    ]


menuComponent : Html Msg
menuComponent =
    div [ class "menu" ]
        [ input [ type_ "checkbox", id "hamburger" ] []
        , label [ for "hamburger", id "navButton", onClick HandleNav ]
            (List.map hamBurger [ 1, 2, 3 ])
        , menuList
        ]


hamBurger : Int -> Html msg
hamBurger index =
    span [] []


menuList : Html msg
menuList =
    nav [ class "menu-list", id "nav" ]
        (List.indexedMap (\i x -> menuItem ( i, x )) menu)


menuItem : ( Int, Menu ) -> Html msg
menuItem ( index, list ) =
    a
        [ href list.menuLink
        , classList
            [ ( "menu-link", True )
            , ( "active", index == 0 )
            ]
        ]
        [ text list.name
        ]
