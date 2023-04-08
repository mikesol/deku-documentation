module Examples.MockDiscord where

import Prelude

import Assets (beluMomURL, belugaURL)
import Control.Plus (empty)
import Deku.Attribute (class Attr, Attribute, AttributeValue(..), unsafeAttribute, (!:=))
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM (unsafeCustomElement)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event)
import Type.Proxy (Proxy(..))

data DiscordMessages_
data DiscordMessage_
data Author = Author
data Avatar = Avatar
data RoleColor = RoleColor

instance Attr DiscordMessage_ Author String where
  attr _ s = unsafeAttribute
    { key: "author", value: Prop' s }

instance Attr DiscordMessage_ Avatar String where
  attr _ s = unsafeAttribute
    { key: "avatar", value: Prop' s }

instance Attr DiscordMessage_ RoleColor String where
  attr _ s = unsafeAttribute
    { key: "role-color", value: Prop' s }

discordMessages
  :: Array (Nut)
  -> Nut
discordMessages = unsafeCustomElement "discord-messages"
  ( Proxy
      :: Proxy
           DiscordMessages_
  )
  empty

discordMessage
  :: Array (Event (Attribute DiscordMessage_))
  -> Array (Nut)
  -> Nut
discordMessage = unsafeCustomElement "discord-message"
  ( Proxy
      :: Proxy
           DiscordMessage_
  )

main ∷ Effect Unit
main = runInBody do
  discordMessages
    [ discordMessage
        [ Author !:= "beluga"
        , Avatar !:= belugaURL
        ]
        [ text_ "mom" ]
    , discordMessage
        [ Author !:= "belu-mom🌸"
        , Avatar !:= beluMomURL
        ]
        [ text_ "yes beluga" ]
    , discordMessage
        [ Author !:= "beluga"
        , Avatar !:= belugaURL
        ]
        [ text_ "whos my dad?" ]
    , discordMessage
        [ Author !:= "belu-mom🌸"
        , Avatar !:= beluMomURL
        ]
        [ text_ "it's complicated..." ]
    ]