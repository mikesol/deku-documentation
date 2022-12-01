module Pages.CoreConcepts.Providers.RowPolymorphism.DifferencesWithTraditionalPolymorphism where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D

differencesWithTraditionalPolymorphism
  :: forall lock payload. Subsection lock payload
differencesWithTraditionalPolymorphism = subsection
  { title: "Row polymorphism 101"
  , matter: pure
      [ D.p_
          [ text_ "In the providers above, "
          , D.code__ "AppMonad"
          , text_
              " was a record of two key-value pairs. We could have used three pairs, five pairs, or forty-two pairs. That's the beauty of records: the represent an indexing of as many types as you want. And because they can scale up to "
          , D.i__ "n"
          , text_ " types, we can encode that "
          , D.i__ "n"
          , text_
              " using polymorphism. In PureScript, when I want to indicate a row that has certain givesn plus "
          , D.i__ "n"
          , text_ " other types, where "
          , D.i__ "n"
          , text_
              " is between 0 and something really, really big, I write it like this:"
          ]
      , psCode "forall r. { foo :: Int, bar :: Boolean | r }"
      , D.p_
          [ text_ "The "
          , D.code__ "|"
          , text_
              " symbol is telling the compiler that the row behind the record may take other parameters, but this particular function will only be able to access "
          , D.code__ "foo"
          , text_ " and "
          , D.code__ "bar"
          , text_ "."
          ]
      , D.p__
          "Thinking back to our goal of writing Deku libraries, if we encode a provider as a polymorphic row, we're able to construct an API where we specify our dependencies but allow for a row that's larger than what we need. That way, multiple libraries can be blended together, where each one is an index in a row. Let's see an example of this below."
      ]
  }
