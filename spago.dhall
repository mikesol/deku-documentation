{-
Welcome to a Spago project!
You can edit this file as you like.

Need help? See the following resources:
- Spago documentation: https://github.com/purescript/spago
- Dhall language tour: https://docs.dhall-lang.org/tutorials/Language-Tour.html

When creating a new Spago project, you can use
`spago init --no-comments` or `spago init -C`
to generate this file without the comments in this block.
-}
{ name = "my-project"
, dependencies =
  [ "aff"
  , "affjax"
  , "affjax-web"
  , "argonaut-core"
  , "arrays"
  , "console"
  , "control"
  , "css"
  , "datetime"
  , "debug"
  , "deku"
  , "dodo-printer"
  , "effect"
  , "either"
  , "exceptions"
  , "fetch"
  , "filterable"
  , "foldable-traversable"
  , "foreign"
  , "free"
  , "functions"
  , "hyrule"
  , "identity"
  , "integers"
  , "js-date"
  , "js-timers"
  , "language-cst-parser"
  , "lists"
  , "maybe"
  , "newtype"
  , "numbers"
  , "ordered-collections"
  , "partial"
  , "pirates-charm"
  , "prelude"
  , "profunctor-lenses"
  , "qualified-do"
  , "random"
  , "record"
  , "refs"
  , "routing"
  , "routing-duplex"
  , "st"
  , "string-parsers"
  , "strings"
  , "strings-extra"
  , "stringutils"
  , "tidy"
  , "tidy-codegen"
  , "transformers"
  , "tuples"
  , "web-dom"
  , "web-events"
  , "web-html"
  , "web-uievents"
  , "yoga-fetch"
  , "yoga-json"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
