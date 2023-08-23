module Pages.CoreConcepts.Providers.FunctionsAsProviders.UsingFunctionsAsMonads where

import Prelude

import Components.Code (psCode)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

usingFunctionsAsMonads :: Subsection
usingFunctionsAsMonads = subsection
  { title: "Using functions as monads"
  , matter: do
      example <- getExample StartExpanded Nothing
        Examples.UsingFunctionsAsMonads
      pure
        [ D.p_
            [ text_
                "As a motivating example, let's create a Deku app that simulates a pre- and post-authentication UI. In React, this would be accomplished with an authentication context and provider. In Deku, we'll just use a function! And we'll treat the function as a monad to make the flow more ergonomic."
            ]
        , D.p__ "Our basic authentication app is written thusly."
        , example
        , D.p_
            [ text_
                "Like React Contexts and Providers, we can dip into the provider from any component without explicitly passing values through the application. This is because "
            , D.code__ "AppMonad"
            , text_ " expands to the signature "
            , D.code__ " Function Env Nut"
            , text_ " where "
            , D.code__ "Env"
            , text_ " is the context."
            ]
        , D.p_
            [ text_ "In PureScript, "
            , D.code__ "Function Env"
            , text_
                " is a monad, which means that its context gets passed down the monadic stack automatically through "
            , D.code__ "bind"
            , text_ "s in "
            , D.code__ "do"
            , text_ " notation. Take the following extract from the code above."
            ]
        , psCode
            """app :: AppMonad
app = do
  mySignIn <- signIn
  myTable <- table
  pure $ D.div_ [ D.div_ [ mySignIn ], D.div_ [ myTable ] ]"""
        , D.p_
            [ text_ "By left-binding, "
            , D.code__ "signIn"
            , text_ " and "
            , D.code__ "table"
            , text_ " automagically get the "
            , D.code__ "Env"
            , text_ " context passed down through the stack."
            ]
        , D.p_
            [ text_
                "If you're a seasoned functional programmer, you've likely used this pattern in many applications. It's also called the "
            , D.code__ "Reader"
            , text_
                " monad. Many functional UI frameworks (including React) have special mechanics to achieve this, but in Deku, the framework is set up in such a way to encourage time-tested functional patterns."
            ]
        ]
  }
