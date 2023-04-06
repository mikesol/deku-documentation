module Examples
  ( Examples(..)
  , ExampleADT(..)
  , examples
  , exampleToString
  , exampleToSlug
  ) where

import Data.Newtype (class Newtype, unwrap)

foreign import unMemoizedApplicationURL :: String
foreign import filteringAnEventURL :: String
foreign import usingTheOriginalEventURL :: String
foreign import eventsAsSemiringsURL :: String
foreign import usingTheHookToSwitchBetweenElementsURL :: String
foreign import rowPolymorphismAndProvidersURL :: String
foreign import addingAttributesURL :: String
foreign import biasingASideOfSamplingURL :: String
foreign import theCreatePureEffectURL :: String
foreign import samplingABehaviorAndDiscardingTheEventURL :: String
foreign import behaviorsVersusFlappingURL :: String
foreign import injectingDependenciesURL :: String
foreign import compactingEventsURL :: String
foreign import emptyUntilFullURL :: String
foreign import runSSRURL :: String
foreign import aSimpleComponentURL :: String
foreign import addingSeveralElementsToPursxURL :: String
foreign import theLemmingEventURL :: String
foreign import useMailboxedURL :: String
foreign import addingAnAttributeToPursxURL :: String
foreign import componentsAsSemigroupsURL :: String
foreign import groupsOfGroupsURL :: String
foreign import theOneOfFunctionURL :: String
foreign import theGlobalPortalSyntaxURL :: String
foreign import customHook1URL :: String
foreign import gatingEventsOnBehaviorsURL :: String
foreign import effectsInSSRURL :: String
foreign import usingFunctionsAsMonadsURL :: String
foreign import theKeepLatestFunctionURL :: String
foreign import aSimpleCounterURL :: String
foreign import globalHandlersURL :: String
foreign import eventsAsRingsURL :: String
foreign import addingSeveralAttributesToPursxURL :: String
foreign import samplingABehaviorWithAnEventURL :: String
foreign import useRefURL :: String
foreign import knowThySelfTURL :: String
foreign import shorthandListenersURL :: String
foreign import aNoteOnMemoizationURL :: String
foreign import optimizedEventCreationURL :: String
foreign import theTemporalityOfPureURL :: String
foreign import addingCustomElementsURL :: String
foreign import optimizedEventFunctionsURL :: String
foreign import componentsAsMonoidsURL :: String
foreign import aLagUsingFixURL :: String
foreign import addingASingleElementToPursxURL :: String
foreign import plainOldHtmlURL :: String
foreign import usingAnEffectURL :: String
foreign import knowThySelfURL :: String
foreign import unsafePursxURL :: String
foreign import theLocalPortalSyntaxURL :: String
foreign import unsettingAttributesURL :: String
foreign import booleanLogicOnEventsURL :: String
foreign import howSamplingWorksURL :: String
foreign import unlockingLevelsURL :: String
foreign import useDynURL :: String
foreign import integratingBehaviorsURL :: String
foreign import helloWorldCodeURL :: String
foreign import insertingInADifferentOrderURL :: String
foreign import customHook2URL :: String
foreign import nestedCustomHooksURL :: String
foreign import multipleSubscriptionsURL :: String
foreign import theStateHookURL :: String
foreign import interComponentCommunicationURL :: String
foreign import eventsAsMonoidsURL :: String
foreign import foldEffectURL :: String
foreign import derivingBehaviorsURL :: String
foreign import solvingDifferentialEquationsURL :: String
foreign import usingTheHookInAnAttributeURL :: String
foreign import passingAroundHooksURL :: String
foreign import switchingOnBehaviorsURL :: String
foreign import groupingComponentsURL :: String
foreign import flippingTheFunctionAndArgumentURL :: String
foreign import movingElementsURL :: String
foreign import mockDiscordURL :: String
foreign import samplingABehaviorWithACustomFunctionURL :: String
foreign import memoizedApplicationURL :: String
foreign import memoizedNoEventURL :: String
foreign import whenToFixAndWhenToFoldURL :: String
foreign import usingAHookToControlPresenceURL :: String
foreign import removingElementsURL :: String
foreign import handRolledEventURL :: String
foreign import unsafeCustomElementURL :: String
foreign import severalLagsUsingFixURL :: String
foreign import eventsAsSemigroupsURL :: String
foreign import altAsAMuxerURL :: String
newtype Examples = Examples
  { unMemoizedApplication :: String
  , filteringAnEvent :: String
  , usingTheOriginalEvent :: String
  , eventsAsSemirings :: String
  , usingTheHookToSwitchBetweenElements :: String
  , rowPolymorphismAndProviders :: String
  , addingAttributes :: String
  , biasingASideOfSampling :: String
  , theCreatePureEffect :: String
  , samplingABehaviorAndDiscardingTheEvent :: String
  , behaviorsVersusFlapping :: String
  , injectingDependencies :: String
  , compactingEvents :: String
  , emptyUntilFull :: String
  , runSSR :: String
  , aSimpleComponent :: String
  , addingSeveralElementsToPursx :: String
  , theLemmingEvent :: String
  , useMailboxed :: String
  , addingAnAttributeToPursx :: String
  , componentsAsSemigroups :: String
  , groupsOfGroups :: String
  , theOneOfFunction :: String
  , theGlobalPortalSyntax :: String
  , customHook1 :: String
  , gatingEventsOnBehaviors :: String
  , effectsInSSR :: String
  , usingFunctionsAsMonads :: String
  , theKeepLatestFunction :: String
  , aSimpleCounter :: String
  , globalHandlers :: String
  , eventsAsRings :: String
  , addingSeveralAttributesToPursx :: String
  , samplingABehaviorWithAnEvent :: String
  , useRef :: String
  , knowThySelfT :: String
  , shorthandListeners :: String
  , aNoteOnMemoization :: String
  , optimizedEventCreation :: String
  , theTemporalityOfPure :: String
  , addingCustomElements :: String
  , optimizedEventFunctions :: String
  , componentsAsMonoids :: String
  , aLagUsingFix :: String
  , addingASingleElementToPursx :: String
  , plainOldHtml :: String
  , usingAnEffect :: String
  , knowThySelf :: String
  , unsafePursx :: String
  , theLocalPortalSyntax :: String
  , unsettingAttributes :: String
  , booleanLogicOnEvents :: String
  , howSamplingWorks :: String
  , unlockingLevels :: String
  , useDyn :: String
  , integratingBehaviors :: String
  , helloWorldCode :: String
  , insertingInADifferentOrder :: String
  , customHook2 :: String
  , nestedCustomHooks :: String
  , multipleSubscriptions :: String
  , theStateHook :: String
  , interComponentCommunication :: String
  , eventsAsMonoids :: String
  , foldEffect :: String
  , derivingBehaviors :: String
  , solvingDifferentialEquations :: String
  , usingTheHookInAnAttribute :: String
  , passingAroundHooks :: String
  , switchingOnBehaviors :: String
  , groupingComponents :: String
  , flippingTheFunctionAndArgument :: String
  , movingElements :: String
  , mockDiscord :: String
  , samplingABehaviorWithACustomFunction :: String
  , memoizedApplication :: String
  , memoizedNoEvent :: String
  , whenToFixAndWhenToFold :: String
  , usingAHookToControlPresence :: String
  , removingElements :: String
  , handRolledEvent :: String
  , unsafeCustomElement :: String
  , severalLagsUsingFix :: String
  , eventsAsSemigroups :: String
  , altAsAMuxer :: String
  }

