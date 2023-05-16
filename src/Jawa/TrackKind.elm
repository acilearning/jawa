module Jawa.TrackKind exposing (TrackKind(..), decoder, encoder)

{-|

@docs TrackKind, decoder, encoder

-}

import Json.Decode
import Json.Decode.Extra
import Json.Encode


{-| This type is not documented.
-}
type TrackKind
    = Captions
    | Chapters
    | Thumbnails


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder TrackKind
decoder =
    Json.Decode.string
        |> Json.Decode.andThen (fromString >> Json.Decode.Extra.fromResult)


fromString : String -> Result String TrackKind
fromString string =
    case string of
        "captions" ->
            Ok Captions

        "chapters" ->
            Ok Chapters

        "thumbnails" ->
            Ok Thumbnails

        _ ->
            Err <| "invalid TrackKind: " ++ string


{-| A JSON encoder.
-}
encoder : TrackKind -> Json.Encode.Value
encoder =
    toString >> Json.Encode.string


toString : TrackKind -> String
toString x =
    case x of
        Captions ->
            "captions"

        Chapters ->
            "chapters"

        Thumbnails ->
            "thumbnails"