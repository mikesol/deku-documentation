module Pages.FRP.Polls.OtherInstances.PollsAsRings where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Pursx (pursx)

pollsAsRings :: Subsection
pollsAsRings = subsection
  { title: "Polls as rings"
  , matter: pure
      [ pursx @"<p>Unlike the movie <a target=\"_blank\" href=\"https://www.imdb.com/title/tt0298130/\">The Ring</a>, a terrible fate will not befall you one week after using <code>Poll</code>s as a <code>Ring</code>. Feel free to add, subtract, and multiply them if their underlying type is a <code>Ring</code> as well!</p>"  {}
      ]
  }
