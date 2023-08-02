module Examples.UseMailboxed where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Array ((..))
import Data.NonEmpty ((:|))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useMailboxed, useState)
import Deku.Listeners (click)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

main :: ExampleSignature
main runExample = runExample Deku.do
  setInt /\ int <- useState 0
  setMailbox /\ mailbox <- useMailboxed
  D.div_
    [ D.button
        [ klass buttonClass
        , click $ int <#> \i -> do
            setMailbox { address: i, payload: unit }
            setInt ((i + 1) `mod` 100)
        ]
        [ text "Bang!" ]
    , D.div_
        ( (0 .. 99) <#> \n -> D.span
            [ klass $ (false :| (mailbox n $> true)) <#>
                if _ then "" else "hidden"
            ]
            [ text
                ( ( if n == 99 then "We're done here"
                    else show n
                  ) <> " "
                )
            ]
        )
    ]
