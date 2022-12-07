import { main } from 'PureScript'
import * as FilteringAnEvent from '../output/Examples.FilteringAnEvent/index.js'
import * as UsingTheOriginalEvent from '../output/Examples.UsingTheOriginalEvent/index.js'
import * as EventsAsSemirings from '../output/Examples.EventsAsSemirings/index.js'
import * as UsingTheHookToSwitchBetweenElements from '../output/Examples.UsingTheHookToSwitchBetweenElements/index.js'
import * as RowPolymorphismAndProviders from '../output/Examples.RowPolymorphismAndProviders/index.js'
import * as AddingAttributes from '../output/Examples.AddingAttributes/index.js'
import * as BiasingASideOfSampling from '../output/Examples.BiasingASideOfSampling/index.js'
import * as TheCreatePureEffect from '../output/Examples.TheCreatePureEffect/index.js'
import * as SamplingABehaviorAndDiscardingTheEvent from '../output/Examples.SamplingABehaviorAndDiscardingTheEvent/index.js'
import * as BehaviorsVersusFlapping from '../output/Examples.BehaviorsVersusFlapping/index.js'
import * as InjectingDependencies from '../output/Examples.InjectingDependencies/index.js'
import * as CompactingEvents from '../output/Examples.CompactingEvents/index.js'
import * as EmptyUntilFull from '../output/Examples.EmptyUntilFull/index.js'
import * as AddingSeveralElements from '../output/Examples.AddingSeveralElements/index.js'
import * as RunSSR from '../output/Examples.RunSSR/index.js'
import * as ASimpleComponent from '../output/Examples.ASimpleComponent/index.js'
import * as TheLemmingEvent from '../output/Examples.TheLemmingEvent/index.js'
import * as ComponentsAsSemigroups from '../output/Examples.ComponentsAsSemigroups/index.js'
import * as GroupsOfGroups from '../output/Examples.GroupsOfGroups/index.js'
import * as TheOneOfFunction from '../output/Examples.TheOneOfFunction/index.js'
import * as TheGlobalPortalSyntax from '../output/Examples.TheGlobalPortalSyntax/index.js'
import * as GatingEventsOnBehaviors from '../output/Examples.GatingEventsOnBehaviors/index.js'
import * as EffectsInSSR from '../output/Examples.EffectsInSSR/index.js'
import * as UsingFunctionsAsMonads from '../output/Examples.UsingFunctionsAsMonads/index.js'
import * as TheKeepLatestFunction from '../output/Examples.TheKeepLatestFunction/index.js'
import * as ASimpleCounter from '../output/Examples.ASimpleCounter/index.js'
import * as GlobalHandlers from '../output/Examples.GlobalHandlers/index.js'
import * as EventsAsRings from '../output/Examples.EventsAsRings/index.js'
import * as SamplingABehaviorWithAnEvent from '../output/Examples.SamplingABehaviorWithAnEvent/index.js'
import * as KnowThySelfT from '../output/Examples.KnowThySelfT/index.js'
import * as ShorthandListeners from '../output/Examples.ShorthandListeners/index.js'
import * as ANoteOnMemoization from '../output/Examples.ANoteOnMemoization/index.js'
import * as OptimizedEventCreation from '../output/Examples.OptimizedEventCreation/index.js'
import * as TheFixFunction from '../output/Examples.TheFixFunction/index.js'
import * as TheTemporalityOfPure from '../output/Examples.TheTemporalityOfPure/index.js'
import * as AddingAnAttribute from '../output/Examples.AddingAnAttribute/index.js'
import * as AddingCustomElements from '../output/Examples.AddingCustomElements/index.js'
import * as OptimizedEventFunctions from '../output/Examples.OptimizedEventFunctions/index.js'
import * as ComponentsAsMonoids from '../output/Examples.ComponentsAsMonoids/index.js'
import * as PlainOldHtml from '../output/Examples.PlainOldHtml/index.js'
import * as UsingAnEffect from '../output/Examples.UsingAnEffect/index.js'
import * as KnowThySelf from '../output/Examples.KnowThySelf/index.js'
import * as UnsafePursx from '../output/Examples.UnsafePursx/index.js'
import * as AddingASingleElement from '../output/Examples.AddingASingleElement/index.js'
import * as TheLocalPortalSyntax from '../output/Examples.TheLocalPortalSyntax/index.js'
import * as BooleanLogicOnEvents from '../output/Examples.BooleanLogicOnEvents/index.js'
import * as HowSamplingWorks from '../output/Examples.HowSamplingWorks/index.js'
import * as UnlockingLevels from '../output/Examples.UnlockingLevels/index.js'
import * as UseDyn from '../output/Examples.UseDyn/index.js'
import * as IntegratingBehaviors from '../output/Examples.IntegratingBehaviors/index.js'
import * as HelloWorldCode from '../output/Examples.HelloWorldCode/index.js'
import * as InsertingInADifferentOrder from '../output/Examples.InsertingInADifferentOrder/index.js'
import * as MultipleSubscriptions from '../output/Examples.MultipleSubscriptions/index.js'
import * as TheStateHook from '../output/Examples.TheStateHook/index.js'
import * as InterComponentCommunication from '../output/Examples.InterComponentCommunication/index.js'
import * as EventsAsMonoids from '../output/Examples.EventsAsMonoids/index.js'
import * as DerivingBehaviors from '../output/Examples.DerivingBehaviors/index.js'
import * as SolvingDifferentialEquations from '../output/Examples.SolvingDifferentialEquations/index.js'
import * as UsingTheHookInAnAttribute from '../output/Examples.UsingTheHookInAnAttribute/index.js'
import * as PassingAroundHooks from '../output/Examples.PassingAroundHooks/index.js'
import * as SwitchingOnBehaviors from '../output/Examples.SwitchingOnBehaviors/index.js'
import * as GroupingComponents from '../output/Examples.GroupingComponents/index.js'
import * as FlippingTheFunctionAndArgument from '../output/Examples.FlippingTheFunctionAndArgument/index.js'
import * as MovingElements from '../output/Examples.MovingElements/index.js'
import * as MockDiscord from '../output/Examples.MockDiscord/index.js'
import * as AddingSeveralAttributes from '../output/Examples.AddingSeveralAttributes/index.js'
import * as SamplingABehaviorWithACustomFunction from '../output/Examples.SamplingABehaviorWithACustomFunction/index.js'
import * as WhenToFixAndWhenToFold from '../output/Examples.WhenToFixAndWhenToFold/index.js'
import * as UsingAHookToControlPresence from '../output/Examples.UsingAHookToControlPresence/index.js'
import * as RemovingElements from '../output/Examples.RemovingElements/index.js'
import * as UnsafeCustomElement from '../output/Examples.UnsafeCustomElement/index.js'
import * as EventsAsSemigroups from '../output/Examples.EventsAsSemigroups/index.js'
import * as AltAsAMuxer from '../output/Examples.AltAsAMuxer/index.js'
import.meta.env.START === 'filteringAnEvent'
  ? FilteringAnEvent.main()
  : import.meta.env.START === 'usingTheOriginalEvent'
  ? UsingTheOriginalEvent.main()
  : import.meta.env.START === 'eventsAsSemirings'
  ? EventsAsSemirings.main()
  : import.meta.env.START === 'usingTheHookToSwitchBetweenElements'
  ? UsingTheHookToSwitchBetweenElements.main()
  : import.meta.env.START === 'rowPolymorphismAndProviders'
  ? RowPolymorphismAndProviders.main()
  : import.meta.env.START === 'addingAttributes'
  ? AddingAttributes.main()
  : import.meta.env.START === 'biasingASideOfSampling'
  ? BiasingASideOfSampling.main()
  : import.meta.env.START === 'theCreatePureEffect'
  ? TheCreatePureEffect.main()
  : import.meta.env.START === 'samplingABehaviorAndDiscardingTheEvent'
  ? SamplingABehaviorAndDiscardingTheEvent.main()
  : import.meta.env.START === 'behaviorsVersusFlapping'
  ? BehaviorsVersusFlapping.main()
  : import.meta.env.START === 'injectingDependencies'
  ? InjectingDependencies.main()
  : import.meta.env.START === 'compactingEvents'
  ? CompactingEvents.main()
  : import.meta.env.START === 'emptyUntilFull'
  ? EmptyUntilFull.main()
  : import.meta.env.START === 'addingSeveralElements'
  ? AddingSeveralElements.main()
  : import.meta.env.START === 'runSSR'
  ? RunSSR.main()
  : import.meta.env.START === 'aSimpleComponent'
  ? ASimpleComponent.main()
  : import.meta.env.START === 'theLemmingEvent'
  ? TheLemmingEvent.main()
  : import.meta.env.START === 'componentsAsSemigroups'
  ? ComponentsAsSemigroups.main()
  : import.meta.env.START === 'groupsOfGroups'
  ? GroupsOfGroups.main()
  : import.meta.env.START === 'theOneOfFunction'
  ? TheOneOfFunction.main()
  : import.meta.env.START === 'theGlobalPortalSyntax'
  ? TheGlobalPortalSyntax.main()
  : import.meta.env.START === 'gatingEventsOnBehaviors'
  ? GatingEventsOnBehaviors.main()
  : import.meta.env.START === 'effectsInSSR'
  ? EffectsInSSR.main()
  : import.meta.env.START === 'usingFunctionsAsMonads'
  ? UsingFunctionsAsMonads.main()
  : import.meta.env.START === 'theKeepLatestFunction'
  ? TheKeepLatestFunction.main()
  : import.meta.env.START === 'aSimpleCounter'
  ? ASimpleCounter.main()
  : import.meta.env.START === 'globalHandlers'
  ? GlobalHandlers.main()
  : import.meta.env.START === 'eventsAsRings'
  ? EventsAsRings.main()
  : import.meta.env.START === 'samplingABehaviorWithAnEvent'
  ? SamplingABehaviorWithAnEvent.main()
  : import.meta.env.START === 'knowThySelfT'
  ? KnowThySelfT.main()
  : import.meta.env.START === 'shorthandListeners'
  ? ShorthandListeners.main()
  : import.meta.env.START === 'aNoteOnMemoization'
  ? ANoteOnMemoization.main()
  : import.meta.env.START === 'optimizedEventCreation'
  ? OptimizedEventCreation.main()
  : import.meta.env.START === 'theFixFunction'
  ? TheFixFunction.main()
  : import.meta.env.START === 'theTemporalityOfPure'
  ? TheTemporalityOfPure.main()
  : import.meta.env.START === 'addingAnAttribute'
  ? AddingAnAttribute.main()
  : import.meta.env.START === 'addingCustomElements'
  ? AddingCustomElements.main()
  : import.meta.env.START === 'optimizedEventFunctions'
  ? OptimizedEventFunctions.main()
  : import.meta.env.START === 'componentsAsMonoids'
  ? ComponentsAsMonoids.main()
  : import.meta.env.START === 'plainOldHtml'
  ? PlainOldHtml.main()
  : import.meta.env.START === 'usingAnEffect'
  ? UsingAnEffect.main()
  : import.meta.env.START === 'knowThySelf'
  ? KnowThySelf.main()
  : import.meta.env.START === 'unsafePursx'
  ? UnsafePursx.main()
  : import.meta.env.START === 'addingASingleElement'
  ? AddingASingleElement.main()
  : import.meta.env.START === 'theLocalPortalSyntax'
  ? TheLocalPortalSyntax.main()
  : import.meta.env.START === 'booleanLogicOnEvents'
  ? BooleanLogicOnEvents.main()
  : import.meta.env.START === 'howSamplingWorks'
  ? HowSamplingWorks.main()
  : import.meta.env.START === 'unlockingLevels'
  ? UnlockingLevels.main()
  : import.meta.env.START === 'useDyn'
  ? UseDyn.main()
  : import.meta.env.START === 'integratingBehaviors'
  ? IntegratingBehaviors.main()
  : import.meta.env.START === 'helloWorldCode'
  ? HelloWorldCode.main()
  : import.meta.env.START === 'insertingInADifferentOrder'
  ? InsertingInADifferentOrder.main()
  : import.meta.env.START === 'multipleSubscriptions'
  ? MultipleSubscriptions.main()
  : import.meta.env.START === 'theStateHook'
  ? TheStateHook.main()
  : import.meta.env.START === 'interComponentCommunication'
  ? InterComponentCommunication.main()
  : import.meta.env.START === 'eventsAsMonoids'
  ? EventsAsMonoids.main()
  : import.meta.env.START === 'derivingBehaviors'
  ? DerivingBehaviors.main()
  : import.meta.env.START === 'solvingDifferentialEquations'
  ? SolvingDifferentialEquations.main()
  : import.meta.env.START === 'usingTheHookInAnAttribute'
  ? UsingTheHookInAnAttribute.main()
  : import.meta.env.START === 'passingAroundHooks'
  ? PassingAroundHooks.main()
  : import.meta.env.START === 'switchingOnBehaviors'
  ? SwitchingOnBehaviors.main()
  : import.meta.env.START === 'groupingComponents'
  ? GroupingComponents.main()
  : import.meta.env.START === 'flippingTheFunctionAndArgument'
  ? FlippingTheFunctionAndArgument.main()
  : import.meta.env.START === 'movingElements'
  ? MovingElements.main()
  : import.meta.env.START === 'mockDiscord'
  ? MockDiscord.main()
  : import.meta.env.START === 'addingSeveralAttributes'
  ? AddingSeveralAttributes.main()
  : import.meta.env.START === 'samplingABehaviorWithACustomFunction'
  ? SamplingABehaviorWithACustomFunction.main()
  : import.meta.env.START === 'whenToFixAndWhenToFold'
  ? WhenToFixAndWhenToFold.main()
  : import.meta.env.START === 'usingAHookToControlPresence'
  ? UsingAHookToControlPresence.main()
  : import.meta.env.START === 'removingElements'
  ? RemovingElements.main()
  : import.meta.env.START === 'unsafeCustomElement'
  ? UnsafeCustomElement.main()
  : import.meta.env.START === 'eventsAsSemigroups'
  ? EventsAsSemigroups.main()
  : import.meta.env.START === 'altAsAMuxer'
  ? AltAsAMuxer.main()
  : main()
