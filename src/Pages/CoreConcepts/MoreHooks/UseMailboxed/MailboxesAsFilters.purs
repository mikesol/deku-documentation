module Pages.CoreConcepts.MoreHooks.UseMailboxed.MailboxesAsFilters where

import Prelude

import Components.Code (psCode, psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Env(..), Subsection, subsection)
import Control.Alt ((<|>))
import Data.Array ((..))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass, klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useMailboxed, useState)
import Deku.Listeners (click)
import Examples as Examples
import QualifiedDo.Alt as Alt

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

mailboxesAsFilters :: forall lock payload. Subsection lock payload
mailboxesAsFilters = subsection
  { title: "Hello mailbox"
  , matter: pure
      [ D.p_
          [ text_ "A mailbox hook is similar to the "
          , D.code__ "useState'"
          , text_
              " hook."], psCode """pusher /\ eventCreator <- useMailboxed""", D.p_ [text_ "However, the left and right side of the returned value are different."
          ]
      , D.ol_
          [ D.li_
              [ text_
                  "On the left, we have a pusher that takes a record of type "
              , D.code__ "{ address :: a, payload :: b }"
              , text_ "."
              ]
          , D.li_
              [ text_
                  "On the right, we have an event creator that takes a value of type "
              , D.code__ "a"
              , text_ " and produces an event of type "
              , D.code__ "Event b"
              , text_ "."
              ]
          ]
      , D.p_
          [ text_ "When the pusher is pushed to, the mailbox delivers payloads of type "
          , D.code__ "b"
          , text_ " "
          , D.i__ "only to"
          , text_
              " events that have been created with by invoking the event creator with the same term of type "
          , D.code__ "a"
          , text_ " that was received by the pusher as an "
          , D.code__ "address"
          , text_ ". You can see an example below."
          ]
      , psCodeWithLink Examples.UseMailboxed
      , exampleBlockquote
          [ Deku.do
              setInt /\ int <- useState 0
              setMailbox /\ mailbox <- useMailboxed
              D.div_
                [ D.button
                    Alt.do
                      klass_ buttonClass
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
          ]

      ]
  }
