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
  , "arrays"
  , "console"
  , "control"
  , "css"
  , "debug"
  , "deku"
  , "dodo-printer"
  , "effect"
  , "either"
  , "fetch"
  , "filterable"
  , "foldable-traversable"
  , "foreign"
  , "functions"
  , "hyrule"
  , "identity"
  , "integers"
  , "js-date"
  , "language-cst-parser"
  , "lists"
  , "maybe"
  , "newtype"
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
  , "string-parsers"
  , "strings"
  , "strings-extra"
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
