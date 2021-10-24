module Data.PreciseDateTime.Utils where

import Prelude

import Data.Formatter.DateTime (Formatter, FormatterCommand(..), format)
import Data.List (fromFoldable)
import Data.PreciseDateTime as PDT
import Effect (Effect)
import Effect.Now (nowDateTime)

-- | Get current PreciseDateTime
nowPreciseDateTime :: Effect PDT.PreciseDateTime
nowPreciseDateTime = do
  now <- nowDateTime
  pure $ PDT.fromDateTime now

-- | format: d.m.YY
dateFormatter :: Formatter
dateFormatter 
  = fromFoldable 
    [ DayOfMonthTwoDigits
    , Placeholder "."
    , MonthTwoDigits
    , Placeholder "."
    , YearTwoDigits
    ]

-- | format: YYYY-m-d:HH:MM.SS.000Z
dateTimeFormatter :: Formatter
dateTimeFormatter
  = fromFoldable
    [ YearFull
    , Placeholder "-"
    , MonthTwoDigits
    , Placeholder "-"
    , DayOfMonthTwoDigits
    , Placeholder "T"
    , Hours24
    , Placeholder ":"
    , MinutesTwoDigits
    , Placeholder ":"
    , SecondsTwoDigits
    , Placeholder "."
    , Milliseconds
    , Placeholder "Z"
    ]

-- format: d.m.YYYY HH:MM:SS
dateTimeShortFormatter :: Formatter
dateTimeShortFormatter 
  = fromFoldable
    [ DayOfMonthTwoDigits
    , Placeholder "."
    , MonthTwoDigits
    , Placeholder "."
    , YearFull
    , Placeholder " "
    , Hours24
    , Placeholder ":"
    , MinutesTwoDigits
    , Placeholder ":"
    , SecondsTwoDigits 
    ]

-- PDT to date string
formatToDateStr :: PDT.PreciseDateTime -> String
formatToDateStr (PDT.PreciseDateTime dt nan)
  = format dateFormatter dt

-- | PDT to dateTimeShort string
formatToDateTimeShortStr :: PDT.PreciseDateTime -> String
formatToDateTimeShortStr (PDT.PreciseDateTime dt nan)
  = format dateTimeShortFormatter dt

-- | PDT to dateTime string
formatToDateTimeStr :: PDT.PreciseDateTime -> String
formatToDateTimeStr (PDT.PreciseDateTime dt nan)
  = format dateTimeFormatter dt
