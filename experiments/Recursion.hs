-- Recursion.hs

myReplicate :: Int -> a -> [a]
myReplicate n x =
    if n <= 0
        then []
        else x : myReplicate (n-1) x

isEven :: Int -> Bool
isEven n =
    if n == 0
        then True
        else
            if n > 0
                then isOdd (n-1)
                else isOdd (n+1)

isOdd :: Int -> Bool
isOdd n =
    if n == 0
        then False
            else
                if n > 0
                    then isEven (n-1)
                    else isEven (n+1)
