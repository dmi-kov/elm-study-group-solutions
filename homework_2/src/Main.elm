module Main exposing (convert, convert03, deleteMaybe)

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



-- Filter elements with non-empty name and email
-- > convert02 [{name=Just "John", email=Just "john@gmail.com"}]
-- > [{name="John", email="john@gmail.com"}]


convert02 :
    List { name : Maybe String, email : Maybe String }
    -> List { name : String, email : String }



-- Fill in missing emails with <unspecified>, while removing elements with no name
-- > convert03 [{name=Just "John", email=Nothing}]
-- > [{name="John", email="<unspecified>"}]


convert03 :
    List { name : Maybe String, email : Maybe String }
    -> List { name : String, email : String }
convert03 list =
    deleteMaybe
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


deleteMaybe xs =
    case xs of
        [] ->
            []

        y :: ys ->
            case y of
                Just a ->
                    a :: deleteMaybe ys

                Nothing ->
                    deleteMaybe ys
