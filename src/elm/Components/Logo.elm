module Components.Logo exposing (logoComponent)

import Browser
import Html exposing (Html, a, img)
import Html.Attributes exposing (alt, class, href, src, title)


logoComponent : String -> Html msg
logoComponent logo =
    a [ href "./", title "Personal", class "main-logo" ]
        [ img [ src logo, title "Personal Logo", alt "Personal" ] []
        ]
