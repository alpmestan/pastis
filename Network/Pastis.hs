module Network.Pastis (pastisURL) where

import Network.HTTP
import Network.URI

-- | Use pastisURL to shorten a URL. If an error occurs, the function returns 'url'.
pastisURL :: String -> IO String
pastisURL url = fmap (either (const url) rspBody) (simpleHTTP request) `catch` (return . const url)
  where request = Request { rqURI = uri
                          , rqMethod = GET
                          , rqHeaders = []
                          , rqBody = "" }
        uri = URI { uriScheme = "http:"
                  , uriAuthority = Just $ URIAuth { uriUserInfo = "", uriRegName = "past.is", uriPort = "" }
                  , uriPath = "/api/"
                  , uriQuery = "?format=simple&url=" ++ escapeURIString isUnreserved url
                  , uriFragment = "" }