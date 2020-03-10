module Page.Profil exposing (..)

import Browser
import Html exposing (div, p, a, ul, li, text, img, h1, label, button, input, span, nav)
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
                 div [ class "header-search flex-self-stretch flex-lg-self-auto mr-0 mr-lg-3 mb-3 mb-lg-0 scoped-search site-scoped-search js-site-search position-relative js-jump-to" ] [
                     div [ class "position-relative" ] [
                         div [ class "js-site-search-form" ] [
                             div [ class "form-control input-sm header-search-wrapper p-0 header-search-wrapper-jump-to position-relative d-flex flex-justify-between flex-items-center js-chromeless-input-container" ] [
                                input [ placeholder "Search or jump to…", class "form-control input-sm header-search-input jump-to-field js-jump-to-field js-site-search-focus js-site-search-field is-clearable" ] []
                                , img [src "https://github.githubassets.com/images/search-key-slash.svg", class "mr-2 header-search-key-slash" ] []
                                , div [ class "Box position-absolute overflow-hidden d-none jump-to-suggestions js-jump-to-suggestions-container" ] [

                                ]
                             ] 
                            
                         ]
                     ]
                 ]
                 , nav [ class "d-flex flex-column flex-lg-row flex-self-stretch flex-lg-self-auto" ] [
                     a [ href "https://github.com/dashboard", class "Header-link d-block d-lg-none py-2 py-lg-0 border-top border-lg-top-0 border-white-fade-15" ] [ 
                         text "Dashboard"
                       ]
                     , a [ href "https://github.com/pulls", class "js-selected-navigation-item Header-link  mr-0 mr-lg-3 py-2 py-lg-0 border-top border-lg-top-0 border-white-fade-15" ] [
                         text "Pull requests"
                     ]
                     , div [ class "mr-0 mr-lg-3 py-2 py-lg-0 border-top border-lg-top-0 border-white-fade-15" ] [
                         a [ href "https://github.com/marketplace", class "js-selected-navigation-item Header-link" ] [
                             text "Marketplace"
                         ]
                     ]
                     , a [ href "https://github.com/explore", class "js-selected-navigation-item Header-link  mr-0 mr-lg-3 py-2 py-lg-0 border-top border-lg-top-0 border-white-fade-15" ] [
                        text "Explore"
                     ]
                 ]
             ]
             , div [ class "Header-item Header-item--full flex-justify-center d-lg-none position-relative" ] [

             ]
             , div [ class "Header-item mr-0 mr-lg-3 flex-order-1 flex-lg-order-none" ] [
                 a [ class "Header-link notification-indicator position-relative tooltipped tooltipped-sw js-socket-channel js-notification-indicator" ] [
                     span [ class "js-indicator-modifier mail-status unread" ] []
                 ]
             ]
             , div [ class "Header-item position-relative d-none d-lg-flex" ] [
                 div [ class "details-overlay details-reset" ] []
             ]
             , div [ class "Header-item position-relative mr-0 d-none d-lg-flex" ] [
                 div [ class "details-overlay details-reset js-feature-preview-indicator-container" ] [
                     div [ class "Header-link" ] [
                         img [ src "https://avatars1.githubusercontent.com/u/12778181?s=60&v=4", width 20, height 20, class "avatar "] []
                         , div [ class "feature-preview-indicator js-feature-preview-indicator hidden" ] []
                         , div [ class "dropdown-caret" ] []
                     ]
                 ]
             ]
         ]
     ]

content 
 = div [ class "application-main" ] [ 
     div [ class "container-xl clearfix px-3 mt-4" ] [
         div [ class "h-card col-lg-3 col-md-4 col-12 float-md-left pr-md-3 pr-xl-6" ] [
            --  div [ class "user-profile-sticky-bar js-user-profile-sticky-bar is-stuck" ] [

            --  ]
              div [ class "clearfix"] [
                div [ class "float-left col-3 col-md-12 pr-3 pr-md-0" ] [
                    a [ class "u-photo d-block tooltipped tooltipped-s" ] [
                         img [ src "https://avatars3.githubusercontent.com/u/12778181?s=460&v=4", width 250, height 250, class "avatar width-full height-full avatar-before-user-status"] []
                    ] 
                ]
                , div [ class "float-md-left col-12" ] [
                    div [ class "user-status-container position-relative hide-sm hide-md" ] [
                        div [ class "f5 js-user-status-context" ] [
                            div [ class "js-user-status-container border-top-0 rounded-top-0 rounded-bottom-1 p-2 border"] [
                                div [ class "js-user-status-details details-reset details-overlay details-overlay-dark" ] [
                                    div [ class "btn-link btn-block link-gray no-underline js-toggle-user-status-edit toggle-user-status-edit " ] [
                                        div [ class "d-flex" ] [
                                            div [ class "f6 lh-condensed user-status-header d-inline-flex user-status-emoji-only-header circle"] []
                                            , div [ class "pt-1 ws-normal user-status-message-wrapper f6"] [
                                                div [ class "d-inline-block text-gray-dark" ] [
                                                    span [ class "text-gray ml-2"] [ text "Set status"]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
             ]
             , div [ class "mb-2 user-status-container d-md-none"] [

             ]
             , div [ class "d-none d-md-block" ] [

             ]
             , div [ class "my-1 js-pro-badge d-none" ] [

             ]
         ]
        , div [ class "col-12 d-md-none" ] [

        ]
        , div [ class "col-lg-9 col-md-8 col-12 float-md-left pl-md-2" ] [

        ] 
     ]
  ]

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