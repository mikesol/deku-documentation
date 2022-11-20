module Pages.Introduction.GettingStarted.GettingHelp.SubmitAnIssue where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

submitAnIssue :: forall lock payload. Subsection lock payload
submitAnIssue = subsection
  { title: "Submit an issue"
  , matter:
      [ D.p_
          [ text_
              "Inventore et aut minus ut voluptatem nihil commodi doloribus consequatur. Facilis perferendis nihil sit aut aspernatur iure ut dolores et. Aspernatur odit dignissimos. Aut qui est sint sint."
          ]
      , D.p_
          [ text_
              "Facere aliquam qui. Dolorem officia ipsam adipisci qui molestiae. Error voluptatem reprehenderit ex."
          ]
      , D.p_
          [ text_
              "Consequatur enim quia maiores aperiam et ipsum dicta. Quam ut sit facere sit quae. Eligendi veritatis aut ut veritatis iste ut adipisci illo."
          ]
      ]
  }