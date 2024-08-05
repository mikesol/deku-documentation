module Pages.FRP.FixAndFold.FoldingEvents.WhenToFixAndWhenToFold where

import Prelude

import Components.TargetedLink (targetedLink)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

whenToFixAndWhenToFold :: Subsection
whenToFixAndWhenToFold = subsection
  { title: "When to fix and when to fold"
  , matter:
      pure
        [ D.p_
            [ text_
                "In short, it's up to you. They're actually isomorphic. Like a lot of fixed-pointy-thingees (for example the Y-combinator), you can do the same thing several ways. In general, fixed points are harder to read but can feel more expressive or elegant."
            ]
        ]
  }
