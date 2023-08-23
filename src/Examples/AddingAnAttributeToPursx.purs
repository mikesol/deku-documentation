module Examples.AddingAnAttributeToPursx where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Data.Foldable (oneOf)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA

import Deku.Control (text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.DOM.Listeners as DL
import Deku.Pursx ((~~))

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

    <li ~projectsHidden~>
      <div class="flex items-center">
        <svg class="h-full w-6 flex-shrink-0 text-gray-200" viewBox="0 0 24 44" preserveAspectRatio="none" fill="currentColor" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
          <path d="M.293 0l22 22-22 22h1.414l22-22-22-22H.293z" />
        </svg>
        <span class="cursor-pointer ml-4 text-sm font-medium text-gray-500 hover:text-gray-700">Projects</span>
      </div>
    </li>

    <li ~neroHidden~>
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

app :: ExampleSignature
app runExample = runExample Deku.do
  setProjects /\ projects <- useState true
  setNero /\ nero <- useState true
  let
    hideOnFalse e =
      DA.klass $ e <#> (if _ then "" else "hidden ") >>>
        (_ <> "flex")
    point = DA.klass_ "cursor-pointer mr-4"
    toggleHome =
      [ point
      , DL.click_ \_ -> (setProjects false *> setNero false)
      ]
    toggleProjects =
      [ point
      , DL.click_ \_ -> (setProjects true *> setNero false)
      ]
    toggleNero =
      [ point
      , DL.click_ \_ -> (setProjects true *> setNero true)
      ]
  D.div_
    [ D.div_
        [ D.a toggleHome [ text_ "Go home" ]
        , D.a toggleProjects [ text_ "Go to projects" ]
        , D.a toggleNero [ text_ "Go to nero" ]
        ]
    , D.div_
        [ myHtml ~~
            { projectsHidden: oneOf [ hideOnFalse projects ]
            , neroHidden: oneOf [ hideOnFalse nero ]
            }
        ]
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')