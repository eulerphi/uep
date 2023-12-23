module TycTasks exposing (..)

import Duration exposing (Duration)
import Model exposing (Line)



-- SOUNDS


sound_Intro : Char -> String -> List Line
sound_Intro letter positiveWord =
    let
        letterStr =
            letter
                |> List.repeat 6
                |> String.fromList
    in
    [ { text = "(Intro, Demo, & Your Turn)", duration = startDuration }
    , { text = "I’m going to touch under", duration = Duration.preText 600 1500 }
    , { text = "*this* sound and say the sound.", duration = Duration.textOnly 2000 }
    , { text = letterStr, duration = Duration.preTextPost 700 3000 500 }
    , { text = "Your turn to say the sound", duration = Duration.preText 500 2000 }
    , { text = "when I touch under it.", duration = Duration.textOnly 1500 }
    , { text = "Get ready.", duration = Duration.textOnly 1000 }
    , { text = "(Feedback: Good/Continue)", duration = transitionDuration }
    , { text = positiveWord ++ "! You said:", duration = Duration.textOnly 2000 }
    , { text = letterStr, duration = Duration.textOnly 3000 }
    , { text = "(Feedback: Again)", duration = transitionDuration }
    , { text = "The sound is:", duration = Duration.textOnly 1200 }
    , { text = letterStr, duration = Duration.textOnly 3000 }
    , { text = "Let's try that again.", duration = Duration.textOnly 2000 }
    ]


sound_ReviewIntro : Char -> String -> List Line
sound_ReviewIntro letter positiveWord =
    let
        letterStr =
            letter
                |> List.repeat 6
                |> String.fromList
    in
    [ { text = "(Intro & Your Turn)", duration = startDuration }
    , { text = "Let's do the sounds again.", duration = Duration.preText 600 1500 }
    , { text = "See if you remember them.", duration = Duration.textOnly 2000 }
    , { text = letterStr, duration = Duration.preTextPost 700 3000 500 }
    , { text = "Your turn to say the sound", duration = Duration.preText 500 2000 }
    , { text = "when I touch under it.", duration = Duration.textOnly 1500 }
    , { text = "Get ready.", duration = Duration.textOnly 1000 }
    , { text = "(Feedback: Good/Continue)", duration = transitionDuration }
    , { text = positiveWord ++ "! You said:", duration = Duration.textOnly 2000 }
    , { text = letterStr, duration = Duration.textOnly 3000 }
    , { text = "(Feedback: Again)", duration = transitionDuration }
    , { text = "The sound is:", duration = Duration.textOnly 1200 }
    , { text = letterStr, duration = Duration.textOnly 3000 }
    , { text = "Let's try that again.", duration = Duration.textOnly 2000 }
    ]



-- SAY IT FAST


type alias SayItFastInput =
    { first : String
    , second : String
    , firstDuration : Duration
    , secondDuration : Duration
    , wordDuration : Duration
    }


getSayItFastInput : String -> SayItFastInput
getSayItFastInput word =
    case word of
        "motorboat" ->
            { first = "motor"
            , second = "boat"
            , firstDuration = Duration.textOnly 1000
            , secondDuration = Duration.textOnly 1000
            , wordDuration = Duration.textOnly 1500
            }

        _ ->
            { first = "<INVALID>"
            , second = "<WORD>"
            , firstDuration = Duration.textOnly 1000
            , secondDuration = Duration.textOnly 1000
            , wordDuration = Duration.textOnly 1500
            }


