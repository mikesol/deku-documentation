module Examples.UsingFunctionsAsMonads where

import Prelude

import Control.Monad.Reader (ask)
import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA
import Deku.Control (text)
import Deku.Core (NutWith)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Poll (Poll)

type Env =
  { isSignedIn :: Poll Boolean
  , setIsSignedIn :: Boolean -> Effect Unit
  }

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
    [ DA.klass_ buttonClass
    , DL.runOn DL.click $ isSignedIn <#> not >>> setIsSignedIn
    ]
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

fullApp :: AppMonad
fullApp = do
  mySignIn <- signIn
  myTable <- table
  pure $ D.div_ [ D.div_ [ mySignIn ], D.div_ [ myTable ] ]

app :: ExampleSignature
app runExample = runExample Deku.do
  setIsSignedIn /\ isSignedIn <- useState false
  fullApp { setIsSignedIn, isSignedIn }

main :: Effect Unit
main = void $ app $ map pure runInBody