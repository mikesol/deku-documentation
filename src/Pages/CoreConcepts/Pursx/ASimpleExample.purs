module Pages.CoreConcepts.Pursx.ASimpleExample where

import Prelude

import Components.Code (htmlCode)
import Contracts (Section, section)
import Data.Symbol (reflectSymbol)
import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Pursx ((~~))
import Pages.CoreConcepts.Pursx.ASimpleExample.ClosingTagsAndTreeStructure (closingTagsAndTreeStructure)
import Pages.CoreConcepts.Pursx.ASimpleExample.PlainOldHTML (plainOldHTML)
import Pages.CoreConcepts.Pursx.ASimpleExample.TypeSafety (typeSafety)
import Type.Proxy (Proxy(..))

myHtml =
  ( Proxy
      :: Proxy
           """<nav class="flex" aria-label="Breadcrumb">
  <ol role="list" class="flex space-x-4 rounded-md bg-white px-6 shadow">
    <li class="flex">
      <div class="flex items-center">
        <span class="cursor-pointer text-gray-400 hover:text-gray-500">
          <!-- Heroicon name: mini/home -->
          <svg class="h-5 w-5 flex-shrink-0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
            <path fill-rule="evenodd" d="M9.293 2.293a1 1 0 011.414 0l7 7A1 1 0 0117 11h-1v6a1 1 0 01-1 1h-2a1 1 0 01-1-1v-3a1 1 0 00-1-1H9a1 1 0 00-1 1v3a1 1 0 01-1 1H5a1 1 0 01-1-1v-6H3a1 1 0 01-.707-1.707l7-7z" clip-rule="evenodd" />
          </svg>
          <span class="sr-only cursor-pointer">Home</span>
        </span>
      </div>
    </li>

    <li class="flex">
      <div class="flex items-center">
        <svg class="h-full w-6 flex-shrink-0 text-gray-200" viewBox="0 0 24 44" preserveAspectRatio="none" fill="currentColor" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
          <path d="M.293 0l22 22-22 22h1.414l22-22-22-22H.293z" />
        </svg>
        <span class="cursor-pointer ml-4 text-sm font-medium text-gray-500 hover:text-gray-700">Projects</span>
      </div>
    </li>

    <li class="flex">
      <div class="flex items-center">
        <svg class="h-full w-6 flex-shrink-0 text-gray-200" viewBox="0 0 24 44" preserveAspectRatio="none" fill="currentColor" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
          <path d="M.293 0l22 22-22 22h1.414l22-22-22-22H.293z" />
        </svg>
        <span class="cursor-pointer ml-4 text-sm font-medium text-gray-500 hover:text-gray-700" aria-current="page">Project Nero</span>
      </div>
    </li>
  </ol>
</nav>"""
  )

aSimpleExample :: Section
aSimpleExample = section
  { title: "A simple example"
  , topmatter: pure
      [ D.p_
          [ text_
              "Let's start with a simple example. The HTML will be a bit on the long side, but the Deku will be short and sweet! As a motivating example, we'll be developing breadcrumbs."
          ]
      , htmlCode (reflectSymbol myHtml)
      , D.p__ "This renders in the DOM like so."
      , D.div
          [ DA.klass_
              "border-solid border-2 border-slate-200 dark:border-white-200 flex justify-center"
          ]
          [ myHtml ~~ {} ]
      , D.p__
          "By the end of this page, we'll have our breadcrumbs hooked up to stateful logic. We'll start by seeing how to render the example above in Deku."
      ]
  , subsections:
      [ plainOldHTML, typeSafety, closingTagsAndTreeStructure ]
  }
