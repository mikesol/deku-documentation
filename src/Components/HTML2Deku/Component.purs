module Components.HTML2Deku.Component
  ( html2deku
  , toDeku
  ) where

import Prelude

import Components.HTML2Deku.HalogenParser (HtmlAttribute(..), HtmlNode(..))
import Components.HTML2Deku.HalogenParser as HalogenParser
import Components.HTML2Deku.Swal (swal)
import Components.HTML2Deku.Yarn (capitalize)
import Data.Array (intercalate, uncons)
import Data.Array as A
import Data.Compactable (compact)
import Data.Either (Either(..))
import Data.List (List(..))
import Data.Maybe (Maybe(..))
import Data.String (Pattern(..), Replacement(..), replaceAll, split, drop, take)
import Data.Tuple.Nested ((/\))
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.DOM.Self as Self
import Deku.Do as Deku
import Deku.Hooks (useState')
import Dodo (plainText, print, twoSpaces)
import Partial.Unsafe (unsafePartial)
import Tidy (FormatOptions, defaultFormatOptions, formatExpr, toDoc)
import Tidy.Codegen (binaryOp, exprApp, exprArray, exprCtor, exprIdent, exprOp, exprString)
import Web.HTML.HTMLTextAreaElement (setValue, value)

dekuizeU :: String -> String
dekuizeU = dekuize true

dekuizeL :: String -> String
dekuizeL = dekuize false

dekuize :: Boolean -> String -> String
dekuize ul i = o
  where
  splt = split (Pattern "-") i
  uc = uncons splt
  o = case uc of
    Nothing -> ""
    Just { head, tail } -> intercalate ""
      ([ (if ul then capitalize else identity) head ] <> map capitalize tail)

toDeku :: List HtmlNode -> String
toDeku l = print plainText
  twoSpaces
  ( toDoc
      ( formatExpr (defaultFormatOptions :: FormatOptions Void _)
          case l of
            Nil -> exprArray []
            Cons a Nil -> case go a of
              Just x -> x
              Nothing -> exprArray []
            _ -> unsafePartial $ exprApp (exprIdent "fixed")
              [ exprArray (compact (map go (A.fromFoldable l))) ]
      )
  )
  where
  go (HtmlElement { name, attributes, children }) = Just $ unsafePartial $
    exprApp
      ( exprIdent
          ( "D." <> dekuizeL name <> case attributes of
              Nil -> "_"
              _ -> ""
          )
      )
      ( ( let
            transAp (HtmlAttribute k' v) =
              if take 5 k' == "data-" then exprApp (exprIdent "pure")
                [ exprApp (exprIdent "xdata")
                    [ exprString $ drop 5 k', exprString v ]
                ]
              else
                let
                  k = if k' == "type" then "xtype" else k'
                in
                  exprOp
                    (exprCtor ("D." <> dekuizeU k))
                    [ binaryOp ":=" (exprString v) ]
          in
            case attributes of
              Nil -> []
              Cons ha Nil ->
                [ transAp ha ]
              _ ->
                [ exprApp (exprIdent "oneOf")
                    [ exprArray $ A.fromFoldable
                        ( map
                            transAp
                            attributes
                        )
                    ]
                ]
        ) <>
          [ exprArray (compact (map go (A.fromFoldable children))) ]
      )
  go (HtmlText str) =
    let
      nw = replaceAll (Pattern "\n") (Replacement "")
        (replaceAll (Pattern " ") (Replacement "") str)
    in
      if nw == "" then Nothing
      else Just
        (unsafePartial $ exprApp (exprIdent "text") [ exprString str ])
  go (HtmlComment _) = Nothing

initialTxt :: String
initialTxt =
  """<div>
  <button id="my-button" class="p-4">press me</button>
  <span class="text-slate:700">hello world!</span>
</div>"""

html2deku :: Nut
html2deku = Deku.do
  setPurs /\ purs <- useState'
  setInput /\ input <- useState'
  D.div_
    [ D.div_
        [ D.span [ DA.klass_ "text-xl" ] [ text_ "html2deku" ]
        , D.button
            [ DA.ariaLabel_ "Convert to Deku"
            , DA.klass_
                "ml-2 inline-flex items-center rounded border border-transparent bg-indigo-600 px-2.5 py-1.5 text-xs font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
            , DL.runOn DL.click $ input <#> \i -> do
                v <- value i
                let parsed = HalogenParser.parse v
                case parsed of
                  Left err -> swal { title: "Uh oh...", text: show err }
                  Right res -> setPurs (toDeku res)
            ]

            [ text_ "Convert >" ]
        ]
    , D.div_
        [ D.textarea
            [ DA.rows_ "6"
            , DA.klass_ "border-2 w-full"
            , Self.selfT_ setInput
            ]

            [ text_ initialTxt ]
        ]
    , D.div_
        [ D.textarea
            [ DA.rows_ "6"
            , DA.klass_ "border-2 w-full"
            , Self.selfT $ purs <#> setValue
            ]

            ( let
                parsed = HalogenParser.parse initialTxt
              in
                case parsed of
                  Left _ -> []
                  Right res -> [ text_ (toDeku res) ]
            )
        ]
    ]
