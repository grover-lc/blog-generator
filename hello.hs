-- hello.hs

main :: IO ()
main = putStrLn myhtml

myhtml :: Html
myhtml = 
    makeHtml
        "Hello title"
        (
            h1_ "Hello, world!" <>
            p_ "I am learning Haskell." <>
            p_ "I suppose I am learning HTML as well..."
        )

makeHtml :: Title -> Structure -> Html
makeHtml title content = html_ (head_ (title_ title) <> body_ content)

append_ :: Structure -> Structure -> Structure
append_ (Structure str1) (Structure str2) =
    Structure (str1 <> str2)

render :: Html -> String
render html =
    case html of
        Html str -> str

type Title = String
newtype Html = Html String
newtype Structure = Structure String

html_ :: String -> Html
html_ = Html . el "html"

body_ :: String -> Structure
body_ = Structure . el "body"

head_ :: String -> Structure
head_ = Structure . el "head"

title_ :: String -> Title
title_ = el "title"

p_ :: String -> Structure
p_ = Structure . el "p"

h1_ :: String -> Structure
h1_ = Structure . el "h1"

el :: String -> String -> String
el tag content =
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"
