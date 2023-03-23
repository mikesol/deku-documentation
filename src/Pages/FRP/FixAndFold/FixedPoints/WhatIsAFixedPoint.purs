module Pages.FRP.FixAndFold.FixedPoints.WhatIsAFixedPoint where

import Prelude

import Components.Code (psCode)
import Components.Table (tableClass)
import Contracts (Subsection, subsection)
import Control.Alt ((<|>))
import Control.Lazy (fix)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text_, (<#~>))
import Deku.Core (dyn)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useDyn, useMailboxed, useState)
import Deku.Listeners (click_)

whatIsAFixedPoint :: forall lock payload. Subsection lock payload
whatIsAFixedPoint = subsection
  { title: "What is a fixed point?"
  , matter: pure
      [ D.p_
          [ text_
              "A fixed point of a function is a value that is mapped to itself by the function. Because fixed points are invariant under function application, one way to arrive at a fixed point is to continue providing the output of a function as its input until the value converges."
          ]
      , D.p_
          [ text_
              "In functional programming, we tend to think of fixed points of systems, meaning how do systems converge after repeated application of some entity like a function. The standard pattern is to define "
          , D.code__ "fix"
          , text_
              " as a function that takes a closure where some arbitrary entity that can be repeatedly applied to a system's input or output, let's call it "
          , D.code__ "u"
          , text_ ", can be used, then returning "
          , D.code__ "u"
          , text_
              " as the result. This is a bit of a mind-melt, as it looks as if the value is being used before it is created."
          ]
      , D.p_
          [ text_ "As an example, let's consider a function of type "
          , D.code__ "(a -> b)"
          , text_
              " as our unit that will be repeatedly applied to an input. That is, it applies itself recursively to its input parameter until it converges at a term of type "
          , D.code__ "b"
          , text_ ". We'll fix "
          , D.code__ "a"
          , text_ " as "
          , D.code__ "Int"
          , text_ " and "
          , D.code__ "b"
          , text_ " as "
          , D.code__ "Int"
          , text_ " as well."
          ]
      , psCode
          """
fix :: forall a b. ((a -> b) -> (a -> b)) -> a -> b
fix f = go
  where
    defer f = \x -> f unit x
    go = defer \_ -> f go

myFunction = fix (\f a -> if a > 100 then 100 else f (a + 1))
"""
      , let
          myFunction = fix (\f a -> if a > 100 then 100 else f (a + 1))
        in
          D.table tableClass
            [ D.tr_
                [ D.th tableClass [ text_ "Function call" ]
                , D.th tableClass [ text_ "Result" ]
                ]
            , D.tr_
                [ D.th tableClass [ D.code__ "myFunction 0" ]
                , D.th tableClass [ text_ (show (myFunction 0)) ]
                ]
            , D.tr_
                [ D.th tableClass [ D.code__ "myFunction 42" ]
                , D.th tableClass [ text_ (show (myFunction 42)) ]
                ]
            , D.tr_
                [ D.th tableClass [ D.code__ "myFunction1000" ]
                , D.th tableClass [ text_ (show (myFunction 1000)) ]
                ]
            ]
      , D.div (klass_ "w-full flex justify-end")
          [ D.span (klass_ "text-sm pr-2")
              [ text_
                  "* All values are calculated dynamically by the actual function."
              ]
          ]
      , D.p_
          [ text_
              "If your brain isn't hurting yet, you either have studied this stuff before, you're a genius, or you're not thinking hard enough. In the above example, "
          , D.code__ "f"
          , text_ " "
          , D.i__ "is"
          , text_ " "
          , D.code__ "myFunction"
          , text_ " "
          , D.i__ "even though"
          , text_ " "
          , D.code__ "myFunction"
          , text_
              " doesn't exist yet (it's in the process of being defined). We know it's "
          , D.code__ "f"
          , text_
              " because, otherwise, what else is pushing all the values up to 100 incrementally? And yet, in spite of this mind-bender, none of it is magical. If you follow the control flow of "
          , D.code__ "fix"
          , text_ ", you can trace how it flows step by step. "
          ]
      , D.p_
          [ text_
              "The reason that fixed points only make sense for unfoldable things like functions or streams or events (things that go on "
          , Deku.do
              setElt /\ elt <- useState 0
              disactivatePreviousElt /\ previousElt <- useMailboxed
              dyn $ elt <#> \v ->
                Deku.do
                  _ <- useDyn (v + 1)
                  (pure true <|> (previousElt v $> false)) <#~> do
                    let
                      t = case v of
                        10 ->
                          "ok, you got me, there's an upper bound to this joke. if you click the dots, i'll stop"
                        11 -> "meaning that i'll stop going on and on"
                        _ -> "and on and on"
                    if _ then
                      D.span_
                        [ text_ t
                        , D.a
                            ( klass_ "cursor-pointer" <|> click_ do
                                setElt (v + 1)
                                disactivatePreviousElt
                                  { address: v, payload: unit }
                            )
                            [ text_ "..." ]
                        ]
                    else text_ $ t <> "... "
          , text_
              ") is because the fixed point needs repeated application. A function "
          , D.code__ "(a -> b)"
          , text_ " can be applied "
          , D.i__ "ad infinitum"
          , text_
              " until it produces its value, a cofree comonad never ends, an event potentially keeps emitting, etc."
          ]
      , D.p_
          [ text_
              "This power comes at a price, however. Repeated application of anything in computing runs the risk of going into an infinite loop if you're not careful. So, to avoid overflow, there has to be some reasonable end condition that applies in all cases."
          ]
      ]
  }