derive instance Newtype Examples _

examples :: Examples
examples = Examples
  { unMemoizedApplication: unMemoizedApplicationURL
  , filteringAnEvent: filteringAnEventURL
  , usingTheOriginalEvent: usingTheOriginalEventURL
  , eventsAsSemirings: eventsAsSemiringsURL
  , usingTheHookToSwitchBetweenElements: usingTheHookToSwitchBetweenElementsURL
  , rowPolymorphismAndProviders: rowPolymorphismAndProvidersURL
  , addingAttributes: addingAttributesURL
  , biasingASideOfSampling: biasingASideOfSamplingURL
  , theCreatePureEffect: theCreatePureEffectURL
  , samplingABehaviorAndDiscardingTheEvent:
      samplingABehaviorAndDiscardingTheEventURL
  , behaviorsVersusFlapping: behaviorsVersusFlappingURL
  , injectingDependencies: injectingDependenciesURL
  , compactingEvents: compactingEventsURL
  , emptyUntilFull: emptyUntilFullURL
  , runSSR: runSSRURL
  , aSimpleComponent: aSimpleComponentURL
  , addingSeveralElementsToPursx: addingSeveralElementsToPursxURL
  , theLemmingEvent: theLemmingEventURL
  , useMailboxed: useMailboxedURL
  , addingAnAttributeToPursx: addingAnAttributeToPursxURL
  , componentsAsSemigroups: componentsAsSemigroupsURL
  , groupsOfGroups: groupsOfGroupsURL
  , theOneOfFunction: theOneOfFunctionURL
  , theGlobalPortalSyntax: theGlobalPortalSyntaxURL
  , customHook1: customHook1URL
  , gatingEventsOnBehaviors: gatingEventsOnBehaviorsURL
  , effectsInSSR: effectsInSSRURL
  , usingFunctionsAsMonads: usingFunctionsAsMonadsURL
  , theKeepLatestFunction: theKeepLatestFunctionURL
  , aSimpleCounter: aSimpleCounterURL
  , globalHandlers: globalHandlersURL
  , eventsAsRings: eventsAsRingsURL
  , addingSeveralAttributesToPursx: addingSeveralAttributesToPursxURL
  , samplingABehaviorWithAnEvent: samplingABehaviorWithAnEventURL
  , useRef: useRefURL
  , knowThySelfT: knowThySelfTURL
  , shorthandListeners: shorthandListenersURL
  , aNoteOnMemoization: aNoteOnMemoizationURL
  , optimizedEventCreation: optimizedEventCreationURL
  , theTemporalityOfPure: theTemporalityOfPureURL
  , addingCustomElements: addingCustomElementsURL
  , optimizedEventFunctions: optimizedEventFunctionsURL
  , componentsAsMonoids: componentsAsMonoidsURL
  , aLagUsingFix: aLagUsingFixURL
  , addingASingleElementToPursx: addingASingleElementToPursxURL
  , plainOldHtml: plainOldHtmlURL
  , usingAnEffect: usingAnEffectURL
  , knowThySelf: knowThySelfURL
  , unsafePursx: unsafePursxURL
  , theLocalPortalSyntax: theLocalPortalSyntaxURL
  , unsettingAttributes: unsettingAttributesURL
  , booleanLogicOnEvents: booleanLogicOnEventsURL
  , howSamplingWorks: howSamplingWorksURL
  , unlockingLevels: unlockingLevelsURL
  , useDyn: useDynURL
  , integratingBehaviors: integratingBehaviorsURL
  , helloWorldCode: helloWorldCodeURL
  , insertingInADifferentOrder: insertingInADifferentOrderURL
  , customHook2: customHook2URL
  , nestedCustomHooks: nestedCustomHooksURL
  , multipleSubscriptions: multipleSubscriptionsURL
  , theStateHook: theStateHookURL
  , interComponentCommunication: interComponentCommunicationURL
  , eventsAsMonoids: eventsAsMonoidsURL
  , foldEffect: foldEffectURL
  , derivingBehaviors: derivingBehaviorsURL
  , solvingDifferentialEquations: solvingDifferentialEquationsURL
  , usingTheHookInAnAttribute: usingTheHookInAnAttributeURL
  , passingAroundHooks: passingAroundHooksURL
  , switchingOnBehaviors: switchingOnBehaviorsURL
  , groupingComponents: groupingComponentsURL
  , flippingTheFunctionAndArgument: flippingTheFunctionAndArgumentURL
  , movingElements: movingElementsURL
  , mockDiscord: mockDiscordURL
  , samplingABehaviorWithACustomFunction:
      samplingABehaviorWithACustomFunctionURL
  , memoizedApplication: memoizedApplicationURL
  , memoizedNoEvent: memoizedNoEventURL
  , whenToFixAndWhenToFold: whenToFixAndWhenToFoldURL
  , usingAHookToControlPresence: usingAHookToControlPresenceURL
  , removingElements: removingElementsURL
  , handRolledEvent: handRolledEventURL
  , unsafeCustomElement: unsafeCustomElementURL
  , severalLagsUsingFix: severalLagsUsingFixURL
  , eventsAsSemigroups: eventsAsSemigroupsURL
  , altAsAMuxer: altAsAMuxerURL
  }

