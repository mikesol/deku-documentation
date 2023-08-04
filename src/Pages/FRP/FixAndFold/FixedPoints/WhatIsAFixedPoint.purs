module Pages.FRP.FixAndFold.FixedPoints.WhatIsAFixedPoint where

import Prelude

import Components.Code (psCode)
import Components.Table (tableClass)
import Contracts (Subsection, subsection)
import Control.Lazy (fix)
import Data.NonEmpty ((:|))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useDyn, useMailboxed, useState', (<#~>))
import Deku.Listeners (click)

whatIsAFixedPoint :: Subsection
whatIsAFixedPoint = subsection
  { title: "What is a fixed point?"
  , matter: pure
      [ D.p_
          [ text
              "A fixed point of a function is a value that is mapped to itself by the function. Because fixed points are invariant under function application, one way to arrive at a fixed point is to continue providing the output of a function as its input until the value converges."
          ]
      , D.p_
          [ text
              "In functional programming, we tend to think of fixed points of systems, meaning how do systems converge after repeated application of some entity like a function. The standard pattern is to define "
          , D.code__ "fix"
          , text
              " as a function that takes a closure where some arbitrary entity that can be repeatedly applied to a system's input or output, let's call it "
          , D.code__ "u"
          , text ", can be used, then returning "
          , D.code__ "u"
          , text
              " as the result. This is a bit of a mind-melt, as it looks as if the value is being used before it is created."
          ]
      , D.p_
          [ text "As an example, let's consider a function of type "
          , D.code__ "(a -> b)"
          , text
              " as our unit that will be repeatedly applied to an input. That is, it applies itself recursively to its input parameter until it converges at a term of type "
          , D.code__ "b"
          , text ". We'll fix "
          , D.code__ "a"
          , text " as "
          , D.code__ "Int"
          , text " and "
          , D.code__ "b"
          , text " as "
          , D.code__ "Int"
          , text " as well."
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
          D.table [ tableClass ]
            [ D.tr_
                [ D.th [ tableClass ] [ text "Function call" ]
                , D.th [ tableClass ] [ text "Result" ]
                ]
            , D.tr_
                [ D.th [ tableClass ] [ D.code__ "myFunction 0" ]
                , D.th [ tableClass ] [ text (show (myFunction 0)) ]
                ]
            , D.tr_
                [ D.th [ tableClass ] [ D.code__ "myFunction 42" ]
                , D.th [ tableClass ] [ text (show (myFunction 42)) ]
                ]
            , D.tr_
                [ D.th [ tableClass ] [ D.code__ "myFunction1000" ]
                , D.th [ tableClass ] [ text (show (myFunction 1000)) ]
                ]
            ]
      , D.div [ klass "w-full flex justify-end" ]
          [ D.span [ klass "text-sm pr-2" ]
              [ text
                  "* All values are calculated dynamically by the actual function."
              ]
          ]
      , D.p_
          [ text
              "If your brain isn't hurting yet, you either have studied this stuff before, you're a genius, or you're not thinking hard enough. In the above example, "
          , D.code__ "f"
          , text " "
          , D.i__ "is"
          , text " "
          , D.code__ "myFunction"
          , text " "
          , D.i__ "even though"
          , text " "
          , D.code__ "myFunction"
          , text
              " doesn't exist yet (it's in the process of being defined). We know it's "
          , D.code__ "f"
          , text
              " because, otherwise, what else is pushing all the values up to 100 incrementally? And yet, in spite of this mind-bender, none of it is magical. If you follow the control flow of "
          , D.code__ "fix"
          , text ", you can trace how it flows step by step. "
          ]
      , D.p_
          [ text
              "The reason that fixed points only make sense for unfoldable things like functions or streams or events (things that go on "
          , Deku.do
              setElt /\ elt <- useState'
              disactivatePreviousElt /\ previousElt <- useMailboxed
              { value: v } <- useDyn [ 1 /\ pure 0 ] ((\i -> (i + 1) /\ i) <$> elt)
              (true :| (previousElt v $> false)) <#~> do
                let
                  t = case v of
                    10 ->
                      "ok, you got me, there's an upper bound to this joke. if you click the dots, i'll stop"
                    11 -> "meaning that i'll stop going on and on"
                    _ -> "and on and on"
                if _ then
                  D.span_
                    [ text t
                    , D.a
                        [ klass "cursor-pointer"
                        , click do
                            setElt (v + 1)
                            disactivatePreviousElt
                              { address: v, payload: unit }
                        ]
                        [ text "..." ]
                    ]
                else text $ t <> "... "
          , text
              ") is because the fixed point needs repeated application. A function "
          , D.code__ "(a -> b)"
          , text " can be applied "
          , D.i__ "ad infinitum"
          , text
              " until it produces its value, a cofree comonad never ends, an event potentially keeps emitting, etc."
          ]
      , D.p_
          [ text
              "This power comes at a price, however. Repeated application of anything in computing runs the risk of going into an infinite loop if you're not careful. So, to avoid overflow, there has to be some reasonable end condition that applies in all cases."
          ]
      ]
  }
