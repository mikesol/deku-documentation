module Pages.CoreConcepts.Collections.Monoids.ComponentsAsMonoids where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Attributes (href)
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

componentsAsMonoids :: Subsection
componentsAsMonoids = subsection
  { title: "Components as monoids"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.ComponentsAsMonoids
      pure [ D.p_
          [ text
              "In addition to being a semigroup, components are a monoid, with the empty element being "
          , D.code__ "blank"
          , text
              ". Because it's a monoid, we can use all sorts of cool functions on Deku components, like "
          , D.a
              [href
                  "https://pursuit.purescript.org/packages/purescript-foldable-traversable/6.0.0/docs/Data.Foldable#v:intercalate"
              ]
              [ D.code__ "intercalate" ]
          , text_ "."

          ]
      , example
      ]
  }
