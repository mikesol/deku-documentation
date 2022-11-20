module Pages.Introduction where

import Contracts (Chapter(..))
import Pages.Introduction.GettingStarted (gettingStarted)

introduction :: forall lock payload. Chapter lock payload
introduction = Chapter
  { title: "Introduction", pages: [ gettingStarted ] }