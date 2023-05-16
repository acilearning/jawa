module Jawa.Event.Playlist exposing (Playlist, decoder, encoder)

{-|

@docs Playlist, decoder, encoder

-}

import Jawa.PlaylistItem
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/playlist-events#onplaylist>
-}
type alias Playlist =
    { playlist : List Jawa.PlaylistItem.PlaylistItem
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Playlist
decoder =
    Json.Decode.map Playlist
        (Json.Decode.field "playlist" (Json.Decode.list Jawa.PlaylistItem.decoder))


{-| A JSON encoder.
-}
encoder : Playlist -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "playlist", Json.Encode.list Jawa.PlaylistItem.encoder x.playlist )
        ]