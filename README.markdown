# Past.is URL shortening service interface in Haskell

Pastis is a Haskell interface to the past.is URL shortening service, available at http://past.is/. 

# Usage

```haskell
do
  let url = "http://www.haskell.org/"
  shortenedURL <- pastisURL url
  putStrLn shortenedUrl
```

Feel free to contribute, may it be features, performance improvements, etc.

Author
------

This library is written and maintained by Alp Mestanogullari,
<alpmestan@gmail.com>