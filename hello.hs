-- hello.hs

main :: IO ()
main = putStrLn (render myhtml)

myhtml :: Html
myhtml = 
    html_
        "Hello title"
        ( append_
            (h1_ "G'day!")
            ( append_
                (p_ "I am learning Haskell.")
                (p_ "I suppose I am also learning some HTML.")
            )
        )

newtype Html = Html String

newtype Structure = Structure String

type Title = String

html_ :: Title -> Structure -> Html
html_ title content =
    Html (
        el "html" (
            (el "head" (el "title" title))
            <> el "body" (getStructureString content)
        )
    )

p_ :: String -> Structure
p_ = Structure . el "p"

h1_ :: String -> Structure
h1_ = Structure . el "h1"

el :: String -> String -> String
el tag content =
   "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

append_ :: Structure -> Structure -> Structure
append_ strc1 strc2 =
    Structure ( getStructureString strc1  <> getStructureString strc2)

getStructureString :: Structure -> String
getStructureString content =
    case content of
        Structure str -> str

render :: Html -> String
render html =
    case html of
        Html str -> str
