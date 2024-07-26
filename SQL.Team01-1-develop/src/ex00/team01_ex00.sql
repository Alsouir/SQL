SELECT 
 COALESCE("user".name, 'not defined') AS name,
 COALESCE("user".lastname, 'not defined') AS lastname,
 balance.type,
 SUM(balance.money) AS volume,
 COALESCE(new_currency.name, 'not defined')  AS currency_name,
 COALESCE(new_currency.rate_to_usd, 1) AS last_rate_to_usd,
 SUM(balance.money) * COALESCE(new_currency.rate_to_usd, 1) AS total_volume_in_usd
FROM balance
LEFT JOIN currency ON currency.id = balance.currency_id AND currency.updated = balance.updated
LEFT JOIN "user" ON "user".id = balance.user_id
LEFT JOIN (SELECT currency.*  FROM currency
           RIGHT JOIN (SELECT id, MAX(updated) AS updated FROM currency
           GROUP BY id) AS new_currency1
     ON currency.id = new_currency1.id AND currency.updated = new_currency1.updated) AS new_currency
ON new_currency.id = balance.currency_id
GROUP BY "user".id, type, currency_id, new_currency.name, new_currency.rate_to_usd
ORDER BY name DESC, lastname ASC, type ASC;
