module Pages.CoreConcepts.Providers.FunctionsAsProviders.UsingFunctionsAsMonads where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Constants (tripleQ)
import Contracts (Subsection, subsection)
import Control.Monad.Reader (ask)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text)
import Deku.Control (text_)
import Deku.Core (NutWith)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click)
import Effect (Effect)
import FRP.Event (Event)
import QualifiedDo.Alt as Alt

example :: String
example =
  """module Scratch where

import Prelude

import Control.Monad.Reader (ask)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text)
import Deku.Core (NutWith)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event)
import QualifiedDo.Alt as Alt

type Env =
  { isSignedIn :: Event Boolean, setIsSignedIn :: Boolean -> Effect Unit }

buttonClass =
  """ <> tripleQ
    <>
      """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6"""
    <> tripleQ
    <>
      """ :: String

type AppMonad = NutWith Env

signIn :: AppMonad
signIn = do
  { setIsSignedIn, isSignedIn } <- ask
  pure $ D.button
    Alt.do
      klass_ buttonClass
      click $ isSignedIn <#> not >>> setIsSignedIn
    [ text $ isSignedIn <#> if _ then "Sign out" else "Sign in" ]

name :: AppMonad
name = do
  { isSignedIn } <- ask
  pure $ D.td_ [ text $ isSignedIn <#> if _ then "Mike" else "Nobody" ]

balance :: AppMonad
balance = do
  { isSignedIn } <- ask
  pure $ D.td_ [ text $ isSignedIn <#> if _ then "42 bucks" else "No money" ]

table :: AppMonad
table = do
  myName <- name
  myBalance <- balance
  pure $ D.table_
    [ D.tr_ [ D.th__ "Name", D.th__ "Balance" ]
    , D.tr_ [ myName, myBalance ]
    ]

app :: AppMonad
app = do
  mySignIn <- signIn
  myTable <- table
  pure $ D.div_ [ D.div_ [ mySignIn ], D.div_ [ myTable ] ]

main :: Effect Unit
main = runInBody Deku.do
  setIsSignedIn /\ isSignedIn <- useState false
  app { setIsSignedIn, isSignedIn }"""

usingFunctionsAsMonads :: forall lock payload. Subsection lock payload
usingFunctionsAsMonads = subsection
  { title: "Using functions as monads"
  , matter: pure
      [ D.p_
          [ text_
              "As a motivating example, let's create a Deku app that simulates a pre- and post-authentication UI. In React, this would be accomplished with an authentication context and provider. In Deku, we'll just use a function! And we'll treat the function as a monad to make the flow more ergonomic."
          ]
      , D.p__ "Our basic authentication app is written thusly."
      , psCode example
      , D.p__ "And here it is for your authenticating pleasure!"
      , exampleBlockquote
          [ Deku.do
              setIsSignedIn /\ isSignedIn <- useState false
              app { setIsSignedIn, isSignedIn }
          ]
      , D.p_
          [ text_
              "Like React Contexts and Providers, we can dip into the provider in any component without explicitly passing values through the application. This is because "
          , D.code__ "AppMonad"
          , text_ " expands to the signature "
          , D.code__ "forall lock payload. Function Env (Domable lock payload)"
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
          , text_ "s in the "
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
      , D.p_ [text_ "If you're a seasoned functional programmer, you've likely used this pattern in many applications. It's also called the ", D.code__ "Reader", text_ " monad. Many functional UI frameworks (including React) have special mechanics to achieve this, but in Deku, the framework is set up in such a way to encourage time-tested functional patterns."]
      ]
  }

type Env =
  { isSignedIn :: Event Boolean, setIsSignedIn :: Boolean -> Effect Unit }

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

type AppMonad = NutWith Env

signIn :: AppMonad
signIn = do
  { setIsSignedIn, isSignedIn } <- ask
  pure $ D.button
    Alt.do
      klass_ buttonClass
      click $ isSignedIn <#> not >>> setIsSignedIn
    [ text $ isSignedIn <#> if _ then "Sign out" else "Sign in" ]

name :: AppMonad
name = do
  { isSignedIn } <- ask
  pure $ D.td_ [ text $ isSignedIn <#> if _ then "Mike" else "Nobody" ]

balance :: AppMonad
balance = do
  { isSignedIn } <- ask
  pure $ D.td_ [ text $ isSignedIn <#> if _ then "42 bucks" else "No money" ]

table :: AppMonad
table = do
  myName <- name
  myBalance <- balance
  pure $ D.table_
    [ D.tr_ [ D.th__ "Name", D.th__ "Balance" ]
    , D.tr_ [ myName, myBalance ]
    ]

app :: AppMonad
app = do
  mySignIn <- signIn
  myTable <- table
  pure $ D.div_ [ D.div_ [ mySignIn ], D.div_ [ myTable ] ]
