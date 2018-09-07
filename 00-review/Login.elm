module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)


type alias Model =
    { username : String
    , password : String
    }


initModel : Model
initModel =
    { username = ""
    , password = ""
    }


type Msg
    = UsernameInput String
    | PasswordInput String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UsernameInput username ->
            { model | username = username }

        PasswordInput password ->
            { model | password = password }


view : Model -> Html Msg
view model =
    div []
        [ h3 [] [ text "Login Page... So far..." ]
        , Html.form []
            [ input
                [ type_ "text"
                , onInput UsernameInput
                , placeholder "username"
                ]
                []
            , input
                [ type_ "password"
                , onInput PasswordInput
                , placeholder "password"
                ]
                []
            , input
                [ type_ "submit" ]
                [ text "Login" ]
            ]
        , hr [] []
        , h4 [] [ text "Login Model:" ]
        , p [] [ text <| toString model ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
