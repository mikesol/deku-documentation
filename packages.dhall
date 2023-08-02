let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.7-20230227/packages.dhall
        sha256:0168e165b4cdb40ab6f7e01448075680097791c8d98f96d684b20d1eef96f3d0

in  upstream
  with hyrule =
    { dependencies =
      [ "ordered-collections"
      , "unsafe-reference"
      , "js-timers"
      , "web-uievents"
      ]
    , repo = "https://github.com/mikesol/purescript-hyrule.git"
    , version = "fantasy-land"
    }
  with bolson =
    { dependencies =
      [ "hyrule"
      , "fast-vect"
      ]
    , repo = "https://github.com/mikesol/purescript-bolson.git"
    , version = "fantasy-land"
    }
  with deku =
    { dependencies =
      [ "web-uievents", "bolson"
      ]
    , repo = "https://github.com/mikesol/purescript-deku.git"
    , version = "fantasy-land"
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