data ExampleADT
  = UnMemoizedApplication
  | FilteringAnEvent
  | UsingTheOriginalEvent
  | EventsAsSemirings
  | UsingTheHookToSwitchBetweenElements
  | RowPolymorphismAndProviders
  | AddingAttributes
  | BiasingASideOfSampling
  | TheCreatePureEffect
  | SamplingABehaviorAndDiscardingTheEvent
  | BehaviorsVersusFlapping
  | InjectingDependencies
  | CompactingEvents
  | EmptyUntilFull
  | RunSSR
  | ASimpleComponent
  | AddingSeveralElementsToPursx
  | TheLemmingEvent
  | UseMailboxed
  | AddingAnAttributeToPursx
  | ComponentsAsSemigroups
  | GroupsOfGroups
  | TheOneOfFunction
  | TheGlobalPortalSyntax
  | CustomHook1
  | GatingEventsOnBehaviors
  | EffectsInSSR
  | UsingFunctionsAsMonads
  | TheKeepLatestFunction
  | ASimpleCounter
  | GlobalHandlers
  | EventsAsRings
  | AddingSeveralAttributesToPursx
  | SamplingABehaviorWithAnEvent
  | UseRef
  | KnowThySelfT
  | ShorthandListeners
  | ANoteOnMemoization
  | OptimizedEventCreation
  | TheTemporalityOfPure
  | AddingCustomElements
  | OptimizedEventFunctions
  | ComponentsAsMonoids
  | ALagUsingFix
  | AddingASingleElementToPursx
  | PlainOldHtml
  | UsingAnEffect
  | KnowThySelf
  | UnsafePursx
  | TheLocalPortalSyntax
  | UnsettingAttributes
  | BooleanLogicOnEvents
  | HowSamplingWorks
  | UnlockingLevels
  | UseDyn
  | IntegratingBehaviors
  | HelloWorldCode
  | InsertingInADifferentOrder
  | CustomHook2
  | NestedCustomHooks
  | MultipleSubscriptions
  | TheStateHook
  | InterComponentCommunication
  | EventsAsMonoids
  | FoldEffect
  | DerivingBehaviors
  | SolvingDifferentialEquations
  | UsingTheHookInAnAttribute
  | PassingAroundHooks
  | SwitchingOnBehaviors
  | GroupingComponents
  | FlippingTheFunctionAndArgument
  | MovingElements
  | MockDiscord
  | SamplingABehaviorWithACustomFunction
  | MemoizedApplication
  | MemoizedNoEvent
  | WhenToFixAndWhenToFold
  | UsingAHookToControlPresence
  | RemovingElements
  | HandRolledEvent
  | UnsafeCustomElement
  | SeveralLagsUsingFix
  | EventsAsSemigroups
  | AltAsAMuxer

