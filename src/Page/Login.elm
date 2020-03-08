module Page.Login exposing (view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http


-- view : Model -> Html Msg

type alias Model =
  { 
      data: String
  }

type alias Form =
    { email : String
    , password : String
    }

-- MAIN
main =
    Browser.sandbox 
    { 
      init = initialModel,
      update = update, 
      view = view
    }

-- INIT
-- initialModel: Model
initialModel =
    {
       data = []
    }

-- VIEW
-- view : Model -> Html Msg
view model =
    div [ ] 
           [ 
            div [ class "position-relative js-header-wrapper"] [
                text "log"
            ]
            , div [ class "application-main" ] [ text "log" ]
            , footer
           ]

footer 
    = div [ class "footer container-lg p-responsive py-6 mt-6 f6" ] [ 
        ul [ class "list-style-none d-flex flex-justify-center" ] [
            li [ class "mr-3"] [ a [ href "/site/terms"] [ text "Terms" ] ]
            , li [ class "mr-3"] [ a [ href "/site/privacy"] [ text "Privacy" ]  ]
            , li [ class "mr-3"] [ a [ href "https://help.github.com/articles/github-security/"] [ text "Security" ]  ]
            , li [ ] [ a [ class "link-gray" 
                           , href "https://github.com/contact" ] [ text "Contact GitHub" ]  ]
        ]
    ]

-- <div class="footer container-lg p-responsive py-6 mt-6 f6" role="contentinfo">
--     <ul class="list-style-none d-flex flex-justify-center">
--         <li class="mr-3"><a href="/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
--         <li class="mr-3"><a href="/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
--         <li class="mr-3"><a href="https://help.github.com/articles/github-security/" data-ga-click="Footer, go to security, text:security">Security</a></li>
--           <li><a class="link-gray" data-ga-click="Footer, go to contact, text:contact" href="https://github.com/contact">Contact GitHub</a></li>
--     </ul>
--   </div>

-- UPDATE
-- update : Msg -> Model -> (Model, Cmd Msg)
update data model =
    data