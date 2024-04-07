CREATE OR REPLACE VIEW orderdetailsview AS
SELECT
    cart.*,
    items.*,
    orderview.*
FROM
    cart
    INNER JOIN items ON items.items_id = cart.cart_itemsid
    INNER JOIN  orderview ON orderview.orders_id=cart.cart_order
WHERE
    cart.cart_order != 0;