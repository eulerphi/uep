module Duration exposing (..)


type alias Duration =
    { pre : Int
    , text : Int
    , post : Int
    }


defaultPre : Int
defaultPre =
    200


defaultPost : Int
defaultPost =
    200


textOnly : Int -> Duration
textOnly text =
    Duration defaultPre text defaultPost


preText : Int -> Int -> Duration
preText pre text =
    Duration pre text defaultPost


preTextPost : Int -> Int -> Int -> Duration
preTextPost pre text post =
    Duration pre text post


total : Duration -> Int
total d =
    d.pre + d.text + d.post
