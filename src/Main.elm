module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Page.Login as Login
-- view : Model -> Html Msg

type alias Model =
  { 
      data: String
  }

-- MAIN
main =
    Browser.application 
    { 
      init = initialModel
      , update = update
      , view = view
      , subscriptions = \_ -> Sub.none
      , onUrlChange = UrlChanged
      , onUrlRequest = LinkClicked
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
    div [ class "content"] 
           [ text "Main" ]

-- UPDATE
-- update : Msg -> Model -> (Model, Cmd Msg)
update data model =
    data