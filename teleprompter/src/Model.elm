module Model exposing (..)

import Array exposing (Array)
import Duration exposing (Duration)
import Time exposing (Posix)


type alias Line =
    { text : String
    , duration : Duration
    }


type alias Model =
    { playing : Bool
    , lines : Array Line
    , idx : Int
    , elapsed : Int
    , lastTime : Maybe Posix
    }


type Msg
    = NoOp
    | KeyDown String
    | Tick Time.Posix
    | Delta Int
    | Start
    | Stop
    | Pause


current : Model -> Maybe Line
current m =
    Array.get m.idx m.lines


next : Model -> Maybe Line
next m =
    Array.get (m.idx + 1) m.lines
