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
import QualifiedDo.Alt as Alt

main :: Effect Unit
main = runInBody Deku.do
  setInt /\ int <- useState 0
  setMailbox /\ mailbox <- useMailboxed
  D.div_
    [ D.a
        Alt.do
          klass_ "cursor-pointer"
          click $ int <#> \i -> do
            setMailbox { address: i, payload: unit }
            setInt ((i + 1) `mod` 100)
        [ text_ "Bang!" ]
    , D.div_
        ( (0 .. 99) <#> \n -> D.span
            ( klass $ (pure false <|> (mailbox n $> true)) <#>
                if _ then "" else "hidden"
            )
            [ text_
                ( ( if n == 99 then "We're done here"
                    else show n
                  ) <> " "
                )
            ]
        )
    ]