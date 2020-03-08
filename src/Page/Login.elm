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
    div [ class "content" ] 
           [ div [] 
            [text "Login"]
            , div [] []
           ]

-- UPDATE
-- update : Msg -> Model -> (Model, Cmd Msg)
update data model =
    data