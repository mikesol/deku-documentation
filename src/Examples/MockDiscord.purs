module Examples.MockDiscord where

import Prelude

import Assets (beluMomURL, belugaURL)
import Data.Maybe (Maybe(..))
import Deku.Attribute (Attribute)
import Deku.Control (elementify, text_)
import Deku.Core (Nut, attributeAtYourOwnRisk)
import Deku.DOM (HTMLElement)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Poll (Poll)
import Type.Proxy (Proxy)

type HTMLDiscordMessage (r :: Row Type) =
  ( __tag :: Proxy "HTMLDiscordMessage"
  , author :: String
  , avatar :: String
  | HTMLElement r
  )

discordMessage
  :: Array (Poll (Attribute (HTMLDiscordMessage ()))) -> Array Nut -> Nut
discordMessage = elementify Nothing "discord-message"

author
  :: forall r
   . Poll String
  -> Poll (Attribute (author :: String | r))
author = map (attributeAtYourOwnRisk "author")

avatar
  :: forall r
   . Poll String
  -> Poll (Attribute (author :: String | r))
avatar = map (attributeAtYourOwnRisk "avatar")

type HTMLDiscordMessages (r :: Row Type) =
  ( __tag :: Proxy "HTMLDiscordMessages"
  | HTMLElement r
  )

discordMessages
  :: Array (Poll (Attribute (HTMLDiscordMessages ()))) -> Array Nut -> Nut
discordMessages = elementify Nothing "discord-messages"

app :: ExampleSignature
app runExample = runExample do
  discordMessages []
    [ discordMessage
        [ author $ pure "beluga"
        , avatar $ pure belugaURL
        ]
        [ text_ "mom" ]
    , discordMessage
        [ author $ pure "belu-mom🌸"
        , avatar $ pure beluMomURL
        ]
        [ text_ "yes beluga" ]
    , discordMessage
        [ author $ pure "beluga"
        , avatar $ pure belugaURL
        ]
        [ text_ "whos my dad?" ]
    , discordMessage
        [ author $ pure "belu-mom🌸"
        , avatar $ pure beluMomURL
        ]
        [ text_ "it's complicated..." ]
    ]

main :: Effect Unit
main = void $ app $ map pure runInBody