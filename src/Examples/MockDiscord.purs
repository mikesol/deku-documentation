module Examples.MockDiscord where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Assets (beluMomURL, belugaURL)
import Control.Plus (empty)
import Data.These (These(..))
import Deku.Attribute (class Attr, Attribute, AttributeValue(..), unsafeAttribute, (:=))
import Deku.Control (text)
import Deku.Core (Nut)
import Deku.DOM (unsafeCustomElement)

import Type.Proxy (Proxy(..))

data DiscordMessages_
data DiscordMessage_
data Author = Author
data Avatar = Avatar
data RoleColor = RoleColor

instance Attr DiscordMessage_ Author String where
  attr _ s = unsafeAttribute
    $ This { key: "author", value: Prop' s }

instance Attr DiscordMessage_ Avatar String where
  attr _ s = unsafeAttribute
    $ This { key: "avatar", value: Prop' s }

instance Attr DiscordMessage_ RoleColor String where
  attr _ s = unsafeAttribute
    $ This { key: "role-color", value: Prop' s }

discordMessages
  :: Array Nut
  -> Nut
discordMessages = unsafeCustomElement "discord-messages"
  ( Proxy
      :: Proxy
           DiscordMessages_
  )
  empty

discordMessage
  :: Array (Attribute DiscordMessage_)
  -> Array Nut
  -> Nut
discordMessage = unsafeCustomElement "discord-message"
  ( Proxy
      :: Proxy
           DiscordMessage_
  )

app :: ExampleSignature
app runExample = runExample do
  discordMessages
    [ discordMessage
        [ Author := "beluga"
        , Avatar := belugaURL
        ]
        [ text "mom" ]
    , discordMessage
        [ Author := "belu-mom🌸"
        , Avatar := beluMomURL
        ]
        [ text "yes beluga" ]
    , discordMessage
        [ Author := "beluga"
        , Avatar := belugaURL
        ]
        [ text "whos my dad?" ]
    , discordMessage
        [ Author := "belu-mom🌸"
        , Avatar := beluMomURL
        ]
        [ text "it's complicated..." ]
    ]