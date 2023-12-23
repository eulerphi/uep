module View exposing (..)

import Html
import Html.Attributes as Attrs
import Model exposing (Model, Msg(..))


makeGradient : String -> String -> Int -> String
makeGradient leftColor rightColor percent =
    "linear-gradient(90deg, "
        ++ leftColor
        ++ " 0% "
        ++ String.fromInt percent
        ++ "%, "
        ++ rightColor
        ++ " "
        ++ String.fromInt percent
        ++ "% 100%)"


calculatePercent : Int -> Int -> Int
calculatePercent elapsed total =
    if total <= 0 then
        100

    else
        (toFloat elapsed / toFloat total)
            |> (*) 100
            |> round
            |> min 100
            |> max 0


viewCurrent : Model -> Html.Html Msg
viewCurrent m =
    case Model.current m of
        Nothing ->
            Html.div [] []

        Just c ->
            let
                prePercent =
                    calculatePercent m.elapsed c.duration.pre

                textPercent =
                    calculatePercent
                        (m.elapsed - c.duration.pre)
                        c.duration.text

                postPercent =
                    calculatePercent
                        (m.elapsed - c.duration.pre - c.duration.text)
                        c.duration.post
            in
            Html.div
                [ Attrs.id "container" ]
                [ Html.div
                    [ Attrs.id "before"
                    , Attrs.style "background"
                        (makeGradient "lightgray" "transparent" prePercent)
                    ]
                    []
                , Html.p
                    [ Attrs.id "current"
                    , Attrs.style "background"
                        (makeGradient "yellow" "transparent" textPercent)
                    ]
                    [ Html.text c.text ]
                , Html.div
                    [ Attrs.id "after"
                    , Attrs.style "background"
                        (makeGradient "lightgray" "transparent" postPercent)
                    ]
                    []
                ]


viewNext : Model -> Html.Html Msg
viewNext m =
    case Model.next m of
        Nothing ->
            Html.p [] []

        Just n ->
            Html.p [] [ Html.text n.text ]


view : Model -> Html.Html Msg
view m =
    Html.div
        []
        [ viewCurrent m, viewNext m ]
