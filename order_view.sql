CREATE OR REPLACE VIEW orderview AS
SELECT
   orders.*,
   address.*
FROM
    orders
    LEFT JOIN address ON orders.orders_address = address.address_id
   