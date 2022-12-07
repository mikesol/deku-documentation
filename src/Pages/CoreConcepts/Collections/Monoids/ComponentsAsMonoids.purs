module Pages.CoreConcepts.Collections.Monoids.ComponentsAsMonoids where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Constants (tripleQ)
import Contracts (Subsection, subsection)
import Data.Array (drop, intercalate, zipWith)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Lens (over)
import Data.Lens.Index (ix)
import Data.String (Pattern(..), split)
import Deku.Attributes (href_, klass_)
import Deku.Control (text_)
import Deku.DOM as D

lyrics :: Array String
lyrics = split (Pattern "\n")
  """Twelve drummers drumming
Eleven pipers piping
Ten lords a-leaping
Nine ladies dancing
Eight maids a-milking
Seven swans a-swimming
Six geese a-laying
Five golden rings
Four calling birds
Three french hens
Two turtle doves
A partridge in a pear tree"""

textColors :: Array String
textColors = split (Pattern "\n")
  """text-lime-400
text-red-400
text-sky-400
text-purple-400
text-emerald-400
text-stone-400
text-pink-400
text-yellow-400
text-indigo-400
text-zinc-400
text-amber-400
text-neutral-400"""

toWord :: Int -> String
toWord 1 = "first"
toWord 2 = "second"
toWord 3 = "third"
toWord 4 = "fourth"
toWord 5 = "fifth"
toWord 6 = "sixth"
toWord 7 = "seventh"
toWord 8 = "eighth"
toWord 9 = "ninth"
toWord 10 = "tenth"
toWord 11 = "eleventh"
toWord 12 = "twelfth"
toWord _ = "nth"

componentsAsMonoids :: forall lock payload. Subsection lock payload
componentsAsMonoids = subsection
  { title: "Components as monoids"
  , matter: pure
      [ D.p_
          [ text_
              "In addition to being a semigroup, components are a monoid, with the empty element being "
          , D.code__ "blank"
          , text_
              ". Because it's a monoid, we can use all sorts of cool functions on Deku components, like "
          , D.a
              ( href_
                  "https://pursuit.purescript.org/packages/purescript-foldable-traversable/6.0.0/docs/Data.Foldable#v:intercalate"
              )
              [ D.code__ "intercalate" ]
          , text_ "."

          ]
      , psCode
          ( """module Main where

import Prelude

import Data.Array (drop, intercalate, zipWith)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Lens (over)
import Data.Lens.Index (ix)
import Data.String (Pattern(..), split)
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)

lyrics :: Array String
lyrics = split (Pattern "\n")
 """ <> tripleQ
              <>
                """Twelve drummers drumming
Eleven pipers piping
Ten lords a-leaping
Nine ladies dancing
Eight maids a-milking
Seven swans a-swimming
Six geese a-laying
Five golden rings
Four calling birds
Three french hens
Two turtle doves
A partridge in a pear tree"""
              <> tripleQ
              <>
                """

textColors :: Array String
textColors = split (Pattern "\n")
  """
              <> tripleQ
              <>
                """text-lime-400
text-red-400
text-sky-400
text-purple-400
text-emerald-400
text-stone-400
text-pink-400
text-yellow-400
text-indigo-400
text-zinc-400
text-amber-400
text-neutral-400"""
              <> tripleQ
              <>
                """

toWord :: Int -> String
toWord 1 = "first"
toWord 2 = "second"
toWord 3 = "third"
toWord 4 = "fourth"
toWord 5 = "fifth"
toWord 6 = "sixth"
toWord 7 = "seventh"
toWord 8 = "eighth"
toWord 9 = "ninth"
toWord 10 = "tenth"
toWord 11 = "eleventh"
toWord 12 = "twelfth"
toWord _ = "nth"

main :: Effect Unit
main = runInBody do
  let
    styleF s t = D.span (klass_ s) [ text_ t ]
    zipStyles = zipWith styleF textColors
    lyrics0 = zipStyles lyrics
    lyrics1 = zipStyles (over (ix 11) ("and " <> _) lyrics)
  D.div_
    [ D.ol_
        ( lyrics # mapWithIndex \i _ ->
            D.p_
              [ text_ "On the "
                  <> text_ (toWord (i + 1))
                  <> text_
                    " day of Christmas my true love gave to me: "
                  <> intercalate (text_ ", ")
                    ( drop (11 - i) $
                        if i == 0 then lyrics0 else lyrics1
                    )
                  <> text_ "."
              ]
        )
    ]
"""
          )
      , do
          let
            styleF s t = D.span (klass_ s) [ text_ t ]
            zipStyles = zipWith styleF textColors
            lyrics1 = zipStyles (over (ix 11) ("and " <> _) lyrics)
            lyrics0 = zipStyles lyrics

          exampleBlockquote
            [ D.div_
                [ D.ol_
                    $ lyrics # mapWithIndex \i _ ->
                        D.p_
                          [ text_ "On the "
                              <> text_ (toWord (i + 1))
                              <> text_
                                " day of Christmas my true love gave to me: "
                              <> intercalate (text_ ", ")
                                ( drop (11 - i) $
                                    if i == 0 then lyrics0 else lyrics1
                                )
                              <> text_ "."
                          ]
                ]
            ]
      ]
  }
