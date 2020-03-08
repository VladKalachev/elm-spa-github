module Page.Login exposing (view)

import Browser
import Html exposing (div, p, a, ul, li, text, img, h1, label, button, input)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Svg exposing (svg, path)
import Svg.Attributes exposing (d)

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
            header
            , submitForm
            , footer
           ]

header 
    = div [ class "position-relative js-header-wrapper" ] [
        div [ class "header header-logged-out width-full pt-5" ] [
            div [ class "container clearfix width-full text-center"] [
                a [ class "header-logo"
                    , href "https://github.com/" ] [ -- text "svg"
                      img [ src "assets/github-logo.png", width 80, height 80 ] []
                      -- svg [] [
                        --    path [ d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"] [  ] 
                     --  ]
                    ]
            ]
         ]
    ]

submitForm 
 = div [ class "application-main" ] [ 
     div [ class "auth-form px-3"
           , id "login" ] [
             Html.form [] [
                div [ class "auth-form-header p-0"] [
                  h1 [] [ text "Sign in to GitHub" ] 
                ]
                , div [ class "auth-form-body mt-3" ] [
                    label [ class "login_field" ]
                        [ text "Username or email address"
                        , input [ class "form-control input-block", type_ "username", name "username" ] []
                        ]
                    , label [ class "login_field" ]
                        [ text "Password"
                        , a [ class "label-link", href "/password_reset" ] [ text "Forgot password?" ]
                        , input [ class "form-control form-control input-block", type_ "password", name "password" ] []
                        ]
                    , button [ class "btn btn-primary btn-block" ] [ text "Submit" ]
                ]
             ],
             p [ class "create-account-callout mt-3" ] [
                 text "New to GitHub? ", a [ href "/join?source=login" ] [ text "Create an account" ]
             ]
           ]
  ]

-- footer: Model -> Html Msg
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



-- UPDATE
-- update : Msg -> Model -> (Model, Cmd Msg)
update data model =
    data