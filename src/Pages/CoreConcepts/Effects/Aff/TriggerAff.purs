module Pages.CoreConcepts.Effects.Aff.TriggerAff where

import Prelude

import Components.ProTip (proTip)
import Components.TargetedLink (targetedLink)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

triggerAff :: Subsection
triggerAff = subsection
  { title: "The useAffSequential hook"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.RunningAffsSequentiallyInResponseToAnEvent
      pure [ D.p_
          [ text
              "The following hook will emit an aff on each event. It does no cancellation, so if affs pile up, they will keep going until the element leaves the screen. If you're a glutton for punishment, click the link really fast ~20 times while watching your network tab."
          ]
      , example
      , proTip
          { header:
              D.span_
                [ D.code__ "Aff", text_ "able asynchronicity in PureScript" ]
          , message: D.div_
              [ text
                  "Up until now, the side-effects we have seen have all been synchronous. In PureScript, we also have "
              , D.code__ "Aff"
              , text
                  " for asynchronous effects. You can think of them as "
              , targetedLink
                  "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise"
                  [ D.code__ "Promises" ]
              , text_ " that are meant to be broken (see "
              , targetedLink
                  "https://pursuit.purescript.org/packages/purescript-aff/5.1.2/docs/Effect.Aff#t:Canceler"
                  [ D.code__ "Canceler" ]
              , text_ "). "
              , D.code__ "liftEffect"
              , text_ " converts an "
              , D.code__ "Effect"
              , text_ "ful computation to an "
              , D.code__ "Aff"
              , text_ "ish ("
              , D.code__ "Aff"
              , text_ "ular? "
              , D.code__ "Aff"
              , text_ "erific?) computation and "
              , D.code__ "launchAff_"
              , text_ " takes an "
              , D.code__ "Aff"
              , text_ " and launches it from within an "
              , D.code__ "Effect"
              , text_ ", making that block run asynchronously."
              ]
          }
      ]
  }
