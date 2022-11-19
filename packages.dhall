let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.4-20221030/packages.dhall
        sha256:19a962fbb4c04111c06bbb03b5ed58412dcb3beccbfd59ace970b73fdbaea20d

in  upstream
with hyrule =
    { dependencies =
      [ "st"
      ]
    , repo = "https://github.com/mikesol/purescript-hyrule.git"
    , version = "v2.3.3"
    }
  with deku =
    { dependencies =
      [ "aff"
      , "arrays"
      , "bolson"
      , "catenable-lists"
      , "control"
      , "effect"
      , "either"
      , "fast-vect"
      , "filterable"
      , "foldable-traversable"
      , "foreign-object"
      , "hyrule"
      , "maybe"
      , "newtype"
      , "ordered-collections"
      , "prelude"
      , "profunctor"
      , "quickcheck"
      , "record"
      , "safe-coerce"
      , "st"
      , "strings"
      , "transformers"
      , "tuples"
      , "js-timers"
      , "unsafe-coerce"
      , "web-dom"
      , "web-events"
      , "web-html"
      , "web-uievents"
      , "unsafe-reference"
      ]
    , repo = "https://github.com/mikesol/purescript-deku.git"
    , version = "main"
    }
