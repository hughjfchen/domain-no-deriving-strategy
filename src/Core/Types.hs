{-# LANGUAGE NoDerivingStrategies #-}
{-# OPTIONS_GHC -Wno-type-equality-requires-operators #-}
--{-# OPTIONS_GHC -Wno-missing-deriving-strategies #-}
module Core.Types
  (SystemInfo(..),
   LoginReq(..),
   ClientLocale(..),
   SettingsReq(..),
   Amount(..),
   defaultSystemInfo
  )
where

import Domain
import DomainAeson

declare
  (Just (False, False))
  (eqDeriver <> showDeriver <> genericDeriver <> toJsonDeriver <> fromJsonDeriver)
  [schema|
  SystemInfo:
    product:
      appName: Text
      appVersion: Text
      userAgent: Text
      platform: Text
      navigatorLanguage: '[Text]'
      selectedLanguage: Text
      textDirection: Text
      advancedTraderAppVersion: Text

  LoginReq:
    product:
      systemInformation: Text

  ClientLocale:
    product:
      locale: Text
      language: Text

  SettingsReq:
    product:
      clientLocale: ClientLocale

  Amount:
    product:
      amount: Natural

  |]

defaultSystemInfo :: SystemInfo
defaultSystemInfo =
  SystemInfo
    { appName = "Netscape",
      appVersion = "5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36",
      userAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36",
      platform = "MacIntel",
      navigatorLanguage = ["en-US"],
      selectedLanguage = "en-GB",
      textDirection = "ltr",
      advancedTraderAppVersion = "6.1.2"
    }
