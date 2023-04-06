module Pages.Introduction where

import Prelude

import Contracts (Chapter, chapter)
import Pages.Introduction.GettingStarted (gettingStarted)
import Pages.Introduction.HelloWorld (helloWorld)

introduction :: Chapter
introduction = chapter
  { title: "Introduction", pages: [ gettingStarted, helloWorld ] }