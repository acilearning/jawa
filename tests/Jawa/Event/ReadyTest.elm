module Jawa.Event.ReadyTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Ready as Ready
import Jawa.Test.Extra as TestExtra
import Jawa.Visibility as Visibility
import Jawa.VisibilityTest as VisibilityTest
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" Ready.decoder Ready.encoder fuzzer
        , TestExtra.testCodec "works"
            Ready.decoder
            Ready.encoder
            """ {
                "setupTime": 0.1,
                "viewable": 0
            } """
            { setupTime = 0.1
            , viewable = Visibility.Hidden
            }
        ]


fuzzer : Fuzz.Fuzzer Ready.Ready
fuzzer =
    Fuzz.map2 Ready.Ready
        Fuzz.niceFloat
        VisibilityTest.fuzzer
