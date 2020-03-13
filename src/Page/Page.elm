module Page.Page exposing (..)

-- import Browser
-- import Html exposing (..)
-- import Html.Attributes exposing (..)
-- import Page.Profil as Profil
-- import Page.Test as Test

-- main 
--    = div [ class "b-wrapper-page" ] [
--        Test.view
--    ]


import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Page.Test as Test

-- MAIN

main =
  Browser.sandbox { 
      init = init, 
      update = update, 
      view = view
    }

-- MODEL

type alias Model = Int | Test.Model

init : Model
init =
  0


-- UPDATE

type Msg = Increment | Decrement 

update : Msg -> Model -> Model
update msg model =
  model


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ 
     text "Page"
     ,  Test.view
    ]