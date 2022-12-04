let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.4-20221030/packages.dhall
        sha256:19a962fbb4c04111c06bbb03b5ed58412dcb3beccbfd59ace970b73fdbaea20d

in  upstream
with hyrule =
    { dependencies =
      [ "st", "js-timers", "unsafe-reference"
      ]
    , repo = "https://github.com/mikesol/purescript-hyrule.git"
    , version = "v2.3.5"
    }
  with tidy =
    { dependencies =
      [ "maybe"
      ]
    , repo = "https://github.com/natefaubion/purescript-tidy.git"
    , version = "v0.9.0"
    }
  with tidy-codegen =
    { dependencies =
      [ "language-cst-parser", "tidy"
      ]
    , repo = "https://github.com/natefaubion/purescript-tidy-codegen.git"
    , version = "v3.0.0"
    }
  with pirates-charm =
    { dependencies =
      [ "hyrule"
      ]
    , repo = "https://github.com/mikesol/purescript-pirates-charm.git"
    , version = "v0.0.1"
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
      , "unsafe-coerce"
      , "web-dom"
      , "web-events"
      , "web-html"
      , "web-uievents"
      ]
    , repo = "https://github.com/mikesol/purescript-deku.git"
    , version = "main"
    }