sayItFastIntro : SayItFastInput -> List Line
sayItFastIntro input =
    let
        word =
            input.first ++ input.second
    in
    [ { text = "(1. Intro, Demo, & Your Turn)", duration = startDuration }
    , { text = "Let's play say-it-fast.", duration = Duration.preText 600 2000 }
    , { text = "*My* turn:", duration = Duration.textOnly 1000 }
    , { text = input.first, duration = input.firstDuration }
    , { text = input.second, duration = input.secondDuration }
    , { text = "I'll say it fast:", duration = Duration.textOnly 1500 }
    , { text = word, duration = input.wordDuration }
    , { text = "Your turn.", duration = Duration.textOnly 1500 }
    , { text = "*Remember*: Wait until", duration = Duration.textOnly 1500 }
    , { text = "I tell you", duration = Duration.textOnly 1500 }
    , { text = "to say it fast.", duration = Duration.textOnly 1500 }
    , { text = input.first, duration = input.firstDuration }
    , { text = input.second, duration = input.secondDuration }
    , { text = "Say it fast.", duration = Duration.textOnly 1200 }
    , { text = "(2. Repeat Task)", duration = transitionDuration }
    , { text = input.first, duration = input.firstDuration }
    , { text = input.second, duration = input.secondDuration }
    , { text = "Say it fast.", duration = Duration.textOnly 1200 }
    , { text = "(3. Feedback: Again)", duration = transitionDuration }
    , { text = "Here's saying it fast:", duration = Duration.textOnly 1500 }
    , { text = word, duration = input.wordDuration }
    , { text = "Let's try again.", duration = Duration.textOnly 1500 }
    , { text = "(4. Feedback: Didn't Wait)", duration = transitionDuration }
    , { text = "You didn't wait.", duration = Duration.textOnly 1500 }
    , { text = "*Remember*: Wait until", duration = Duration.textOnly 1500 }
    , { text = "I tell you", duration = Duration.textOnly 1500 }
    , { text = "to say it fast.", duration = Duration.textOnly 1500 }
    , { text = "Let's do that again.", duration = Duration.textOnly 1500 }
    , { text = "(5. Feedback: Too Slow)", duration = transitionDuration }
    , { text = "You didn't say it fast.", duration = Duration.textOnly 1500 }
    , { text = "Here's saying it fast:", duration = Duration.textOnly 1500 }
    , { text = word, duration = input.wordDuration }
    , { text = "Let's do that part again.", duration = Duration.textOnly 1500 }
    , { text = "(6. Feedback: Too Loud)", duration = transitionDuration }
    , { text = "I can say it fast.", duration = Duration.textOnly 1500 }
    , { text = "and _quiet_.", duration = Duration.textOnly 1500 }
    , { text = word, duration = input.wordDuration }
    , { text = "Try again.", duration = Duration.textOnly 1500 }
    ]


sayItFast : SayItFastInput -> List Line
sayItFast input =
    let
        word =
            input.first ++ input.second
    in
    [ { text = "(1. Listen & Your Turn)", duration = startDuration }
    , { text = "Listen.", duration = Duration.preText 600 2000 }
    , { text = input.first, duration = input.firstDuration }
    , { text = input.second, duration = input.secondDuration }
    , { text = "Say it fast.", duration = Duration.textOnly 1200 }
    , { text = "(2. Repeat Task)", duration = transitionDuration }
    , { text = input.first, duration = input.firstDuration }
    , { text = input.second, duration = input.secondDuration }
    , { text = "Say it fast.", duration = Duration.textOnly 1200 }
    , { text = "(3. Feedback: Again)", duration = transitionDuration }
    , { text = "Here's saying it fast:", duration = Duration.textOnly 1500 }
    , { text = word, duration = input.wordDuration }
    , { text = "Let's try again.", duration = Duration.textOnly 1500 }
    , { text = "(4. Feedback: Too Slow)", duration = transitionDuration }
    , { text = "You didn't say it fast.", duration = Duration.textOnly 1500 }
    , { text = "Here's saying it fast:", duration = Duration.textOnly 1500 }
    , { text = word, duration = input.wordDuration }
    , { text = "Let's do that part again.", duration = Duration.textOnly 1500 }
    , { text = "(5. Feedback: Too Loud)", duration = transitionDuration }
    , { text = "I can say it fast.", duration = Duration.textOnly 1500 }
    , { text = "and _quiet_.", duration = Duration.textOnly 1500 }
    , { text = word, duration = input.wordDuration }
    , { text = "Try again.", duration = Duration.textOnly 1500 }
    ]



-- SAY THE SOUNDS


