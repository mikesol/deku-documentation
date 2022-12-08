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
const toStart = import.meta.env.START
toStart === 'FilteringAnEvent'
  ? FilteringAnEvent.main()
  : toStart === 'UsingTheOriginalEvent'
  ? UsingTheOriginalEvent.main()
  : toStart === 'EventsAsSemirings'
  ? EventsAsSemirings.main()
  : toStart === 'UsingTheHookToSwitchBetweenElements'
  ? UsingTheHookToSwitchBetweenElements.main()
  : toStart === 'RowPolymorphismAndProviders'
  ? RowPolymorphismAndProviders.main()
  : toStart === 'AddingAttributes'
  ? AddingAttributes.main()
  : toStart === 'BiasingASideOfSampling'
  ? BiasingASideOfSampling.main()
  : toStart === 'TheCreatePureEffect'
  ? TheCreatePureEffect.main()
  : toStart === 'SamplingABehaviorAndDiscardingTheEvent'
  ? SamplingABehaviorAndDiscardingTheEvent.main()
  : toStart === 'BehaviorsVersusFlapping'
  ? BehaviorsVersusFlapping.main()
  : toStart === 'InjectingDependencies'
  ? InjectingDependencies.main()
  : toStart === 'CompactingEvents'
  ? CompactingEvents.main()
  : toStart === 'EmptyUntilFull'
  ? EmptyUntilFull.main()
  : toStart === 'AddingSeveralElements'
  ? AddingSeveralElements.main()
  : toStart === 'RunSSR'
  ? RunSSR.main()
  : toStart === 'ASimpleComponent'
  ? ASimpleComponent.main()
  : toStart === 'TheLemmingEvent'
  ? TheLemmingEvent.main()
  : toStart === 'ComponentsAsSemigroups'
  ? ComponentsAsSemigroups.main()
  : toStart === 'GroupsOfGroups'
  ? GroupsOfGroups.main()
  : toStart === 'TheOneOfFunction'
  ? TheOneOfFunction.main()
  : toStart === 'TheGlobalPortalSyntax'
  ? TheGlobalPortalSyntax.main()
  : toStart === 'GatingEventsOnBehaviors'
  ? GatingEventsOnBehaviors.main()
  : toStart === 'EffectsInSSR'
  ? EffectsInSSR.main()
  : toStart === 'UsingFunctionsAsMonads'
  ? UsingFunctionsAsMonads.main()
  : toStart === 'TheKeepLatestFunction'
  ? TheKeepLatestFunction.main()
  : toStart === 'ASimpleCounter'
  ? ASimpleCounter.main()
  : toStart === 'GlobalHandlers'
  ? GlobalHandlers.main()
  : toStart === 'EventsAsRings'
  ? EventsAsRings.main()
  : toStart === 'SamplingABehaviorWithAnEvent'
  ? SamplingABehaviorWithAnEvent.main()
  : toStart === 'KnowThySelfT'
  ? KnowThySelfT.main()
  : toStart === 'ShorthandListeners'
  ? ShorthandListeners.main()
  : toStart === 'ANoteOnMemoization'
  ? ANoteOnMemoization.main()
  : toStart === 'OptimizedEventCreation'
  ? OptimizedEventCreation.main()
  : toStart === 'TheFixFunction'
  ? TheFixFunction.main()
  : toStart === 'TheTemporalityOfPure'
  ? TheTemporalityOfPure.main()
  : toStart === 'AddingAnAttribute'
  ? AddingAnAttribute.main()
  : toStart === 'AddingCustomElements'
  ? AddingCustomElements.main()
  : toStart === 'OptimizedEventFunctions'
  ? OptimizedEventFunctions.main()
  : toStart === 'ComponentsAsMonoids'
  ? ComponentsAsMonoids.main()
  : toStart === 'PlainOldHtml'
  ? PlainOldHtml.main()
  : toStart === 'UsingAnEffect'
  ? UsingAnEffect.main()
  : toStart === 'KnowThySelf'
  ? KnowThySelf.main()
  : toStart === 'UnsafePursx'
  ? UnsafePursx.main()
  : toStart === 'AddingASingleElement'
  ? AddingASingleElement.main()
  : toStart === 'TheLocalPortalSyntax'
  ? TheLocalPortalSyntax.main()
  : toStart === 'BooleanLogicOnEvents'
  ? BooleanLogicOnEvents.main()
  : toStart === 'HowSamplingWorks'
  ? HowSamplingWorks.main()
  : toStart === 'UnlockingLevels'
  ? UnlockingLevels.main()
  : toStart === 'UseDyn'
  ? UseDyn.main()
  : toStart === 'IntegratingBehaviors'
  ? IntegratingBehaviors.main()
  : toStart === 'HelloWorldCode'
  ? HelloWorldCode.main()
  : toStart === 'InsertingInADifferentOrder'
  ? InsertingInADifferentOrder.main()
  : toStart === 'MultipleSubscriptions'
  ? MultipleSubscriptions.main()
  : toStart === 'TheStateHook'
  ? TheStateHook.main()
  : toStart === 'InterComponentCommunication'
  ? InterComponentCommunication.main()
  : toStart === 'EventsAsMonoids'
  ? EventsAsMonoids.main()
  : toStart === 'DerivingBehaviors'
  ? DerivingBehaviors.main()
  : toStart === 'SolvingDifferentialEquations'
  ? SolvingDifferentialEquations.main()
  : toStart === 'UsingTheHookInAnAttribute'
  ? UsingTheHookInAnAttribute.main()
  : toStart === 'PassingAroundHooks'
  ? PassingAroundHooks.main()
  : toStart === 'SwitchingOnBehaviors'
  ? SwitchingOnBehaviors.main()
  : toStart === 'GroupingComponents'
  ? GroupingComponents.main()
  : toStart === 'FlippingTheFunctionAndArgument'
  ? FlippingTheFunctionAndArgument.main()
  : toStart === 'MovingElements'
  ? MovingElements.main()
  : toStart === 'MockDiscord'
  ? MockDiscord.main()
  : toStart === 'AddingSeveralAttributes'
  ? AddingSeveralAttributes.main()
  : toStart === 'SamplingABehaviorWithACustomFunction'
  ? SamplingABehaviorWithACustomFunction.main()
  : toStart === 'WhenToFixAndWhenToFold'
  ? WhenToFixAndWhenToFold.main()
  : toStart === 'UsingAHookToControlPresence'
  ? UsingAHookToControlPresence.main()
  : toStart === 'RemovingElements'
  ? RemovingElements.main()
  : toStart === 'UnsafeCustomElement'
  ? UnsafeCustomElement.main()
  : toStart === 'EventsAsSemigroups'
  ? EventsAsSemigroups.main()
  : toStart === 'AltAsAMuxer'
  ? AltAsAMuxer.main()
  : main()
