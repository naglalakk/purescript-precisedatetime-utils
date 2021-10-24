{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "precisedatetime-utils"
, dependencies =
  [ --{--"aff"
  , "effect"
  , "formatters"
  , "lists"
  , "now"
  , "precise-datetime"
  , "prelude"
  , "psci-support"
  -- , "spec"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