exampleToString :: ExampleADT -> String
exampleToString UnMemoizedApplication = (unwrap examples).unMemoizedApplication
exampleToString FilteringAnEvent = (unwrap examples).filteringAnEvent
exampleToString UsingTheOriginalEvent = (unwrap examples).usingTheOriginalEvent
exampleToString EventsAsSemirings = (unwrap examples).eventsAsSemirings
exampleToString UsingTheHookToSwitchBetweenElements =
  (unwrap examples).usingTheHookToSwitchBetweenElements
exampleToString RowPolymorphismAndProviders =
  (unwrap examples).rowPolymorphismAndProviders
exampleToString AddingAttributes = (unwrap examples).addingAttributes
exampleToString BiasingASideOfSampling =
  (unwrap examples).biasingASideOfSampling
exampleToString TheCreatePureEffect = (unwrap examples).theCreatePureEffect
exampleToString SamplingABehaviorAndDiscardingTheEvent =
  (unwrap examples).samplingABehaviorAndDiscardingTheEvent
exampleToString BehaviorsVersusFlapping =
  (unwrap examples).behaviorsVersusFlapping
exampleToString InjectingDependencies = (unwrap examples).injectingDependencies
exampleToString CompactingEvents = (unwrap examples).compactingEvents
exampleToString EmptyUntilFull = (unwrap examples).emptyUntilFull
exampleToString RunSSR = (unwrap examples).runSSR
exampleToString ASimpleComponent = (unwrap examples).aSimpleComponent
exampleToString AddingSeveralElementsToPursx =
  (unwrap examples).addingSeveralElementsToPursx
