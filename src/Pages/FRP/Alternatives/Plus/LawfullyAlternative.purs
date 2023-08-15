module Pages.FRP.Alternatives.Plus.LawfullyAlternative where

import Prelude

import Contracts (Env(..), Subsection, getEnv, subsection)
import Deku.Attributes (klass, klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Router.ADT (Route(..))

lawfullyAlternative :: Subsection
lawfullyAlternative = subsection
  { title: "Lawfully alternative"
  , matter: do
      Env { routeLink } <- getEnv
      pure [ D.p_
          [ text_ "Let's verify that "
          , D.code__ "alt"
          , text_ " and "
          , D.code__ "empty"
          , text_ " fulfill the laws for "
          , D.code__ "Alternative"
          , text_ ", namely:"
          ]
      , D.ul_
          [ D.li_
              [ D.b__ "Distributivity"
              , text_ ": "
              , D.code__ "(f <|> g) <*> x == (f <*> x) <|> (g <*> x)"
              ]
          , D.li_
              [ D.b__ "Annihilation"
              , text_ ": "
              , D.code__ "empty <*> f = empty"
              ]
          ]
      , D.p_
          [ text_ "The "
          , D.b__ "Distributivity"
          , text_ " condition is fulfilled by thinking of "
          , D.code__ "alt"
          , text_ " as the conjunction "
          , D.b__ "or"
          , text_ ", meaning that it's one event or the other. The function "
          , D.code__ "f"
          , text_ " "
          , D.b__ "or"
          , text_ " "
          , D.code__ "g"
          , text_ " applied to "
          , D.code__ "x"
          , text_ " is the same as the function "
          , D.code__ "f"
          , text_ " applied to "
          , D.code__ "x"
          , text_ " "
          , D.b__ "or"
          , text_ " the function "
          , D.code__ "g"
          , text_ " applied to "
          , D.code__ "x"
          , text_ ". "
          , D.b__ "Annihalation "
          , text_ " is true because, as we learned in the "
          , routeLink Applicatives
          , text_
              " section, the composite event only fires after both sides are fired. As one side never fires, the whole thing never fires, so it is empty."
          ]
      , D.div [ klass_ "text-right" ] [ text_ "∎" ]

      ]
  }
