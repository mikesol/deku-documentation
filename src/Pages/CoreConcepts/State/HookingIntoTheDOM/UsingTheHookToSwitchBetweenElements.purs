module Pages.CoreConcepts.State.HookingIntoTheDOM.UsingTheHookToSwitchBetweenElements where

import Prelude

import Components.Code (psCodeNoCollapseWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Foldable (oneOf)
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text_, (<#~>))
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Examples as Examples
import QualifiedDo.Alt as Alt

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """mr-4 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

data Element = Image | Video | SVG

bunny :: String
bunny = "https://dl8.webmfiles.org/big-buck-bunny_trailer.webm"

-- bg-amber-600
-- hover:bg-amber-700 
-- focus:ring-amber-500
-- bg-cyan-600
-- hover:bg-cyan-700 
-- focus:ring-cyan-500
-- bg-green-600
-- hover:bg-green-700 
-- focus:ring-green-500
usingTheHookToSwitchBetweenElements
  :: forall lock payload. Subsection lock payload
usingTheHookToSwitchBetweenElements = subsection
  { title: "Using a hook to switch between elements"
  , matter: pure
      [ D.p_
          [ text_
              "You can also use a hook to switch between elements. This is particularly useful for tabbed navigation. In the example below, a hook is used to switch between an image, a video, and an SVG. This is accomplished via the "
          , D.code__ "<#~>"
          , text_ " operator."
          ]
      , psCodeNoCollapseWithLink Examples.UsingTheHookToSwitchBetweenElements
      , exampleBlockquote
          [ Deku.do
              setImageType /\ imageType <- useState Image
              D.div_
                [ D.div_
                    [ imageType <#~>
                        case _ of
                          Image -> D.img (D.Src !:= "https://picsum.photos/150")
                            []
                          Video -> D.video
                            ( oneOf
                                [ D.Controls !:= "controls"
                                , D.Preload !:= "none"
                                , D.Width !:= "250"
                                , D.Height !:= "250"
                                , D.Autoplay !:= "true"
                                ]
                            )
                            [ D.source
                                ( oneOf
                                    [ D.Src !:= bunny
                                    , D.Xtype !:= "video/webm"
                                    ]
                                )
                                []
                            ]
                          SVG -> D.svg
                            ( oneOf
                                [ D.Height !:= "170"
                                , D.Width !:= "170"
                                ]
                            )
                            [ D.circle
                                Alt.do
                                  D.Cx !:= "75"
                                  D.Cy !:= "75"
                                  D.R !:= "70"
                                  D.Stroke !:= "black"
                                  D.StrokeWidth !:= "3"
                                  D.Fill !:= "red"
                                []
                            ]
                    ]
                , D.div_
                    [ D.button
                        Alt.do
                          klass_ $ buttonClass "amber"
                          click_ $ setImageType Image
                        [ text_ "Image" ]
                    , D.button
                        Alt.do
                          klass_ $ buttonClass "cyan"
                          click_ $ setImageType Video
                        [ text_ "Video" ]
                    , D.button
                        Alt.do
                          klass_ $ buttonClass "green"
                          click_ $ setImageType SVG
                        [ text_ "SVG" ]
                    ]
                ]
          ]
      , D.p_
          [ text_
              "If your DOM is mostly static and has a few switching elements within it, consider using multiple "
          , D.code__ "<#~>"
          , text_ " operators instead of one global "
          , D.code__ "<#~>"
          , text_ ", as it will generally result in better performance."
          ]
      ]
  }
