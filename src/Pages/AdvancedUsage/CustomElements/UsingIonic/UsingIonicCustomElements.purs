module Pages.AdvancedUsage.CustomElements.UsingIonic.UsingIonicCustomElements where

import Prelude

import Assets (beluMomURL, belugaURL)
import Components.Code (psCodeNoCollapseWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Control.Plus (empty)
import Deku.Attribute (class Attr, Attribute, AttributeValue(..), unsafeAttribute, (!:=))
import Deku.Attributes (style_)
import Deku.Control (text_)
import Deku.Core (Domable)
import Deku.DOM (unsafeCustomElement)
import Deku.DOM as D
import Examples as Examples
import FRP.Event (Event)
import QualifiedDo.Alt as Alt
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
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
discordMessages = unsafeCustomElement "discord-messages"
  ( Proxy
      :: Proxy
           DiscordMessages_
  )
  empty

discordMessage
  :: forall lock payload
   . Event (Attribute DiscordMessage_)
  -> Array (Domable lock payload)
  -> Domable lock payload
discordMessage = unsafeCustomElement "discord-message"
  ( Proxy
      :: Proxy
           DiscordMessage_
  )

usingIonicCustomElements :: forall lock payload. Subsection lock payload
usingIonicCustomElements = subsection
  { title: "Using our custom elements"
  , matter: pure
      [ D.p_
          [ text_
              "We can define our Discord elements the same way we defined our custom anchor element above."
          ]
      , psCodeNoCollapseWithLink Examples.MockDiscord
      , exampleBlockquote
          [ D.div (style_ "all:revert;")
              [ discordMessages
                  [ discordMessage
                      Alt.do
                        Author !:= "beluga"
                        Avatar !:= belugaURL
                      [ text_ "mom" ]
                  , discordMessage
                      Alt.do
                        Author !:= "belu-mom🌸"
                        Avatar !:= beluMomURL
                      [ text_ "yes beluga" ]
                  , discordMessage
                      Alt.do
                        Author !:= "beluga"
                        Avatar !:= belugaURL
                      [ text_ "whos my dad?" ]
                  , discordMessage
                      Alt.do
                        Author !:= "belu-mom🌸"
                        Avatar !:= beluMomURL
                      [ text_ "it's complicated..." ]
                  ]
              ]
          ]
      ]
  }
