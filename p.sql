CREATE
OR REPLACE VIEW myFavourite AS
SELECT
    favourite.*,
    items.*,
    user.user_id
FROM
    favourite
    INNER JOIN user ON user.user_id = favourite.favourite_usersid
    INNER JOIN items ON items.items_id = favourite.favourite_itemsid