exampleToString TheLemmingEvent = (unwrap examples).theLemmingEvent
exampleToString UseMailboxed = (unwrap examples).useMailboxed
exampleToString AddingAnAttributeToPursx =
  (unwrap examples).addingAnAttributeToPursx
exampleToString ComponentsAsSemigroups =
  (unwrap examples).componentsAsSemigroups
exampleToString GroupsOfGroups = (unwrap examples).groupsOfGroups
exampleToString TheOneOfFunction = (unwrap examples).theOneOfFunction
exampleToString TheGlobalPortalSyntax = (unwrap examples).theGlobalPortalSyntax
exampleToString CustomHook1 = (unwrap examples).customHook1
exampleToString GatingEventsOnBehaviors =
  (unwrap examples).gatingEventsOnBehaviors
exampleToString EffectsInSSR = (unwrap examples).effectsInSSR
exampleToString UsingFunctionsAsMonads =
  (unwrap examples).usingFunctionsAsMonads
exampleToString TheKeepLatestFunction = (unwrap examples).theKeepLatestFunction
exampleToString ASimpleCounter = (unwrap examples).aSimpleCounter
exampleToString GlobalHandlers = (unwrap examples).globalHandlers
exampleToString EventsAsRings = (unwrap examples).eventsAsRings
exampleToString AddingSeveralAttributesToPursx =
  (unwrap examples).addingSeveralAttributesToPursx
exampleToString SamplingABehaviorWithAnEvent =
  (unwrap examples).samplingABehaviorWithAnEvent
exampleToString UseRef = (unwrap examples).useRef
exampleToString KnowThySelfT = (unwrap examples).knowThySelfT
exampleToString ShorthandListeners = (unwrap examples).shorthandListeners
exampleToString ANoteOnMemoization = (unwrap examples).aNoteOnMemoization
exampleToString OptimizedEventCreation =
  (unwrap examples).optimizedEventCreation
exampleToString TheTemporalityOfPure = (unwrap examples).theTemporalityOfPure
exampleToString AddingCustomElements = (unwrap examples).addingCustomElements
exampleToString OptimizedEventFunctions =
  (unwrap examples).optimizedEventFunctions
exampleToString ComponentsAsMonoids = (unwrap examples).componentsAsMonoids
exampleToString ALagUsingFix = (unwrap examples).aLagUsingFix
exampleToString AddingASingleElementToPursx =
  (unwrap examples).addingASingleElementToPursx
exampleToString PlainOldHtml = (unwrap examples).plainOldHtml
exampleToString UsingAnEffect = (unwrap examples).usingAnEffect
exampleToString KnowThySelf = (unwrap examples).knowThySelf
exampleToString UnsafePursx = (unwrap examples).unsafePursx
exampleToString TheLocalPortalSyntax = (unwrap examples).theLocalPortalSyntax
exampleToString UnsettingAttributes = (unwrap examples).unsettingAttributes
exampleToString BooleanLogicOnEvents = (unwrap examples).booleanLogicOnEvents
exampleToString HowSamplingWorks = (unwrap examples).howSamplingWorks
exampleToString UnlockingLevels = (unwrap examples).unlockingLevels
exampleToString UseDyn = (unwrap examples).useDyn
exampleToString IntegratingBehaviors = (unwrap examples).integratingBehaviors
exampleToString HelloWorldCode = (unwrap examples).helloWorldCode
exampleToString InsertingInADifferentOrder =
  (unwrap examples).insertingInADifferentOrder
exampleToString CustomHook2 = (unwrap examples).customHook2
exampleToString NestedCustomHooks = (unwrap examples).nestedCustomHooks
exampleToString MultipleSubscriptions = (unwrap examples).multipleSubscriptions
exampleToString TheStateHook = (unwrap examples).theStateHook
exampleToString InterComponentCommunication =
  (unwrap examples).interComponentCommunication
