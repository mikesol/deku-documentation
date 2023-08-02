module Examples (Examples(..), ExampleADT(..), examples, exampleToString, exampleToSlug, exampleToApp) where

import Data.Newtype (class Newtype, unwrap)
import ExampleAssitant (ExampleSignature)
import Examples.UnMemoizedApplication as UnMemoizedApplication
import Examples.FilteringAnEvent as FilteringAnEvent
import Examples.UsingTheOriginalEvent as UsingTheOriginalEvent
import Examples.UsingTheHookToSwitchBetweenElements as UsingTheHookToSwitchBetweenElements
import Examples.RowPolymorphismAndProviders as RowPolymorphismAndProviders
import Examples.AddingAttributes as AddingAttributes
import Examples.BiasingASideOfSampling as BiasingASideOfSampling
import Examples.SamplingABehaviorAndDiscardingTheEvent as SamplingABehaviorAndDiscardingTheEvent
import Examples.BehaviorsVersusFlapping as BehaviorsVersusFlapping
import Examples.InjectingDependencies as InjectingDependencies
import Examples.CompactingEvents as CompactingEvents
import Examples.EmptyUntilFull as EmptyUntilFull
import Examples.RunSSR as RunSSR
import Examples.ASimpleComponent as ASimpleComponent
import Examples.AddingSeveralElementsToPursx as AddingSeveralElementsToPursx
import Examples.UseMailboxed as UseMailboxed
import Examples.AddingAnAttributeToPursx as AddingAnAttributeToPursx
import Examples.ComponentsAsSemigroups as ComponentsAsSemigroups
import Examples.GroupsOfGroups as GroupsOfGroups
import Examples.TheOneOfFunction as TheOneOfFunction
import Examples.TheGlobalPortalSyntax as TheGlobalPortalSyntax
import Examples.CustomHook1 as CustomHook1
import Examples.GatingEventsOnBehaviors as GatingEventsOnBehaviors
import Examples.EffectsInSSR as EffectsInSSR
import Examples.UsingFunctionsAsMonads as UsingFunctionsAsMonads
import Examples.TheKeepLatestFunction as TheKeepLatestFunction
import Examples.ASimpleCounter as ASimpleCounter
import Examples.GlobalHandlers as GlobalHandlers
import Examples.AddingSeveralAttributesToPursx as AddingSeveralAttributesToPursx
import Examples.SamplingABehaviorWithAnEvent as SamplingABehaviorWithAnEvent
import Examples.UseRef as UseRef
import Examples.RunningAffsWithCancellationInResponseToAnEvent as RunningAffsWithCancellationInResponseToAnEvent
import Examples.KnowThySelfT as KnowThySelfT
import Examples.ShorthandListeners as ShorthandListeners
import Examples.ANoteOnMemoization as ANoteOnMemoization
import Examples.AddingCustomElements as AddingCustomElements
import Examples.ComponentsAsMonoids as ComponentsAsMonoids
import Examples.ALagUsingFix as ALagUsingFix
import Examples.AddingASingleElementToPursx as AddingASingleElementToPursx
import Examples.PlainOldHtml as PlainOldHtml
import Examples.UsingAnEffect as UsingAnEffect
import Examples.KnowThySelf as KnowThySelf
import Examples.UnsafePursx as UnsafePursx
import Examples.RunningAffsSequentiallyInResponseToAnEvent as RunningAffsSequentiallyInResponseToAnEvent
import Examples.TheLocalPortalSyntax as TheLocalPortalSyntax
import Examples.UnsettingAttributes as UnsettingAttributes
import Examples.HowSamplingWorks as HowSamplingWorks
import Examples.UnlockingLevels as UnlockingLevels
import Examples.UseDyn as UseDyn
import Examples.RunningEffectsInResponseToEvents as RunningEffectsInResponseToEvents
import Examples.IntegratingBehaviors as IntegratingBehaviors
import Examples.HelloWorldCode as HelloWorldCode
import Examples.InsertingInADifferentOrder as InsertingInADifferentOrder
import Examples.CustomHook2 as CustomHook2
import Examples.NestedCustomHooks as NestedCustomHooks
import Examples.MultipleSubscriptions as MultipleSubscriptions
import Examples.TheStateHook as TheStateHook
import Examples.InterComponentCommunication as InterComponentCommunication
import Examples.DerivingBehaviors as DerivingBehaviors
import Examples.SolvingDifferentialEquations as SolvingDifferentialEquations
import Examples.UsingTheHookInAnAttribute as UsingTheHookInAnAttribute
import Examples.PassingAroundHooks as PassingAroundHooks
import Examples.SwitchingOnBehaviors as SwitchingOnBehaviors
import Examples.GroupingComponents as GroupingComponents
import Examples.FlippingTheFunctionAndArgument as FlippingTheFunctionAndArgument
import Examples.MovingElements as MovingElements
import Examples.MockDiscord as MockDiscord
import Examples.RunningAffsInResponseToAnEvent as RunningAffsInResponseToAnEvent
import Examples.SamplingABehaviorWithACustomFunction as SamplingABehaviorWithACustomFunction
import Examples.MemoizedApplication as MemoizedApplication
import Examples.MemoizedNoEvent as MemoizedNoEvent
import Examples.WhenToFixAndWhenToFold as WhenToFixAndWhenToFold
import Examples.UsingAHookToControlPresence as UsingAHookToControlPresence
import Examples.PurityOutOfThinAir as PurityOutOfThinAir
import Examples.RemovingElements as RemovingElements
import Examples.HandRolledEvent as HandRolledEvent
import Examples.UnsafeCustomElement as UnsafeCustomElement
import Examples.SeveralLagsUsingFix as SeveralLagsUsingFix
import Examples.EventsAsSemigroups as EventsAsSemigroups
import Examples.AltAsAMuxer as AltAsAMuxer
foreign import unMemoizedApplicationURL :: String
foreign import filteringAnEventURL :: String
foreign import usingTheOriginalEventURL :: String
foreign import usingTheHookToSwitchBetweenElementsURL :: String
foreign import rowPolymorphismAndProvidersURL :: String
foreign import addingAttributesURL :: String
foreign import biasingASideOfSamplingURL :: String
foreign import samplingABehaviorAndDiscardingTheEventURL :: String
foreign import behaviorsVersusFlappingURL :: String
foreign import injectingDependenciesURL :: String
foreign import compactingEventsURL :: String
foreign import emptyUntilFullURL :: String
foreign import runSSRURL :: String
foreign import aSimpleComponentURL :: String
foreign import addingSeveralElementsToPursxURL :: String
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
foreign import addingSeveralAttributesToPursxURL :: String
foreign import samplingABehaviorWithAnEventURL :: String
foreign import useRefURL :: String
foreign import runningAffsWithCancellationInResponseToAnEventURL :: String
foreign import knowThySelfTURL :: String
foreign import shorthandListenersURL :: String
foreign import aNoteOnMemoizationURL :: String
foreign import addingCustomElementsURL :: String
foreign import componentsAsMonoidsURL :: String
foreign import aLagUsingFixURL :: String
foreign import addingASingleElementToPursxURL :: String
foreign import plainOldHtmlURL :: String
foreign import usingAnEffectURL :: String
foreign import knowThySelfURL :: String
foreign import unsafePursxURL :: String
foreign import runningAffsSequentiallyInResponseToAnEventURL :: String
foreign import theLocalPortalSyntaxURL :: String
foreign import unsettingAttributesURL :: String
foreign import howSamplingWorksURL :: String
foreign import unlockingLevelsURL :: String
foreign import useDynURL :: String
foreign import runningEffectsInResponseToEventsURL :: String
foreign import integratingBehaviorsURL :: String
foreign import helloWorldCodeURL :: String
foreign import insertingInADifferentOrderURL :: String
foreign import customHook2URL :: String
foreign import nestedCustomHooksURL :: String
foreign import multipleSubscriptionsURL :: String
foreign import theStateHookURL :: String
foreign import interComponentCommunicationURL :: String
foreign import derivingBehaviorsURL :: String
foreign import solvingDifferentialEquationsURL :: String
foreign import usingTheHookInAnAttributeURL :: String
foreign import passingAroundHooksURL :: String
foreign import switchingOnBehaviorsURL :: String
foreign import groupingComponentsURL :: String
foreign import flippingTheFunctionAndArgumentURL :: String
foreign import movingElementsURL :: String
foreign import mockDiscordURL :: String
foreign import runningAffsInResponseToAnEventURL :: String
foreign import samplingABehaviorWithACustomFunctionURL :: String
foreign import memoizedApplicationURL :: String
foreign import memoizedNoEventURL :: String
foreign import whenToFixAndWhenToFoldURL :: String
foreign import usingAHookToControlPresenceURL :: String
foreign import purityOutOfThinAirURL :: String
foreign import removingElementsURL :: String
foreign import handRolledEventURL :: String
foreign import unsafeCustomElementURL :: String
foreign import severalLagsUsingFixURL :: String
foreign import eventsAsSemigroupsURL :: String
foreign import altAsAMuxerURL :: String
newtype Examples = Examples {
 unMemoizedApplication :: String,
 filteringAnEvent :: String,
 usingTheOriginalEvent :: String,
 usingTheHookToSwitchBetweenElements :: String,
 rowPolymorphismAndProviders :: String,
 addingAttributes :: String,
 biasingASideOfSampling :: String,
 samplingABehaviorAndDiscardingTheEvent :: String,
 behaviorsVersusFlapping :: String,
 injectingDependencies :: String,
 compactingEvents :: String,
 emptyUntilFull :: String,
 runSSR :: String,
 aSimpleComponent :: String,
 addingSeveralElementsToPursx :: String,
 useMailboxed :: String,
 addingAnAttributeToPursx :: String,
 componentsAsSemigroups :: String,
 groupsOfGroups :: String,
 theOneOfFunction :: String,
 theGlobalPortalSyntax :: String,
 customHook1 :: String,
 gatingEventsOnBehaviors :: String,
 effectsInSSR :: String,
 usingFunctionsAsMonads :: String,
 theKeepLatestFunction :: String,
 aSimpleCounter :: String,
 globalHandlers :: String,
 addingSeveralAttributesToPursx :: String,
 samplingABehaviorWithAnEvent :: String,
 useRef :: String,
 runningAffsWithCancellationInResponseToAnEvent :: String,
 knowThySelfT :: String,
 shorthandListeners :: String,
 aNoteOnMemoization :: String,
 addingCustomElements :: String,
 componentsAsMonoids :: String,
 aLagUsingFix :: String,
 addingASingleElementToPursx :: String,
 plainOldHtml :: String,
 usingAnEffect :: String,
 knowThySelf :: String,
 unsafePursx :: String,
 runningAffsSequentiallyInResponseToAnEvent :: String,
 theLocalPortalSyntax :: String,
 unsettingAttributes :: String,
 howSamplingWorks :: String,
 unlockingLevels :: String,
 useDyn :: String,
 runningEffectsInResponseToEvents :: String,
 integratingBehaviors :: String,
 helloWorldCode :: String,
 insertingInADifferentOrder :: String,
 customHook2 :: String,
 nestedCustomHooks :: String,
 multipleSubscriptions :: String,
 theStateHook :: String,
 interComponentCommunication :: String,
 derivingBehaviors :: String,
 solvingDifferentialEquations :: String,
 usingTheHookInAnAttribute :: String,
 passingAroundHooks :: String,
 switchingOnBehaviors :: String,
 groupingComponents :: String,
 flippingTheFunctionAndArgument :: String,
 movingElements :: String,
 mockDiscord :: String,
 runningAffsInResponseToAnEvent :: String,
 samplingABehaviorWithACustomFunction :: String,
 memoizedApplication :: String,
 memoizedNoEvent :: String,
 whenToFixAndWhenToFold :: String,
 usingAHookToControlPresence :: String,
 purityOutOfThinAir :: String,
 removingElements :: String,
 handRolledEvent :: String,
 unsafeCustomElement :: String,
 severalLagsUsingFix :: String,
 eventsAsSemigroups :: String,
 altAsAMuxer :: String
}
derive instance Newtype Examples _
examples :: Examples
examples = Examples {
 unMemoizedApplication: unMemoizedApplicationURL,
 filteringAnEvent: filteringAnEventURL,
 usingTheOriginalEvent: usingTheOriginalEventURL,
 usingTheHookToSwitchBetweenElements: usingTheHookToSwitchBetweenElementsURL,
 rowPolymorphismAndProviders: rowPolymorphismAndProvidersURL,
 addingAttributes: addingAttributesURL,
 biasingASideOfSampling: biasingASideOfSamplingURL,
 samplingABehaviorAndDiscardingTheEvent: samplingABehaviorAndDiscardingTheEventURL,
 behaviorsVersusFlapping: behaviorsVersusFlappingURL,
 injectingDependencies: injectingDependenciesURL,
 compactingEvents: compactingEventsURL,
 emptyUntilFull: emptyUntilFullURL,
 runSSR: runSSRURL,
 aSimpleComponent: aSimpleComponentURL,
 addingSeveralElementsToPursx: addingSeveralElementsToPursxURL,
 useMailboxed: useMailboxedURL,
 addingAnAttributeToPursx: addingAnAttributeToPursxURL,
 componentsAsSemigroups: componentsAsSemigroupsURL,
 groupsOfGroups: groupsOfGroupsURL,
 theOneOfFunction: theOneOfFunctionURL,
 theGlobalPortalSyntax: theGlobalPortalSyntaxURL,
 customHook1: customHook1URL,
 gatingEventsOnBehaviors: gatingEventsOnBehaviorsURL,
 effectsInSSR: effectsInSSRURL,
 usingFunctionsAsMonads: usingFunctionsAsMonadsURL,
 theKeepLatestFunction: theKeepLatestFunctionURL,
 aSimpleCounter: aSimpleCounterURL,
 globalHandlers: globalHandlersURL,
 addingSeveralAttributesToPursx: addingSeveralAttributesToPursxURL,
 samplingABehaviorWithAnEvent: samplingABehaviorWithAnEventURL,
 useRef: useRefURL,
 runningAffsWithCancellationInResponseToAnEvent: runningAffsWithCancellationInResponseToAnEventURL,
 knowThySelfT: knowThySelfTURL,
 shorthandListeners: shorthandListenersURL,
 aNoteOnMemoization: aNoteOnMemoizationURL,
 addingCustomElements: addingCustomElementsURL,
 componentsAsMonoids: componentsAsMonoidsURL,
 aLagUsingFix: aLagUsingFixURL,
 addingASingleElementToPursx: addingASingleElementToPursxURL,
 plainOldHtml: plainOldHtmlURL,
 usingAnEffect: usingAnEffectURL,
 knowThySelf: knowThySelfURL,
 unsafePursx: unsafePursxURL,
 runningAffsSequentiallyInResponseToAnEvent: runningAffsSequentiallyInResponseToAnEventURL,
 theLocalPortalSyntax: theLocalPortalSyntaxURL,
 unsettingAttributes: unsettingAttributesURL,
 howSamplingWorks: howSamplingWorksURL,
 unlockingLevels: unlockingLevelsURL,
 useDyn: useDynURL,
 runningEffectsInResponseToEvents: runningEffectsInResponseToEventsURL,
 integratingBehaviors: integratingBehaviorsURL,
 helloWorldCode: helloWorldCodeURL,
 insertingInADifferentOrder: insertingInADifferentOrderURL,
 customHook2: customHook2URL,
 nestedCustomHooks: nestedCustomHooksURL,
 multipleSubscriptions: multipleSubscriptionsURL,
 theStateHook: theStateHookURL,
 interComponentCommunication: interComponentCommunicationURL,
 derivingBehaviors: derivingBehaviorsURL,
 solvingDifferentialEquations: solvingDifferentialEquationsURL,
 usingTheHookInAnAttribute: usingTheHookInAnAttributeURL,
 passingAroundHooks: passingAroundHooksURL,
 switchingOnBehaviors: switchingOnBehaviorsURL,
 groupingComponents: groupingComponentsURL,
 flippingTheFunctionAndArgument: flippingTheFunctionAndArgumentURL,
 movingElements: movingElementsURL,
 mockDiscord: mockDiscordURL,
 runningAffsInResponseToAnEvent: runningAffsInResponseToAnEventURL,
 samplingABehaviorWithACustomFunction: samplingABehaviorWithACustomFunctionURL,
 memoizedApplication: memoizedApplicationURL,
 memoizedNoEvent: memoizedNoEventURL,
 whenToFixAndWhenToFold: whenToFixAndWhenToFoldURL,
 usingAHookToControlPresence: usingAHookToControlPresenceURL,
 purityOutOfThinAir: purityOutOfThinAirURL,
 removingElements: removingElementsURL,
 handRolledEvent: handRolledEventURL,
 unsafeCustomElement: unsafeCustomElementURL,
 severalLagsUsingFix: severalLagsUsingFixURL,
 eventsAsSemigroups: eventsAsSemigroupsURL,
 altAsAMuxer: altAsAMuxerURL
 }
