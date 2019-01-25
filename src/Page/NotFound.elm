-- Copyright 2019 Jeremy H. Brown
--
-- The copyright holder licenses this file to you under the MIT License (the
-- "License"); you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at https://opensource.org/licenses/MIT


module Page.NotFound exposing (init)

import Element
    exposing
        ( column
        , spacing
        , text
        )
import Msg
import Page
import Route
import ViewHelpers exposing (..)


init session notFoundUrl =
    ( Page.withOptionalSession view
        update
        { title = pageTitle "Not found"
        , session = session
        , state = { url = notFoundUrl }
        }
    , Cmd.none
    )


view data model =
    dialogPage <|
        column
            [ spacing 10 ]
            [ text "URL not found:"
            , text data.state.url
            , button [] { onPress = Just <| Msg.Main <| Msg.PushRoute Route.Root, label = text "Go to home" }
            ]


update builder data msg model =
    ( model, Cmd.none )