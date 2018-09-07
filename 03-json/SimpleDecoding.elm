module SimpleDecoding exposing (..)

import Html exposing (..)
import Json.Decode exposing (..)


json : String
json =
    """
{
    "type": "success",
    "value": {
        "id": 68,
        "joke": "When Chuck Norris falls in water, Chuck Norris doesn't get wet. Water gets Chuck Norris.",
        "categories": []
    }
}
"""


decoder : Decoder String
decoder =
    at [ "value", "joke" ] string


jokeResult : Result String String
jokeResult =
    decodeString decoder json


main : Html msg
main =
    case jokeResult of
        Ok joke ->
            text joke

        Err err ->
            text err
