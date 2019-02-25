-- Find last element in a list


module Main exposing (myButLast, myLast)


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
-- Find the number of elements of a list
-- Reverse a list
-- Find out whether a list is a palindrome
-- Eliminate consecutive duplicates of string elements
-- Drop every N'th element from a string
-- Insert the 👏 emoji between words