exampleToString EventsAsMonoids = (unwrap examples).eventsAsMonoids
exampleToString FoldEffect = (unwrap examples).foldEffect
exampleToString DerivingBehaviors = (unwrap examples).derivingBehaviors
exampleToString SolvingDifferentialEquations =
  (unwrap examples).solvingDifferentialEquations
exampleToString UsingTheHookInAnAttribute =
  (unwrap examples).usingTheHookInAnAttribute
exampleToString PassingAroundHooks = (unwrap examples).passingAroundHooks
exampleToString SwitchingOnBehaviors = (unwrap examples).switchingOnBehaviors
exampleToString GroupingComponents = (unwrap examples).groupingComponents
exampleToString FlippingTheFunctionAndArgument =
  (unwrap examples).flippingTheFunctionAndArgument
exampleToString MovingElements = (unwrap examples).movingElements
exampleToString MockDiscord = (unwrap examples).mockDiscord
exampleToString SamplingABehaviorWithACustomFunction =
  (unwrap examples).samplingABehaviorWithACustomFunction
exampleToString MemoizedApplication = (unwrap examples).memoizedApplication
exampleToString MemoizedNoEvent = (unwrap examples).memoizedNoEvent
exampleToString WhenToFixAndWhenToFold =
  (unwrap examples).whenToFixAndWhenToFold
exampleToString UsingAHookToControlPresence =
  (unwrap examples).usingAHookToControlPresence
exampleToString RemovingElements = (unwrap examples).removingElements
exampleToString HandRolledEvent = (unwrap examples).handRolledEvent
exampleToString UnsafeCustomElement = (unwrap examples).unsafeCustomElement
exampleToString SeveralLagsUsingFix = (unwrap examples).severalLagsUsingFix
exampleToString EventsAsSemigroups = (unwrap examples).eventsAsSemigroups
exampleToString AltAsAMuxer = (unwrap examples).altAsAMuxer

exampleToSlug :: ExampleADT -> String
exampleToSlug UnMemoizedApplication = "UnMemoizedApplication"
exampleToSlug FilteringAnEvent = "FilteringAnEvent"
exampleToSlug UsingTheOriginalEvent = "UsingTheOriginalEvent"
exampleToSlug EventsAsSemirings = "EventsAsSemirings"
exampleToSlug UsingTheHookToSwitchBetweenElements =
  "UsingTheHookToSwitchBetweenElements"
exampleToSlug RowPolymorphismAndProviders = "RowPolymorphismAndProviders"
exampleToSlug AddingAttributes = "AddingAttributes"
exampleToSlug BiasingASideOfSampling = "BiasingASideOfSampling"
exampleToSlug TheCreatePureEffect = "TheCreatePureEffect"
exampleToSlug SamplingABehaviorAndDiscardingTheEvent =
  "SamplingABehaviorAndDiscardingTheEvent"