data ExampleADT = UnMemoizedApplication | FilteringAnEvent | UsingTheOriginalEvent | UsingTheHookToSwitchBetweenElements | RowPolymorphismAndProviders | AddingAttributes | BiasingASideOfSampling | SamplingABehaviorAndDiscardingTheEvent | BehaviorsVersusFlapping | InjectingDependencies | CompactingEvents | EmptyUntilFull | RunSSR | ASimpleComponent | AddingSeveralElementsToPursx | UseMailboxed | AddingAnAttributeToPursx | ComponentsAsSemigroups | GroupsOfGroups | TheOneOfFunction | TheGlobalPortalSyntax | CustomHook1 | GatingEventsOnBehaviors | EffectsInSSR | UsingFunctionsAsMonads | TheKeepLatestFunction | ASimpleCounter | GlobalHandlers | AddingSeveralAttributesToPursx | SamplingABehaviorWithAnEvent | UseRef | RunningAffsWithCancellationInResponseToAnEvent | KnowThySelfT | ShorthandListeners | ANoteOnMemoization | AddingCustomElements | ComponentsAsMonoids | ALagUsingFix | AddingASingleElementToPursx | PlainOldHtml | UsingAnEffect | KnowThySelf | UnsafePursx | RunningAffsSequentiallyInResponseToAnEvent | TheLocalPortalSyntax | UnsettingAttributes | HowSamplingWorks | UnlockingLevels | UseDyn | RunningEffectsInResponseToEvents | IntegratingBehaviors | HelloWorldCode | InsertingInADifferentOrder | CustomHook2 | NestedCustomHooks | MultipleSubscriptions | TheStateHook | InterComponentCommunication | DerivingBehaviors | SolvingDifferentialEquations | UsingTheHookInAnAttribute | PassingAroundHooks | SwitchingOnBehaviors | GroupingComponents | FlippingTheFunctionAndArgument | MovingElements | MockDiscord | RunningAffsInResponseToAnEvent | SamplingABehaviorWithACustomFunction | MemoizedApplication | MemoizedNoEvent | WhenToFixAndWhenToFold | UsingAHookToControlPresence | PurityOutOfThinAir | RemovingElements | HandRolledEvent | UnsafeCustomElement | SeveralLagsUsingFix | EventsAsSemigroups | AltAsAMuxer 
exampleToString :: ExampleADT -> String
exampleToString UnMemoizedApplication = (unwrap examples).unMemoizedApplication
exampleToString FilteringAnEvent = (unwrap examples).filteringAnEvent
exampleToString UsingTheOriginalEvent = (unwrap examples).usingTheOriginalEvent
exampleToString UsingTheHookToSwitchBetweenElements = (unwrap examples).usingTheHookToSwitchBetweenElements
exampleToString RowPolymorphismAndProviders = (unwrap examples).rowPolymorphismAndProviders
exampleToString AddingAttributes = (unwrap examples).addingAttributes
exampleToString BiasingASideOfSampling = (unwrap examples).biasingASideOfSampling
exampleToString SamplingABehaviorAndDiscardingTheEvent = (unwrap examples).samplingABehaviorAndDiscardingTheEvent
exampleToString BehaviorsVersusFlapping = (unwrap examples).behaviorsVersusFlapping
exampleToString InjectingDependencies = (unwrap examples).injectingDependencies
exampleToString CompactingEvents = (unwrap examples).compactingEvents
exampleToString EmptyUntilFull = (unwrap examples).emptyUntilFull
exampleToString RunSSR = (unwrap examples).runSSR
exampleToString ASimpleComponent = (unwrap examples).aSimpleComponent
exampleToString AddingSeveralElementsToPursx = (unwrap examples).addingSeveralElementsToPursx
exampleToString UseMailboxed = (unwrap examples).useMailboxed
exampleToString AddingAnAttributeToPursx = (unwrap examples).addingAnAttributeToPursx
exampleToString ComponentsAsSemigroups = (unwrap examples).componentsAsSemigroups
exampleToString GroupsOfGroups = (unwrap examples).groupsOfGroups
exampleToString TheOneOfFunction = (unwrap examples).theOneOfFunction
exampleToString TheGlobalPortalSyntax = (unwrap examples).theGlobalPortalSyntax
exampleToString CustomHook1 = (unwrap examples).customHook1
exampleToString GatingEventsOnBehaviors = (unwrap examples).gatingEventsOnBehaviors
exampleToString EffectsInSSR = (unwrap examples).effectsInSSR
exampleToString UsingFunctionsAsMonads = (unwrap examples).usingFunctionsAsMonads
exampleToString TheKeepLatestFunction = (unwrap examples).theKeepLatestFunction
exampleToString ASimpleCounter = (unwrap examples).aSimpleCounter
exampleToString GlobalHandlers = (unwrap examples).globalHandlers
exampleToString AddingSeveralAttributesToPursx = (unwrap examples).addingSeveralAttributesToPursx
exampleToString SamplingABehaviorWithAnEvent = (unwrap examples).samplingABehaviorWithAnEvent
exampleToString UseRef = (unwrap examples).useRef
exampleToString RunningAffsWithCancellationInResponseToAnEvent = (unwrap examples).runningAffsWithCancellationInResponseToAnEvent
exampleToString KnowThySelfT = (unwrap examples).knowThySelfT
exampleToString ShorthandListeners = (unwrap examples).shorthandListeners
exampleToString ANoteOnMemoization = (unwrap examples).aNoteOnMemoization
exampleToString AddingCustomElements = (unwrap examples).addingCustomElements
exampleToString ComponentsAsMonoids = (unwrap examples).componentsAsMonoids
exampleToString ALagUsingFix = (unwrap examples).aLagUsingFix
exampleToString AddingASingleElementToPursx = (unwrap examples).addingASingleElementToPursx
exampleToString PlainOldHtml = (unwrap examples).plainOldHtml
exampleToString UsingAnEffect = (unwrap examples).usingAnEffect
exampleToString KnowThySelf = (unwrap examples).knowThySelf
exampleToString UnsafePursx = (unwrap examples).unsafePursx
exampleToString RunningAffsSequentiallyInResponseToAnEvent = (unwrap examples).runningAffsSequentiallyInResponseToAnEvent
exampleToString TheLocalPortalSyntax = (unwrap examples).theLocalPortalSyntax
exampleToString UnsettingAttributes = (unwrap examples).unsettingAttributes
exampleToString HowSamplingWorks = (unwrap examples).howSamplingWorks
exampleToString UnlockingLevels = (unwrap examples).unlockingLevels
exampleToString UseDyn = (unwrap examples).useDyn
exampleToString RunningEffectsInResponseToEvents = (unwrap examples).runningEffectsInResponseToEvents
exampleToString IntegratingBehaviors = (unwrap examples).integratingBehaviors
exampleToString HelloWorldCode = (unwrap examples).helloWorldCode
exampleToString InsertingInADifferentOrder = (unwrap examples).insertingInADifferentOrder
exampleToString CustomHook2 = (unwrap examples).customHook2
exampleToString NestedCustomHooks = (unwrap examples).nestedCustomHooks
exampleToString MultipleSubscriptions = (unwrap examples).multipleSubscriptions
exampleToString TheStateHook = (unwrap examples).theStateHook
exampleToString InterComponentCommunication = (unwrap examples).interComponentCommunication
exampleToString DerivingBehaviors = (unwrap examples).derivingBehaviors
exampleToString SolvingDifferentialEquations = (unwrap examples).solvingDifferentialEquations
exampleToString UsingTheHookInAnAttribute = (unwrap examples).usingTheHookInAnAttribute
exampleToString PassingAroundHooks = (unwrap examples).passingAroundHooks
exampleToString SwitchingOnBehaviors = (unwrap examples).switchingOnBehaviors
exampleToString GroupingComponents = (unwrap examples).groupingComponents
exampleToString FlippingTheFunctionAndArgument = (unwrap examples).flippingTheFunctionAndArgument
exampleToString MovingElements = (unwrap examples).movingElements
exampleToString MockDiscord = (unwrap examples).mockDiscord
exampleToString RunningAffsInResponseToAnEvent = (unwrap examples).runningAffsInResponseToAnEvent
exampleToString SamplingABehaviorWithACustomFunction = (unwrap examples).samplingABehaviorWithACustomFunction
exampleToString MemoizedApplication = (unwrap examples).memoizedApplication
exampleToString MemoizedNoEvent = (unwrap examples).memoizedNoEvent
exampleToString WhenToFixAndWhenToFold = (unwrap examples).whenToFixAndWhenToFold
exampleToString UsingAHookToControlPresence = (unwrap examples).usingAHookToControlPresence
exampleToString PurityOutOfThinAir = (unwrap examples).purityOutOfThinAir
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
exampleToSlug UsingTheHookToSwitchBetweenElements = "UsingTheHookToSwitchBetweenElements"
exampleToSlug RowPolymorphismAndProviders = "RowPolymorphismAndProviders"
exampleToSlug AddingAttributes = "AddingAttributes"
exampleToSlug BiasingASideOfSampling = "BiasingASideOfSampling"
exampleToSlug SamplingABehaviorAndDiscardingTheEvent = "SamplingABehaviorAndDiscardingTheEvent"
exampleToSlug BehaviorsVersusFlapping = "BehaviorsVersusFlapping"
exampleToSlug InjectingDependencies = "InjectingDependencies"
exampleToSlug CompactingEvents = "CompactingEvents"
exampleToSlug EmptyUntilFull = "EmptyUntilFull"
exampleToSlug RunSSR = "RunSSR"
exampleToSlug ASimpleComponent = "ASimpleComponent"
exampleToSlug AddingSeveralElementsToPursx = "AddingSeveralElementsToPursx"
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
exampleToSlug AddingSeveralAttributesToPursx = "AddingSeveralAttributesToPursx"
exampleToSlug SamplingABehaviorWithAnEvent = "SamplingABehaviorWithAnEvent"
exampleToSlug UseRef = "UseRef"
exampleToSlug RunningAffsWithCancellationInResponseToAnEvent = "RunningAffsWithCancellationInResponseToAnEvent"
exampleToSlug KnowThySelfT = "KnowThySelfT"
exampleToSlug ShorthandListeners = "ShorthandListeners"
exampleToSlug ANoteOnMemoization = "ANoteOnMemoization"
exampleToSlug AddingCustomElements = "AddingCustomElements"
exampleToSlug ComponentsAsMonoids = "ComponentsAsMonoids"
exampleToSlug ALagUsingFix = "ALagUsingFix"
exampleToSlug AddingASingleElementToPursx = "AddingASingleElementToPursx"
exampleToSlug PlainOldHtml = "PlainOldHtml"
exampleToSlug UsingAnEffect = "UsingAnEffect"
exampleToSlug KnowThySelf = "KnowThySelf"
exampleToSlug UnsafePursx = "UnsafePursx"
exampleToSlug RunningAffsSequentiallyInResponseToAnEvent = "RunningAffsSequentiallyInResponseToAnEvent"
exampleToSlug TheLocalPortalSyntax = "TheLocalPortalSyntax"
exampleToSlug UnsettingAttributes = "UnsettingAttributes"
exampleToSlug HowSamplingWorks = "HowSamplingWorks"
exampleToSlug UnlockingLevels = "UnlockingLevels"
exampleToSlug UseDyn = "UseDyn"
exampleToSlug RunningEffectsInResponseToEvents = "RunningEffectsInResponseToEvents"
exampleToSlug IntegratingBehaviors = "IntegratingBehaviors"
exampleToSlug HelloWorldCode = "HelloWorldCode"
exampleToSlug InsertingInADifferentOrder = "InsertingInADifferentOrder"
exampleToSlug CustomHook2 = "CustomHook2"
exampleToSlug NestedCustomHooks = "NestedCustomHooks"
exampleToSlug MultipleSubscriptions = "MultipleSubscriptions"
exampleToSlug TheStateHook = "TheStateHook"
exampleToSlug InterComponentCommunication = "InterComponentCommunication"
exampleToSlug DerivingBehaviors = "DerivingBehaviors"
exampleToSlug SolvingDifferentialEquations = "SolvingDifferentialEquations"
exampleToSlug UsingTheHookInAnAttribute = "UsingTheHookInAnAttribute"
exampleToSlug PassingAroundHooks = "PassingAroundHooks"
exampleToSlug SwitchingOnBehaviors = "SwitchingOnBehaviors"
exampleToSlug GroupingComponents = "GroupingComponents"
exampleToSlug FlippingTheFunctionAndArgument = "FlippingTheFunctionAndArgument"
exampleToSlug MovingElements = "MovingElements"
exampleToSlug MockDiscord = "MockDiscord"
exampleToSlug RunningAffsInResponseToAnEvent = "RunningAffsInResponseToAnEvent"
exampleToSlug SamplingABehaviorWithACustomFunction = "SamplingABehaviorWithACustomFunction"
exampleToSlug MemoizedApplication = "MemoizedApplication"
exampleToSlug MemoizedNoEvent = "MemoizedNoEvent"
exampleToSlug WhenToFixAndWhenToFold = "WhenToFixAndWhenToFold"
exampleToSlug UsingAHookToControlPresence = "UsingAHookToControlPresence"
exampleToSlug PurityOutOfThinAir = "PurityOutOfThinAir"
exampleToSlug RemovingElements = "RemovingElements"
exampleToSlug HandRolledEvent = "HandRolledEvent"
exampleToSlug UnsafeCustomElement = "UnsafeCustomElement"
exampleToSlug SeveralLagsUsingFix = "SeveralLagsUsingFix"
exampleToSlug EventsAsSemigroups = "EventsAsSemigroups"
exampleToSlug AltAsAMuxer = "AltAsAMuxer"
exampleToApp :: ExampleADT -> ExampleSignature
exampleToApp UnMemoizedApplication = UnMemoizedApplication.app
exampleToApp FilteringAnEvent = FilteringAnEvent.app
exampleToApp UsingTheOriginalEvent = UsingTheOriginalEvent.app
exampleToApp UsingTheHookToSwitchBetweenElements = UsingTheHookToSwitchBetweenElements.app
exampleToApp RowPolymorphismAndProviders = RowPolymorphismAndProviders.app
exampleToApp AddingAttributes = AddingAttributes.app
exampleToApp BiasingASideOfSampling = BiasingASideOfSampling.app
exampleToApp SamplingABehaviorAndDiscardingTheEvent = SamplingABehaviorAndDiscardingTheEvent.app
exampleToApp BehaviorsVersusFlapping = BehaviorsVersusFlapping.app
exampleToApp InjectingDependencies = InjectingDependencies.app
exampleToApp CompactingEvents = CompactingEvents.app
exampleToApp EmptyUntilFull = EmptyUntilFull.app
exampleToApp RunSSR = RunSSR.app
exampleToApp ASimpleComponent = ASimpleComponent.app
exampleToApp AddingSeveralElementsToPursx = AddingSeveralElementsToPursx.app
exampleToApp UseMailboxed = UseMailboxed.app
exampleToApp AddingAnAttributeToPursx = AddingAnAttributeToPursx.app
exampleToApp ComponentsAsSemigroups = ComponentsAsSemigroups.app
exampleToApp GroupsOfGroups = GroupsOfGroups.app
exampleToApp TheOneOfFunction = TheOneOfFunction.app
exampleToApp TheGlobalPortalSyntax = TheGlobalPortalSyntax.app
exampleToApp CustomHook1 = CustomHook1.app
exampleToApp GatingEventsOnBehaviors = GatingEventsOnBehaviors.app
exampleToApp EffectsInSSR = EffectsInSSR.app
exampleToApp UsingFunctionsAsMonads = UsingFunctionsAsMonads.app
exampleToApp TheKeepLatestFunction = TheKeepLatestFunction.app
exampleToApp ASimpleCounter = ASimpleCounter.app
exampleToApp GlobalHandlers = GlobalHandlers.app
exampleToApp AddingSeveralAttributesToPursx = AddingSeveralAttributesToPursx.app
exampleToApp SamplingABehaviorWithAnEvent = SamplingABehaviorWithAnEvent.app
exampleToApp UseRef = UseRef.app
exampleToApp RunningAffsWithCancellationInResponseToAnEvent = RunningAffsWithCancellationInResponseToAnEvent.app
exampleToApp KnowThySelfT = KnowThySelfT.app
exampleToApp ShorthandListeners = ShorthandListeners.app
exampleToApp ANoteOnMemoization = ANoteOnMemoization.app
exampleToApp AddingCustomElements = AddingCustomElements.app
exampleToApp ComponentsAsMonoids = ComponentsAsMonoids.app
exampleToApp ALagUsingFix = ALagUsingFix.app
exampleToApp AddingASingleElementToPursx = AddingASingleElementToPursx.app
exampleToApp PlainOldHtml = PlainOldHtml.app
exampleToApp UsingAnEffect = UsingAnEffect.app
exampleToApp KnowThySelf = KnowThySelf.app
exampleToApp UnsafePursx = UnsafePursx.app
exampleToApp RunningAffsSequentiallyInResponseToAnEvent = RunningAffsSequentiallyInResponseToAnEvent.app
exampleToApp TheLocalPortalSyntax = TheLocalPortalSyntax.app
exampleToApp UnsettingAttributes = UnsettingAttributes.app
exampleToApp HowSamplingWorks = HowSamplingWorks.app
exampleToApp UnlockingLevels = UnlockingLevels.app
exampleToApp UseDyn = UseDyn.app
exampleToApp RunningEffectsInResponseToEvents = RunningEffectsInResponseToEvents.app
exampleToApp IntegratingBehaviors = IntegratingBehaviors.app
exampleToApp HelloWorldCode = HelloWorldCode.app
exampleToApp InsertingInADifferentOrder = InsertingInADifferentOrder.app
exampleToApp CustomHook2 = CustomHook2.app
exampleToApp NestedCustomHooks = NestedCustomHooks.app
exampleToApp MultipleSubscriptions = MultipleSubscriptions.app
exampleToApp TheStateHook = TheStateHook.app
exampleToApp InterComponentCommunication = InterComponentCommunication.app
exampleToApp DerivingBehaviors = DerivingBehaviors.app
exampleToApp SolvingDifferentialEquations = SolvingDifferentialEquations.app
exampleToApp UsingTheHookInAnAttribute = UsingTheHookInAnAttribute.app
exampleToApp PassingAroundHooks = PassingAroundHooks.app
exampleToApp SwitchingOnBehaviors = SwitchingOnBehaviors.app
exampleToApp GroupingComponents = GroupingComponents.app
exampleToApp FlippingTheFunctionAndArgument = FlippingTheFunctionAndArgument.app
exampleToApp MovingElements = MovingElements.app
exampleToApp MockDiscord = MockDiscord.app
exampleToApp RunningAffsInResponseToAnEvent = RunningAffsInResponseToAnEvent.app
exampleToApp SamplingABehaviorWithACustomFunction = SamplingABehaviorWithACustomFunction.app
exampleToApp MemoizedApplication = MemoizedApplication.app
exampleToApp MemoizedNoEvent = MemoizedNoEvent.app
exampleToApp WhenToFixAndWhenToFold = WhenToFixAndWhenToFold.app
exampleToApp UsingAHookToControlPresence = UsingAHookToControlPresence.app
exampleToApp PurityOutOfThinAir = PurityOutOfThinAir.app
exampleToApp RemovingElements = RemovingElements.app
exampleToApp HandRolledEvent = HandRolledEvent.app
exampleToApp UnsafeCustomElement = UnsafeCustomElement.app
exampleToApp SeveralLagsUsingFix = SeveralLagsUsingFix.app
exampleToApp EventsAsSemigroups = EventsAsSemigroups.app
exampleToApp AltAsAMuxer = AltAsAMuxer.app
