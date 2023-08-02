module Pages.FRP.Alternatives.Plus.LawfullyAlternative where

import Prelude

import Contracts (Env(..), Subsection, getEnv, subsection)
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Router.ADT (Route(..))

lawfullyAlternative :: Subsection
lawfullyAlternative = subsection
  { title: "Lawfully alternative"
  , matter: do
      Env { routeLink } <- getEnv
      pure [ D.p_
          [ text "Let's verify that "
          , D.code__ "alt"
          , text " and "
          , D.code__ "empty"
          , text " fulfill the laws for "
          , D.code__ "Alternative"
          , text ", namely:"
          ]
      , D.ul_
          [ D.li_
              [ D.b__ "Distributivity"
              , text ": "
              , D.code__ "(f <|> g) <*> x == (f <*> x) <|> (g <*> x)"
              ]
          , D.li_
              [ D.b__ "Annihilation"
              , text ": "
              , D.code__ "empty <*> f = empty"
              ]
          ]
      , D.p_
          [ text "The "
          , D.b__ "Distributivity"
          , text " condition is fulfilled by thinking of "
          , D.code__ "alt"
          , text " as the conjunction "
          , D.b__ "or"
          , text ", meaning that it's one event or the other. The function "
          , D.code__ "f"
          , text " "
          , D.b__ "or"
          , text " "
          , D.code__ "g"
          , text " applied to "
          , D.code__ "x"
          , text " is the same as the function "
          , D.code__ "f"
          , text " applied to "
          , D.code__ "x"
          , text " "
          , D.b__ "or"
          , text " the function "
          , D.code__ "g"
          , text " applied to "
          , D.code__ "x"
          , text ". "
          , D.b__ "Annihalation "
          , text " is true because, as we learned in the "
          , routeLink Applicatives
          , text
              " section, the composite event only fires after both sides are fired. As one side never fires, the whole thing never fires, so it is empty."
          ]
      , D.div [ klass "text-right" ] [ text "∎" ]

      ]
  }
