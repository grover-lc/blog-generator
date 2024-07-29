-- hello.hs

import Html

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
