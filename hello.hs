-- hello.hs
-- currently on 3.4

main :: IO ()
main = putStrLn (render myhtml)

myhtml :: Html
myhtml = 
    html_
        "Hello title"
        (append_
            (el "h1" "G'day!")
            (el "p" "I am learning Haskell.")
        )

html_ :: Title -> Structure -> Html
html_ title content =
    Html (
        append_
            (Structure (el "head" (el "title" title)))
            content
    )

append_ :: Structure -> Structure -> Structure
append_ (Structure str1) (Structure str2) =
    Structure (str1 <> str2)

render :: Html -> String
render html =
    case html of
        Html str -> str

el :: String -> String -> String
el tag content =
   "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

type Title = String
newtype Html = Html String
newtype Structure = Structure String

