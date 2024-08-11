module Pages.CoreConcepts.Effects.Hydration.AnAlternativeEffectModel where

import Prelude

import Contracts (Subsection, subsection)

import Deku.Control (text_)
import Deku.DOM as D

anAlternativeEffectModel :: Subsection
anAlternativeEffectModel = subsection
  { title: "An alternative effect model"
  , matter: pure
      [ D.p_
          [ text_
              "First, a note on why Deku ❤️ hydration. Deku was originally developed to build games and musical instruments. Because of that, the contributors developed a culture of components being as “dumb” as possible. This means that, when a component mounts or unmounts from an application, the act of appearing or disappearing should have minimal impact on the UI."
          ]
      , D.p_
          [ text_
              "Why the austerity? Because if you’re writing a game and aiming for 60 FPS, you can't mess around. Random side-effects here and there add up and tank performance. If you’re reading this documentation, it's likely because you too are obsessively anti-jank. Deku wages this crusade against jank at every level of a project, and the docs below will give you helpful hints on how to do it."
          ]
      ]
  }
