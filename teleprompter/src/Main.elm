module Main exposing (main)

import Array
import Browser
import Browser.Events
import Duration
import Json.Decode as D
import Model exposing (Model, Msg(..))
import TycTasks
import Update
import View


init : Int -> ( Model, Cmd Msg )
init _ =
    let
        lines =
            TycTasks.sound_Intro 'm' "Great"

        -- lines =
        --     Array.fromList
        --         (TycTasks.getSayItFastInput "motorboat"
        --             |> TycTasks.sayItFastIntro
        --         )
        -- lines =
        --     TycTasks.sayTheSounds_Intro [ 'a', 'm' ]
    in
    ( { playing = False
      , lines = Array.fromList lines
      , idx = 0
      , elapsed = 0
      , lastTime = Nothing
      }
    , Cmd.none
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    let
        keySub =
            Browser.Events.onKeyDown
                (D.map
                    (\val -> KeyDown val)
                    (D.field "key" D.string)
                )

        tickSub =
            Browser.Events.onAnimationFrame Tick
    in
    if model.playing then
        Sub.batch [ keySub, tickSub ]

    else
        keySub


main : Program Int Model Msg
main =
    Browser.element
        { init = init
        , subscriptions = subscriptions
        , update = Update.update
        , view = View.view
        }
