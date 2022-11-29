module Pages.CoreConcepts.Pursx.ASimpleExample.PlainOldHTML where

import Prelude

import Components.Code (psCode)
import Constants (tripleQ)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

plainOldHTML :: forall lock payload. Subsection lock payload
plainOldHTML = subsection
  { title: "Plain old HTML"
  , matter: pure
      [ D.p_
          [ text_ "Here is the Deku code that produces the example seen above."]
          , psCode
              ( """module Main where

import Prelude

import Deku.Pursx ((~~))
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Type.Proxy (Proxy(..))


myHtml = Proxy :: Proxy
   """ <> tripleQ
                  <>
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
                  <> tripleQ
                  <>
                    """

main :: Effect Unit
main = runInBody (myHtml ~~ {})"""
              )
          , D.p__ "Just so that you don't miss it, after the large block of HTML, here's the actual Deku bit."
          , psCode """main :: Effect Unit
main = runInBody (myHtml ~~ {})"""
          , D.p_ [text_ "All you have to do is take your HTML string, add "
          , D.code__ "~~ {}"
          , text_ " after it, and you get your HTML in the DOM prest-o change-o. In addition to being low-code, this is the most performant Deku gets. It literally takes the code and sets it as the "
          , D.code__ "innerHTML"
          , text_ " of some containing element."]
      ]
  }
