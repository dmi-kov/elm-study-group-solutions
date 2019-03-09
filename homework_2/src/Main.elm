module Main exposing (convert, convert03, catMaybes)

-- Map one structure to another
-- > convert [{name="John", email="john@gmail.com", phone_number="+3801234567"}]
-- > [{name="John", email="john@gmail.com"}]


convert :
    List { name : String, email : String, phone_number : String }
    -> List { name : String, email : String }
convert list =
    let
        fun el =
            { name = el.name, email = el.email }
    in
    List.map fun list


-- Fill in missing emails with <unspecified>, while removing elements with no name
-- > convert03 [{name=Just "John", email=Nothing}]
-- > [{name="John", email="<unspecified>"}]


convert03 :
    List { name : Maybe String, email : Maybe String }
    -> List { name : String, email : String }
convert03 list =
    catMaybes
        (List.map
            (\x ->
                Maybe.map
                    (\n ->
                        { name = n
                        , email = Maybe.withDefault "<unspecified>" x.email
                        }
                    )
                    x.name
            )
            list
        )
-- catMaybes : List (Maybe a) -> List a
-- catMaybes = Debug.todo ""

-- > catMaybes [Just 1, Nothing, Just 3]
-- [1,3] : List number

catMaybes : List (Maybe a) -> List a
catMaybes xs =
    case xs of
        [] ->
            []

        y :: ys ->
            case y of
                Just a ->
                    a :: catMaybes ys

                Nothing ->
                    catMaybes ys



-- Rewrite bird using <|, then using |> instead of parens (where applicable)
-- bird : Int
-- bird : Int
-- bird =
--     let
--         notThree x =
--             x /= 3
--         incr x =
--             x + 1
--     in
--     List.sum (List.filter notThree (List.map incr [ 1, 2, 3 ]))


bird2 : Int
bird2 =
    let
        notThree x =
            x /= 3

        incr x =
            x + 1
    in
    List.sum <|
        List.filter notThree <|
            List.map incr <|
                [ 1, 2, 3 ]


bird3 : Int
bird3 =
    let
        notThree x =
            x /= 3

        incr x =
            x + 1
    in
    [ 1, 2, 3 ]
        |> List.map incr
        |> List.filter notThree
        |> List.sum
