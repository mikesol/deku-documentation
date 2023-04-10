let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.7-20230227/packages.dhall
        sha256:0168e165b4cdb40ab6f7e01448075680097791c8d98f96d684b20d1eef96f3d0

in  upstream
  with bolson =
    { dependencies =
      [ "hyrule"
      ]
    , repo = "https://github.com/mikesol/purescript-bolson.git"
    , version = "main"
    }
  with deku =
    { dependencies =
      [ "bolson", "stringutils", "css", "free", "fast-vect"
      ]
    , repo = "https://github.com/mikesol/purescript-deku.git"
    , version = "main"
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