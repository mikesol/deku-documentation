module Pages.FRP.Events.OptimizedEvents.OptimizedEventCreation where

import Prelude

import Components.Code (jsCode, psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Components.ProTip (proTip)
import Contracts (Subsection, subsection)
import Control.Monad.ST.Internal (modify, new, read, run)
import Control.Monad.ST.Uncurried (mkSTFn1, runSTFn1, runSTFn2)
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples
import FRP.Event (createPureO, subscribePureO)

optimizedEventCreation :: Subsection
optimizedEventCreation = subsection
  { title: "Optimized event creation"
  , matter: pure
      [ D.p_
          [ text "Let's look at the same "
          , D.code__ "createPure"
          , text
              " example as above, but we'll used the optimized event creation functions."
          , psCodeWithLink Examples.OptimizedEventCreation
          , exampleBlockquote
              [ text $ show $ run do
                  { push, event } <- createPureO
                  rf <- new 0
                  _ <- runSTFn2 subscribePureO event $ mkSTFn1 \n -> do
                    void $ modify (add n) rf
                  runSTFn1 push 48
                  runSTFn1 push 49
                  runSTFn1 push 50
                  read rf
              ]
          ]
      , proTip
          { header: text "Pure or impure, pick your poison"
          , message: D.div_
              [ text
                  "All of the pure functions shown in this section have their impure equivalents as well in the "
              , D.code__ "Effect"
              , text " monad if you remove the word"
              , D.code__ "pure"
              , text
                  " from the function signature. Use whichever one makes sense for your application!"
              ]
          }
      , D.p__
          "Now, let's inspect the PureScript compiler's output for the unoptimized followed by the optimized versions."
      , D.h4__ "Unoptimized"
      , jsCode
          """var v1 = FRP_Event.createPure();
var rf = {
    value: 0
};
FRP_Event.subscribePure(v1.event)(function (n) {
    return $$void(Control_Monad_ST_Internal.modify(add(n))(rf));
})();
v1.push(48)();
v1.push(49)();
v1.push(50)();
return rf.value;"""
      , D.h4__ "Optimized"
      , jsCode
          """var v = FRP_Event.createPureO();
var rf = {
    value: 0
};
FRP_Event.subscribePureO(v.event, function (n) {
    return $$void(Control_Monad_ST_Internal.modify(add(n))(rf))();
});
v.push(48);
v.push(49);
v.push(50);
return rf.value;"""
      , D.p_
          [ text
              "You can see that the optmized events have one less thunk for each call to "
          , D.code__ "push"
          , text
              ". While a few extra thunks here and there won't move the needle for your application, thousands of thunks a second add up, and if you're dealing with animations, you can very easily reach the tens of thousands of thunks a second. So to preemptively dethunkify your app, use the optimized event creation functions!"
          ]
      ]
  }
