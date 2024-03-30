--[[
ls = require("luasnip")
ls.add_snippets("autohotkey", {
  ls.snippet("ahk2", {
    ls.text_node("#Requires AutoHotkey v2.0"),
  }),
})
ls.add_snippets("elm", {
  ls.snippet("elmhome", {
    ls.text_node({
      "module HomePage exposing (..)",
      "",
      "-- Run elm reactor to test this code",
      "-- elm-ui is made for fast styling of components without CSS",
      "import Browser",
      "import Html exposing (Html, button, div, text)",
      "import Html.Events exposing (onClick)",
      "",
      "main =",
      "  Browser.sandbox { init = 0, update = update, view = view }",
      "",
      "type Msg = Increment | Decrement",
      "",
      "update msg model =",
      "  case msg of",
      "    Increment ->",
      "      model + 1",
      "",
      "    Decrement ->",
      "      model - 1",
      "",
      "view model =",
      "  div []",
      '    [ button [ onClick Decrement ] [ text "-" ]',
      "    , div [] [ text (String.fromInt model) ]",
      '    , button [ onClick Increment ] [ text "+" ]',
      "    ]",
    }),
  }),
  ls.snippet("elmuihome", {
    ls.text_node({
      "module HomePage exposing (..)",
      "",
      "-- Run elm reactor to test this code",
      "-- elm-ui is made for fast styling of components without CSS",
      "import Browser",
      "import Html exposing (Html, button, div, text)",
      "import Html.Events exposing (onClick)",
      "import Element",
      "import Element.Input",
      "import Element.Background",
      "import Element.Font",
      "",
      "main =",
      "  Browser.sandbox { init = 0, update = update, view = view }",
      "",
      "type Msg = Increment | Decrement",
      "",
      "update msg model =",
      "  case msg of",
      "    Increment ->",
      "      model + 1",
      "",
      "    Decrement ->",
      "      model - 1",
      "",
      "view model =",
      "  Element.layout []",
      "    ( Element.column []",
      "        [ Element.el ",
      "            [ Element.padding 5",
      "            , Element.Background.color (Element.rgb 0.5 0.5 0.5)",
      '            , Element.Font.family [ Element.Font.typeface "Courier New" ]',
      "            , Element.width Element.fill",
      "            ] ",
      "            (Element.Input.button ",
      "              [ Element.width Element.fill",
      "              ] ",
      "              { onPress = Just Decrement",
      '              , label = Element.el [ Element.centerX ] (Element.text "-") }',
      "            )",
      "        , Element.el ",
      "            [ Element.padding 5",
      '            , Element.Font.family [ Element.Font.typeface "Courier New" ]',
      "            , Element.Background.color (Element.rgb 1 1 1)",
      "            ] ",
      "            (Element.text (String.fromInt model))",
      "        , Element.el ",
      "            [ Element.padding 5",
      "            , Element.Background.color (Element.rgb 0.5 0.5 0.5)",
      '            , Element.Font.family [ Element.Font.typeface "Courier New" ]',
      "            , Element.width Element.fill",
      "            ] ",
      "            (Element.Input.button ",
      "              [ Element.width Element.fill",
      "              ] ",
      "              { onPress = Just Increment",
      '              , label = Element.el [ Element.centerX ] (Element.text "+") }',
      "            )",
      "        ]",
      "    )",
    }),
  }),
})
--]]