exampleToSlug BehaviorsVersusFlapping = "BehaviorsVersusFlapping"
exampleToSlug InjectingDependencies = "InjectingDependencies"
exampleToSlug CompactingEvents = "CompactingEvents"
exampleToSlug EmptyUntilFull = "EmptyUntilFull"
exampleToSlug RunSSR = "RunSSR"
exampleToSlug ASimpleComponent = "ASimpleComponent"
exampleToSlug AddingSeveralElementsToPursx = "AddingSeveralElementsToPursx"
exampleToSlug TheLemmingEvent = "TheLemmingEvent"
exampleToSlug UseMailboxed = "UseMailboxed"
exampleToSlug AddingAnAttributeToPursx = "AddingAnAttributeToPursx"
exampleToSlug ComponentsAsSemigroups = "ComponentsAsSemigroups"
exampleToSlug GroupsOfGroups = "GroupsOfGroups"
exampleToSlug TheOneOfFunction = "TheOneOfFunction"
exampleToSlug TheGlobalPortalSyntax = "TheGlobalPortalSyntax"
exampleToSlug CustomHook1 = "CustomHook1"
exampleToSlug GatingEventsOnBehaviors = "GatingEventsOnBehaviors"
exampleToSlug EffectsInSSR = "EffectsInSSR"
exampleToSlug UsingFunctionsAsMonads = "UsingFunctionsAsMonads"
exampleToSlug TheKeepLatestFunction = "TheKeepLatestFunction"
exampleToSlug ASimpleCounter = "ASimpleCounter"
exampleToSlug GlobalHandlers = "GlobalHandlers"
exampleToSlug EventsAsRings = "EventsAsRings"
exampleToSlug AddingSeveralAttributesToPursx = "AddingSeveralAttributesToPursx"
exampleToSlug SamplingABehaviorWithAnEvent = "SamplingABehaviorWithAnEvent"
exampleToSlug UseRef = "UseRef"
exampleToSlug KnowThySelfT = "KnowThySelfT"
exampleToSlug ShorthandListeners = "ShorthandListeners"
exampleToSlug ANoteOnMemoization = "ANoteOnMemoization"
exampleToSlug OptimizedEventCreation = "OptimizedEventCreation"
exampleToSlug TheTemporalityOfPure = "TheTemporalityOfPure"
exampleToSlug AddingCustomElements = "AddingCustomElements"
exampleToSlug OptimizedEventFunctions = "OptimizedEventFunctions"
exampleToSlug ComponentsAsMonoids = "ComponentsAsMonoids"
exampleToSlug ALagUsingFix = "ALagUsingFix"
exampleToSlug AddingASingleElementToPursx = "AddingASingleElementToPursx"
exampleToSlug PlainOldHtml = "PlainOldHtml"
exampleToSlug UsingAnEffect = "UsingAnEffect"
exampleToSlug KnowThySelf = "KnowThySelf"
exampleToSlug UnsafePursx = "UnsafePursx"
exampleToSlug TheLocalPortalSyntax = "TheLocalPortalSyntax"
exampleToSlug UnsettingAttributes = "UnsettingAttributes"
exampleToSlug BooleanLogicOnEvents = "BooleanLogicOnEvents"
exampleToSlug HowSamplingWorks = "HowSamplingWorks"
exampleToSlug UnlockingLevels = "UnlockingLevels"
exampleToSlug UseDyn = "UseDyn"
exampleToSlug IntegratingBehaviors = "IntegratingBehaviors"
exampleToSlug HelloWorldCode = "HelloWorldCode"
exampleToSlug InsertingInADifferentOrder = "InsertingInADifferentOrder"
exampleToSlug CustomHook2 = "CustomHook2"
exampleToSlug NestedCustomHooks = "NestedCustomHooks"
exampleToSlug MultipleSubscriptions = "MultipleSubscriptions"
exampleToSlug TheStateHook = "TheStateHook"
exampleToSlug InterComponentCommunication = "InterComponentCommunication"
exampleToSlug EventsAsMonoids = "EventsAsMonoids"
exampleToSlug FoldEffect = "FoldEffect"
exampleToSlug DerivingBehaviors = "DerivingBehaviors"
exampleToSlug SolvingDifferentialEquations = "SolvingDifferentialEquations"
exampleToSlug UsingTheHookInAnAttribute = "UsingTheHookInAnAttribute"
exampleToSlug PassingAroundHooks = "PassingAroundHooks"
exampleToSlug SwitchingOnBehaviors = "SwitchingOnBehaviors"
exampleToSlug GroupingComponents = "GroupingComponents"
exampleToSlug FlippingTheFunctionAndArgument = "FlippingTheFunctionAndArgument"
exampleToSlug MovingElements = "MovingElements"
exampleToSlug MockDiscord = "MockDiscord"
exampleToSlug SamplingABehaviorWithACustomFunction =
  "SamplingABehaviorWithACustomFunction"
exampleToSlug MemoizedApplication = "MemoizedApplication"
exampleToSlug MemoizedNoEvent = "MemoizedNoEvent"
exampleToSlug WhenToFixAndWhenToFold = "WhenToFixAndWhenToFold"
exampleToSlug UsingAHookToControlPresence = "UsingAHookToControlPresence"
exampleToSlug RemovingElements = "RemovingElements"
exampleToSlug HandRolledEvent = "HandRolledEvent"
exampleToSlug UnsafeCustomElement = "UnsafeCustomElement"
exampleToSlug SeveralLagsUsingFix = "SeveralLagsUsingFix"
exampleToSlug EventsAsSemigroups = "EventsAsSemigroups"
exampleToSlug AltAsAMuxer = "AltAsAMuxer"
