CREATE OR REPLACE VIEW items_top_selling AS
SELECT COUNT(cart_id) as count_item ,cart.* , items.* FROM cart 
INNER JOIN items ON items.items_id = cart.cart_itemsid
WHERE cart_order!=0
GROUP By cart_itemsid