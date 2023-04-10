module Examples.UseMailboxed where

import Prelude

import Control.Alt ((<|>))
import Data.Array ((..))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass, klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useMailboxed, useState)
import Deku.Listeners (click)
import Deku.Toplevel (runInBody)
import Effect (Effect)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

main :: Effect Unit
main = runInBody Deku.do
  setInt /\ int <- useState 0
  setMailbox /\ mailbox <- useMailboxed
  D.div_
    [ D.button
        [ klass_ buttonClass
        , click $ int <#> \i -> do
            setMailbox { address: i, payload: unit }
            setInt ((i + 1) `mod` 100)
        ]
        [ text_ "Bang!" ]
    , D.div_
        ( (0 .. 99) <#> \n -> D.span
            [ klass $ (pure false <|> (mailbox n $> true)) <#>
                if _ then "" else "hidden"
            ]
            [ text_
                ( ( if n == 99 then "We're done here"
                    else show n
                  ) <> " "
                )
            ]
        )
    ]
