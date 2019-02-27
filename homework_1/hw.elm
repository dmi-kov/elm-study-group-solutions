-- Find last element in a list


module Main exposing (compress, dropEvery, elementAt, isPalindrome, myButLast, myLast, myLength, myReverse)


myLast : List a -> Maybe a
myLast list =
    case list of
        [] ->
            Nothing

        [ x ] ->
            Just x

        x :: xs ->
            myLast xs



-- Find the last but one element of a list


myButLast : List a -> Maybe a
myButLast list =
    case list of
        [] ->
            Nothing

        x :: [ _ ] ->
            Just x

        x :: xs ->
            myButLast xs



-- Find the K'th element of a list


elementAt : List a -> Int -> Maybe a
elementAt list el =
    case ( list, el ) of
        ( [], _ ) ->
            Nothing

        ( x :: _, 0 ) ->
            Just x

        ( _ :: xs, _ ) ->
            elementAt xs (el - 1)



-- Find the number of elements of a list


myLength : List a -> Int
myLength list =
    case list of
        [] ->
            0

        x :: xs ->
            myLength xs + 1



-- Reverse a list


myReverse : List a -> List a
myReverse list =
    case list of
        [] ->
            []

        x :: xs ->
            myReverse xs ++ [ x ]



-- Find out whether a list is a palindrome


isPalindrome : List a -> Bool
isPalindrome list =
    myReverse list == list



-- Eliminate consecutive duplicates of string elements


compress : String -> String
compress string =
    string
        |> String.toList
        |> compressList
        |> String.fromList


compressList : List comparable -> List comparable
compressList list =
    case list of
        x :: ((y :: _) as xs) ->
            if x == y then
                compressList xs

            else
                x :: compressList xs

        _ ->
            list



-- Drop every N'th element from a string


dropEvery : String -> String
dropEvery string =
    string
        |> String.toList
        |> dropEveryInList
        |> String.fromList


dropEveryInList : List a -> Int -> List a
dropEveryInList list n =
    if n <= 0 then
        list

    else
        List.append (List.take (n - 1) list) (List.drop n list)



-- Insert the 👏 emoji between words


clap : String -> String
clap string =
    string
        |> String.split " "
        |> String.join " 👏  "
