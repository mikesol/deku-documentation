module Examples.UsingFunctionsAsMonads where

import Prelude

import Control.Monad.Reader (ask)
import Data.Tuple.Nested ((/\))
import Deku.Control (text, text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (useState)
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

type AppMonad = Env -> Nut

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
  pure $ D.td
    [ DA.klass_
        "whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-0"
    ]
    [ text $ isSignedIn <#> if _ then "Mike" else "Nobody" ]

balance :: AppMonad
balance = do
  { isSignedIn } <- ask
  pure $ D.td [ DA.klass_ "whitespace-nowrap px-3 py-4 text-sm text-gray-500" ]
    [ text $ isSignedIn <#> if _ then "42 bucks" else "No money" ]

table :: AppMonad
table = do
  myName <- name
  myBalance <- balance
  pure $ D.table [ DA.klass_ "divide-y divide-gray-300" ]
    [ D.tr_
        [ D.th
            [ DA.scope_ "col"
            , DA.klass_
                "py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-0"
            ]
            [ text_ "Name" ]
        , D.th
            [ DA.scope_ "col"
            , DA.klass_
                "px-3 py-3.5 text-left text-sm font-semibold text-gray-900"
            ]
            [ text_ "Balance" ]
        ]
    , D.tbody [ DA.klass_ "divide-y divide-gray-200" ]
        [ D.tr_ [ myName, myBalance ] ]
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
main = void $ app runInBody