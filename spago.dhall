{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "precisedatetime-utils"
, dependencies =
  [ --{--"aff"
    "argonaut"
  , "argonaut-codecs"
  , "effect"
  , "either"
  , "formatters"
  , "lists"
  , "maybe"
  , "newtype"
  , "now"
  , "partial"
  , "precise-datetime"
  , "prelude"
  , "psci-support"
  -- , "spec"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
