module Pages.CoreConcepts.Providers.FunctionsAsProviders.PassingAroundHooks where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Control.Alt ((<|>))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (guard, text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useHot, useState, useState')
import Deku.Listeners (click, click_)
import Examples as Examples
import FRP.Event (keepLatest)

passingAroundHooks :: forall lock payload. Subsection lock payload
passingAroundHooks = subsection
  { title: "Passing around hooks"
  , matter: pure
      [ let
          lt t = D.span (klass_ "line-through") [ text_ t ]
        in
          D.p_
            [ text_
                "As we saw in the first example on this page, we can send the results of hooks - events and pushers - down through our provider system. This "
            , lt "provides"
            , text_ " "
            , lt "provisions"
            , text_ " "
            , lt "provokes"
            , text_
                " makes for an elegant and flexible inter-component communication mechanism. However, a case may arise where you accidentally over-wire your system so that you are pushing to a hook that could not possibly active because its element has disappeared. What happens in this case? Let's find out!"
            ]
      , D.p_
          [ text_
              "The following example is slightly contrived (to be fair, they all are...), but we'll create a small UI where you have to follow the following steps in order."
          ]
      , psCodeWithLink Examples.PassingAroundHooks
      , D.ol_
          [ D.li_ [ text_ "Click ", D.b__ "Cede control." ]
          , D.li_ [ text_ "Click ", D.b__ "Increment", text_ " several times." ]
          , D.li_ [ text_ "Click ", D.b__ "Goodbye" ]
          , D.li_ [ text_ "Click ", D.b__ "Increment", text_ " again." ]
          ]
      , exampleBlockquote
          [ Deku.do
              setIncrementer /\ incrementer <- useState'
              setGoodbye /\ goodbye <- useState true
              D.div_
                [ D.a
                    ( klass_ "cursor-pointer" <|>
                        ( click $ keepLatest $ incrementer <#>
                            \{ setNumber, number } -> number <#>
                              (add 1 >>> setNumber)
                        )
                    )
                    [ text_ "Increment" ]
                , D.div_
                    [ D.a
                        ( klass_ "cursor-pointer"
                            <|> (click_ (setGoodbye false))
                        )
                        [ text_ "Goodbye" ]
                    ]
                , D.div_
                    [ guard goodbye Deku.do
                        setNumber /\ number <- useHot 0
                        D.div_
                          [ D.div_
                              [ text (number <#> show >>> ("n = " <> _))
                              ]
                          , D.div_
                              [ D.a
                                  ( klass_ "cursor-pointer" <|>
                                      ( click_
                                          (setIncrementer { setNumber, number })
                                      )
                                  )
                                  [ text_ "Cede control" ]
                              ]
                          ]
                    ]
                ]
          ]
      , D.p__
          "In this code, we've gotten ourselves into the curious situation where increment is wired up to a listener that can no longer possibly listen: there is no path in the UI that would lead to the counter reappearing."
      , D.p__
          "Thankfully, this is quite rare, and if it does ever arise, the performance impact is minimal as it results in very little CPU being used. That said, 100s of zombie subscriptions will slow down your app, so avoid complex systems like this when possible. Your colleagues will thank you!"
      ]
  }
