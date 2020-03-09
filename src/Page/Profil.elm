module Page.Profil exposing (..)

import Browser
import Html exposing (div, p, a, ul, li, text, img, h1, label, button, input, span)
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
            ,content
            , footer
           ]

header 
    = div [class "position-relative js-header-wrapper"]
     [
         a [ class "p-3 bg-blue text-white show-on-focus js-skip-to-content" ] [ text "Skip to content" ]
         , span [ class "Progress progress-pjax-loader position-fixed width-full js-pjax-loader-bar" ] [
             span [ class "progress-pjax-loader-bar top-0 left-0" ] []
         ]
         , div [ class "Header js-details-container Details flex-wrap flex-lg-nowrap p-responsive" ] [
             div [ class "Header-item d-none d-lg-flex" ] [
                 a [ class "Header-link" ] [
                     -- img [ src "assets/github-logo.png", width 40, height 40 ] []
                 ]
             ]
             , div [ class "Header-item d-lg-none" ] [

             ]
             , div [ class "Header-item Header-item--full flex-column flex-lg-row width-full flex-order-2 flex-lg-order-none mr-0 mr-lg-3 mt-3 mt-lg-0 Details-content--hidden" ] [

             ]
             , div [ class "Header-item Header-item--full flex-justify-center d-lg-none position-relative" ] [

             ]
             , div [ class "Header-item mr-0 mr-lg-3 flex-order-1 flex-lg-order-none" ] [

             ]
             , div [ class "Header-item position-relative d-none d-lg-flex" ] [

             ]
             , div [ class "Header-item position-relative mr-0 d-none d-lg-flex" ] [

             ]
         ]
     ]

content 
 = div [ class "application-main" ] [  ]

-- footer: Model -> Html Msg
footer 
    = div [ class "footer container-xl width-full p-responsive" ][
        div [ class "position-relative d-flex flex-row-reverse flex-lg-row flex-wrap flex-lg-nowrap flex-justify-center flex-lg-justify-between pt-6 pb-2 mt-6 f6 text-gray border-top border-gray-light"][
            ul [ class "list-style-none d-flex flex-wrap col-12 col-lg-5 flex-justify-center flex-lg-justify-between mb-2 mb-lg-0" ] [
                li [ class "mr-3 mr-lg-0" ] [ text "© 2020 GitHub, Inc." ]
                , li [ class "mr-3 mr-lg-0" ] [
                    a [ href "https://github.com/site/terms" ] [ text "Terms" ] 
                ]
                , li [ class "mr-3 mr-lg-0" ] [
                    a [ href "https://github.com/site/privacy" ] [ text "Privacy" ]
                ]
                , li [ class "mr-3 mr-lg-0" ] [
                    a [ href "https://github.com/security" ] [ text "Security" ]
                ]
                , li [ class "mr-3 mr-lg-0" ] [
                    a [ href "https://githubstatus.com/" ] [ text "Status" ]
                ]
                , li [] [ 
                    a [ href "https://help.github.com/" ] [ text "Help" ]
                ]
            ]
            , a [ href "https://github.com/", class "footer-octicon d-none d-lg-block mx-lg-4" ] []
            , ul [ class "list-style-none d-flex flex-wrap col-12 col-lg-5 flex-justify-center flex-lg-justify-between mb-2 mb-lg-0" ] [
                li [ class "mr-3 mr-lg-0" ] [
                    a [ href "https://github.com/contact" ] [ text "Contact GitHub" ]
                ]
                , li [ class "mr-3 mr-lg-0" ] [
                     a [ href "https://github.com/pricing" ] [ text "Pricing" ]
                ]
                , li [ class "mr-3 mr-lg-0" ] [
                     a [ href "https://developer.github.com/" ] [ text "API" ]
                ]
                , li [ class "mr-3 mr-lg-0" ] [
                     a [ href "https://training.github.com/" ] [ text "Training" ]
                ]
                , li [ class "mr-3 mr-lg-0" ] [
                     a [ href "https://github.blog/" ] [ text "Blog" ]
                ]
                 , li [  ] [
                     a [ href "https://github.com/about" ] [ text "About" ]
                ]
            ]
        ]
        , div [ class "d-flex flex-justify-center pb-6" ] [
            span [ class "f6 text-gray-light" ][]
        ]
    ]



-- UPDATE
-- update : Msg -> Model -> (Model, Cmd Msg)
update data model =
    data