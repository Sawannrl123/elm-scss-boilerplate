module Components.Menu exposing (menuComponent)

import Browser
import Html exposing (Html, a, div, nav, text)
import Html.Attributes exposing (alt, class, href, title)


type alias Menu =
    { name : String
    , menuLink : String
    }


type alias Payload =
    List Menu


menu : Payload
menu =
    [ { name = "Home"
      , menuLink = ""
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


menuComponent : Html msg
menuComponent =
    div [ class "menu" ]
        [ menuList
        ]


menuList : Html msg
menuList =
    nav [ class "menu-list" ]
        (List.map menuItem menu)


menuItem : Menu -> Html msg
menuItem list =
    a [ href list.menuLink, class "menu-link" ]
        [ text list.name
        ]
