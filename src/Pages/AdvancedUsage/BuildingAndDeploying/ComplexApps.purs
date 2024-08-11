module Pages.AdvancedUsage.BuildingAndDeploying.ComplexApps where

import Prelude

import Components.Code (psCodeNoCollapse)
import Components.Disclaimer (disclaimer)
import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA

complexApps :: Section
complexApps = section
  { title: "SSG, SSR and Vercel"
  , topmatter: pure
      [ D.p_
          [ text_
              "Deku can also be deployed as server-side generated html or server-side rendered app. The easiest way to do this is to use "
          , D.a [ DA.href_ "https://vike.dev" ] [ D.code__ "vike" ]
          , text_ " for your build and "
          , D.a [ DA.href_ "https://vercel.com" ] [ D.code__ "vercel" ]
          , text_ " for your deploy."
          ]
      , D.p_
          [ text_ "To render your page as HTML, you can use "
          , D.code__ "ssrInBody"
          , text_ " from "
          , D.code__ "Deku.Toplevel"
          , text_ "."
          ]
      , psCodeNoCollapse
          """module Main where

import Prelude
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import Deku.Control (text_)
import Deku.Toplevel (ssrInBody)

main :: Effect Unit
main = void $ ssrInBody (text_ "I’m main!")
"""
      , D.p_
          [ text_ "This needs a server-side DOM polyfill like "
          , D.code__ "jsdom"
          , text_
              " to work. The docs you’re reading are built this way. Check out the source code for this page and be bedazzled by the magic of its pre-rendered HTML."
          ]
      , D.p_
          [ text_ "If you’re just building a static site, you can use "
          , D.code__ "ssrInBody"
          , text_
              " and ignore the return value. However, most sites, including this one, have interactive bits. In that case, stash the output of "
          , D.code__ "ssrInBody"
          , text_ " and feed it to "
          , D.code__ "hydrateInBody"
          , text_ " as the first argument."
          ]
      , psCodeNoCollapse
          """
module MyAwesomeApp where

myAwesomeApp = text_ "I’m awesome!"

-- after which one does ...

module SSR where

import Prelude
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import Deku.Control (text_)
import MyAwesomeApp (myAwesomeApp)
import Deku.Toplevel (ssrInBody, SSROutput)

ssr :: Effect SSROutput
ssr = ssrInBody myAwesomeApp

-- followed by ...

module Hydrate where

import Prelude
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import Deku.Control (text_)
import MyAwesomeApp (myAwesomeApp)
import Deku.Toplevel (hydrateInBody, SSROutput)

hydrate :: SSROutput -> Effect Unit
hydrate cache = hydrateInBody cache myAwesomeApp
"""
      , D.p_
          [ text_
              "After the initial argument to "
          , D.code__ "hydrateInBody"
          , text_ ", the signature is identical to the veritable workhorse "
          , D.code__ "runInBody"
          , text_ " that you've been using all along."
          ]
      , disclaimer
          { header: text_ "Render the right app"
          , message: D.p_
              [ text_ "If you render an app using "
              , D.code__ "ssrInBody"
              , text_ " and then hydrate a "
              , D.i__ "different"
              , text_ " app using "
              , D.code__ "hydrateInBody"
              , text_
                  ", I can't even begin to describe the ill fate that will befall you. Even writing about it makes one's fingers ache. Don't do it. Hydrate the same app you rendered!"
              ]
          }
      , D.p_
          [ text_ "For a no-frills example of SSR, check out "
          , D.a [ DA.href_ "https://github.com/mikesol/vite-deku-minimal/" ]
              [ D.code__ "vike-deku-minimal" ]
          , text_
              ". For an example that uses client-side routing like these docs, check out "
          , D.a
              [ DA.href_ "https://github.com/mikesol/vike-deku-client-routing" ]
              [ D.code__ "vike-deku-client-routing" ]
          , text_ ". In both of these examples, "
          , D.code__ "SSROutput"
          , text_
              " is serialized to and from JSON."
          ]
      ]
  , subsections:
      []
  }