sayTheSounds_Intro : List Char -> List Line
sayTheSounds_Intro letters =
    let
        lettersStr =
            letters
                |> List.concatMap (List.repeat 6)
                |> String.fromList

        lettersDuration =
            3000 * List.length letters
    in
    [ { text = "(1. Intro, Demo, & Your Turn)", duration = startDuration }
    , { text = "I'm going to say sounds slowly.", duration = Duration.preText 1000 2000 }
    , { text = "**without stopping**.", duration = Duration.textOnly 1200 }
    , { text = "Listen:", duration = Duration.textOnly 750 }
    , { text = lettersStr, duration = Duration.preText 500 lettersDuration }
    , { text = "Now say the sounds slowly", duration = Duration.textOnly 2000 }
    , { text = "WITH ME.", duration = Duration.textOnly 750 }
    , { text = lettersStr, duration = Duration.preText 500 lettersDuration }
    , { text = "Again. Say it WITH ME.", duration = Duration.textOnly 2000 }
    , { text = lettersStr, duration = Duration.preText 500 lettersDuration }
    , { text = "YOUR TURN to say: ", duration = Duration.textOnly 1500 }
    , { text = lettersStr, duration = Duration.preText 500 lettersDuration }
    , { text = "Get ready.", duration = Duration.textOnly 750 }
    , { text = "(2. Repeat Task)", duration = startDuration }
    , { text = "YOUR TURN to say: ", duration = Duration.textOnly 1500 }
    , { text = lettersStr, duration = Duration.preText 500 lettersDuration }
    , { text = "Get ready.", duration = Duration.textOnly 750 }
    , { text = "(3. Feedback: Again)", duration = startDuration }
    , { text = "Say it like this:", duration = Duration.textOnly 1500 }
    , { text = lettersStr, duration = Duration.preText 500 lettersDuration }
    , { text = "Take a deep breath", duration = Duration.textOnly 1500 }
    , { text = "and say it WITH ME", duration = Duration.textOnly 1500 }
    , { text = "(breath in)", duration = Duration.textOnly 750 }
    , { text = lettersStr, duration = Duration.preText 500 lettersDuration }
    , { text = "(4. Feedback: Stopping)", duration = startDuration }
    , { text = "Say the sounds", duration = Duration.textOnly 1500 }
    , { text = "**without stopping**", duration = Duration.textOnly 1500 }
    , { text = "like this:", duration = Duration.textOnly 1500 }
    , { text = lettersStr, duration = Duration.preText 500 lettersDuration }
    , { text = "Take a deep breath", duration = Duration.textOnly 1500 }
    , { text = "and say it WITH ME", duration = Duration.textOnly 1500 }
    , { text = "(breath in)", duration = Duration.textOnly 750 }
    , { text = lettersStr, duration = Duration.preText 500 lettersDuration }
    ]


sayTheSounds : List Char -> List Line
sayTheSounds letters =
    let
        lettersStr =
            letters
                |> List.concatMap (List.repeat 6)
                |> String.fromList

        lettersDuration =
            3000 * List.length letters
    in
    [ { text = "(1. Demo & Your Turn)", duration = startDuration }
    , { text = "Now WE'LL say:", duration = Duration.preText 1000 2000 }
    , { text = lettersStr, duration = Duration.preText 500 lettersDuration }
    , getReadyLine
    , { text = lettersStr, duration = Duration.preText 500 lettersDuration }
    , { text = "YOUR TURN to say: ", duration = Duration.textOnly 1500 }
    , { text = lettersStr, duration = Duration.preText 500 lettersDuration }
    , getReadyLine
    , { text = "(2. Repeat Task)", duration = startDuration }
    , { text = "YOUR TURN to say: ", duration = Duration.textOnly 1500 }
    , { text = lettersStr, duration = Duration.preText 500 lettersDuration }
    , getReadyLine
    , { text = "(3. Feedback: Again)", duration = startDuration }
    , { text = "Say it like this:", duration = Duration.textOnly 1500 }
    , { text = lettersStr, duration = Duration.preText 500 lettersDuration }
    , { text = "Take a deep breath", duration = Duration.textOnly 1500 }
    , { text = "and say it WITH ME", duration = Duration.textOnly 1500 }
    , { text = "(breath in)", duration = Duration.textOnly 750 }
    , { text = lettersStr, duration = Duration.preText 500 lettersDuration }
    , { text = "(4. Feedback: Stopping)", duration = startDuration }
    , { text = "Say the sounds", duration = Duration.textOnly 1500 }
    , { text = "**without stopping**", duration = Duration.textOnly 1500 }
    , { text = "like this:", duration = Duration.textOnly 1500 }
    , { text = lettersStr, duration = Duration.preText 500 lettersDuration }
    , { text = "Take a deep breath", duration = Duration.textOnly 1500 }
    , { text = "and say it WITH ME", duration = Duration.textOnly 1500 }
    , { text = "(breath in)", duration = Duration.textOnly 750 }
    , { text = lettersStr, duration = Duration.preText 500 lettersDuration }
    ]


getReadyLine : Line
getReadyLine =
    { text = "Get ready.", duration = getReadyDuration }


getReadyDuration : Duration
getReadyDuration =
    Duration.textOnly 750


startDuration : Duration
startDuration =
    Duration.textOnly 2000


transitionDuration : Duration
transitionDuration =
    Duration.textOnly 1500
