module Pages.FRP.Events.OptimizedEvents.OptimizedEventFunctions where

import Prelude

import Components.Code (jsCode, psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Constants (tripleQ)
import Contracts (Subsection, subsection)
import Control.Monad.ST.Internal (modify, new, read, run, write)
import Control.Monad.ST.Uncurried (mkSTFn1, mkSTFn2, runSTFn1, runSTFn2)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, Subscriber(..), createPure, fold, makeLemmingEventO, subscribePure)
import QualifiedDo.Alt as Alt

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

example :: String
example =
  """module Main where

import Prelude

import Control.Monad.ST.Internal (modify, new, read, run, write)
import Control.Monad.ST.Uncurried (mkSTFn1, mkSTFn2, runSTFn1, runSTFn2)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, Subscriber(..), createPure, fold, makeLemmingEventO, subscribePure)
import QualifiedDo.Alt as Alt

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

main :: Effect Unit
main = runInBody Deku.do
  setInt /\ int <- useState 0
  let
    dedup :: forall a. Eq a => Event a -> Event a
    dedup e = makeLemmingEventO $ mkSTFn2 \(Subscriber subscribe) callback -> do
      rf <- new Nothing
      u <- runSTFn2 subscribe e $ mkSTFn1 \i -> do
        v <- read rf
        when (v /= Just i) do
          runSTFn1 callback i
          void $ write (Just i) rf
      pure u
  D.div_
    [ D.div__
        """
    <> tripleQ
    <>
      """Press the buttons below to add values to the sum.
But beware! Duplicate presses will be ignored,
so be sure to alternate between the buttons."""
    <> tripleQ
    <>
      """
    , D.div_ $ [ 10, 100, 1000 ] <#> \n ->
        D.button
          Alt.do
            click_ (setInt n)
            klass_ buttonClass
          [ text_ ("Add " <> show n) ]
    , D.div_ [ text $ (show <$> fold (+) 0 (dedup int)) ]
    , D.div_
        [ text_ "And check out this pure number! "
        , text_ $ show $ run do
            { push, event } <- createPure
            rf <- new 0
            _ <- subscribePure (dedup event) \n -> do
              void $ modify (add n) rf
            push 1
            push 1
            push 2
            push 2
            push 2
            push 3
            push 3
            read rf
        ]
    ]
"""

optimizedEventFunctions :: forall lock payload. Subsection lock payload
optimizedEventFunctions = subsection
  { title: "Optimized stand-alone events"
  , matter: pure
      [ D.p_
          [ text_ "The same benefits can be applied to "
          , D.code__ "makeLemmingEvent"
          , text_ " through its optimized homologue, "
          , D.code__ "makeLemmingEventO"
          , text_ ". To show this, we'll use the same "
          , D.code__ "dedup"
          , text_ " function rewritten in optimized form."
          ]
      , psCode example
      , exampleBlockquote
          [ Deku.do
              setInt /\ int <- useState 0
              let
                dedup :: forall a. Eq a => Event a -> Event a
                dedup e = makeLemmingEventO $ mkSTFn2
                  \(Subscriber subscribe) callback -> do
                    rf <- new Nothing
                    u <- runSTFn2 subscribe e $ mkSTFn1 \i -> do
                      v <- read rf
                      when (v /= Just i) do
                        runSTFn1 callback i
                        void $ write (Just i) rf
                    pure u
              D.div_
                [ D.div__
                    """Press the buttons below to add values to the sum.
                                  But beware! Duplicate presses will be ignored,
                                  so be sure to alternate between the buttons."""
                , D.div_ $ [ 10, 100, 1000 ] <#> \n ->
                    D.button
                      Alt.do
                        click_ (setInt n)
                        klass_ buttonClass
                      [ text_ ("Add " <> show n) ]
                , D.div_ [ text $ (show <$> fold (+) 0 (dedup int)) ]
                , D.div_
                    [ text_ "And check out this pure number! "
                    , text_ $ show $ run do
                        { push, event } <- createPure
                        rf <- new 0
                        _ <- subscribePure (dedup event) \n -> do
                          void $ modify (add n) rf
                        push 1
                        push 1
                        push 2
                        push 2
                        push 2
                        push 3
                        push 3
                        read rf
                    ]
                ]
          ]
      , D.p__
          "You'll see that the optimized version has less thunks - there is one less "
      , D.code__ "do"
      , text_ " bloc, and the callback does not need a thunk anymore."
      , D.h4__ "Unoptimized"
      , jsCode
          """var dedup = function (dictEq) {
  var notEq = Data_Eq.notEq(Data_Maybe.eqMaybe(dictEq));
  return function (e) {
      return FRP_Event.makeLemmingEvent(function (subscribe) {
          return function (callback) {
              return function __do() {
                  var rf = Control_Monad_ST_Internal["new"](Data_Maybe.Nothing.value)();
                  var u = subscribe(e)(function (i) {
                      return function __do() {
                          var v1 = Control_Monad_ST_Internal.read(rf)();
                          return when(notEq(v1)(new Data_Maybe.Just(i)))(function __do() {
                              callback(i)();
                              return $$void(Control_Monad_ST_Internal.write(new Data_Maybe.Just(i))(rf))();
                          })();
                      };
                  })();
                  return u;
              };
          };
      });
  };
};"""
      , D.h4__ "Optimized"
      , jsCode
          """var dedup = function (dictEq) {
  var notEq = Data_Eq.notEq(Data_Maybe.eqMaybe(dictEq))
  return function (e) {
    return FRP_Event.makeLemmingEventO(function (v1, callback) {
      var rf = Control_Monad_ST_Internal['new'](Data_Maybe.Nothing.value)()
      var u = v1(e, function (i) {
        var v2 = Control_Monad_ST_Internal.read(rf)()
        return when(notEq(v2)(new Data_Maybe.Just(i)))(function __do() {
          callback(i)
          return $$void(
            Control_Monad_ST_Internal.write(new Data_Maybe.Just(i))(rf)
          )()
        })()
      })
      return u
    })
  }
}
"""
      , D.p__
          "If you're a library author or you're working with animations, you should try to use optimized event functions at every turn. For a slightly more verbose formulation, you'll gain a nice performance boost, especially when combining this with the PureScript es-backend optimizer. Deku is written entirely using this optimized syntax, so you get it for free when using that library!"
      ]
  }
