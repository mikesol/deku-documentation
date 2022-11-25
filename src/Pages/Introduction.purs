module Pages.Introduction where

import Contracts (Chapter, chapter)
import Pages.Introduction.GettingStarted (gettingStarted)
import Pages.Introduction.HelloWorld (helloWorld)

introduction :: forall lock payload. Chapter lock payload
introduction = chapter
  { title: "Introduction", pages: [ gettingStarted, helloWorld ] }