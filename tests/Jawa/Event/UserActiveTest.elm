module Jawa.Event.UserActiveTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.UserActive as UserActive
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.UserActive"
        [ TestExtra.fuzzCodec "round trips" UserActive.decoder UserActive.encoder fuzzer
        , TestExtra.testCodec "works"
            UserActive.decoder
            UserActive.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer UserActive.UserActive
fuzzer =
    Fuzz.constant {}
