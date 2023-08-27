module Pages.CoreConcepts.Pursx where

import Prelude

import Components.Code (htmlCode)
import Contracts (Page, page)
import Data.Symbol (reflectSymbol)

import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Pursx ((~~))
import Pages.CoreConcepts.Pursx.ASimpleExample (aSimpleExample)
import Pages.CoreConcepts.Pursx.DynamicAttributes (dynamicAttributes)
import Pages.CoreConcepts.Pursx.DynamicElements (dynamicElements)
import Pages.CoreConcepts.Pursx.PursxAlternatives (pursxAlternatives)
import Router.ADT (Route(..))
import Type.Proxy (Proxy(..))

myHtml =
  ( Proxy
      :: Proxy
           """<div class="bg-white">
  <div class="mx-auto max-w-7xl py-12 px-4 text-center sm:px-6 lg:py-16 lg:px-8">
    <h2 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">
      <span class="block">Ready to dive in?</span>
      <span class="block">Start your free trial today.</span>
    </h2>
    <div class="mt-8 flex justify-center">
      <div class="inline-flex rounded-md shadow">
        <button class="inline-flex items-center justify-center rounded-md border border-transparent bg-indigo-600 px-5 py-3 text-base font-medium text-white hover:bg-indigo-700">Get started</button>
      </div>
      <div class="ml-3 inline-flex">
        <button class="inline-flex items-center justify-center rounded-md border border-transparent bg-indigo-100 px-5 py-3 text-base font-medium text-indigo-700 hover:bg-indigo-200">Learn more</button>
      </div>
    </div>
  </div>
</div>"""
  )

pursx :: Page
pursx = page
  { route: Pursx
  , topmatter: pure
      [ D.p [ DA.klass_ "lead" ]
          [ text_ "Or how I learned to stop worrying and copy-paste the DOM."
          ]
      , D.p_
          [ text_
              "Sometimes, you procure a quality snippet of HTML that you would like to throw in a Deku project with minimal hassle. For example, imagine that I get the following chunk of HTML from a designer."
          ]
      , htmlCode (reflectSymbol myHtml)
      , D.p__ "This renders in the DOM like so."
      , D.div
          [ DA.klass_
              "border-solid border-2 border-slate-200 dark:border-white-200"
          ]
          [ myHtml ~~ {} ]
      , D.p__
          "I could meticulously rewrite the entire thing in Deku, at which point my designer would complain to our boss:"
      , D.blockquote__
          "This guy is so obsessed with using their pet functional programming language that they spent two hours rewriting HTML snippets in some esoteric format that none of us understand. Can't we just hire a JavaScript developer?"
      , D.p_
          [ text_
              "After having been fired from several companies for this exact reason, I developed "
          , D.b__ "Pursx"
          , text_
              ", which solves this and many other problems. In this section, you too will learn how to use Pursx "
          , text_ " (and, by extension, how to keep your job)."
          ]
      ]
  , sections:
      [ aSimpleExample, dynamicAttributes, dynamicElements, pursxAlternatives ]
  }
