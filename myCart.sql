CREATE OR REPLACE VIEW myCart AS
SELECT
    cart.*,
    items.*,
    user.user_id
FROM
    cart
    INNER JOIN user ON user.user_id = cart.cart_userid
    INNER JOIN items ON items.items_id = cart.cart_itemsid
WHERE
    cart.cart_order = 0;