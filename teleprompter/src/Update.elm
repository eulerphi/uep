module Update exposing (..)

import Duration
import Model exposing (Model, Msg(..))
import Task
import Time


update : Msg -> Model -> ( Model, Cmd Msg )
update msg m =
    case msg of
        NoOp ->
            ( m, Cmd.none )

        KeyDown key ->
            if key == "PageUp" || key == "ArrowLeft" then
                ( m, message Stop )

            else if key == "PageDown" || key == "ArrowRight" then
                if m.playing then
                    ( m, message Pause )

                else
                    ( m, message Start )

            else
                ( m, Cmd.none )

        Tick time ->
            if not m.playing then
                ( { m | lastTime = Nothing }, Cmd.none )

            else
                case m.lastTime of
                    Nothing ->
                        ( { m | lastTime = Just time }, Cmd.none )

                    Just last ->
                        let
                            delta =
                                Time.posixToMillis time
                                    - Time.posixToMillis last
                                    |> max 0
                        in
                        ( { m | lastTime = Just time }, message (Delta delta) )

        Delta d ->
            case Model.current m of
                Nothing ->
                    ( m, message Stop )

                Just c ->
                    let
                        elapsed_ =
                            m.elapsed + d
                    in
                    if elapsed_ <= Duration.total c.duration then
                        ( { m | elapsed = elapsed_ }, Cmd.none )

                    else
                        ( { m | idx = m.idx + 1, elapsed = 0 }, Cmd.none )

        Start ->
            ( { m | playing = True }, Cmd.none )

        Stop ->
            ( { m | playing = False, idx = 0, elapsed = 0, lastTime = Nothing }, Cmd.none )

        Pause ->
            ( { m | playing = False }, Cmd.none )


message : msg -> Cmd msg
message x =
    Task.perform identity (Task.succeed x)
