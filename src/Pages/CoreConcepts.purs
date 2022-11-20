module Pages.CoreConcepts where

import Contracts (Chapter(..))
import Pages.CoreConcepts.Components (components)
import Pages.CoreConcepts.HelloWorld (helloWorld)

introduction :: forall lock payload. Chapter lock payload
introduction = Chapter
  { title: "Core concepts", pages: [ helloWorld, components ] }