USE lesson4;

/*
Используя JOIN-ы, выполните следующие операции:
1.Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
2.Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
3.Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”

Табличка (после слов “Последнее задание, таблица:”)
4.Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
Есть таблица анализов Analysis:
*/

-- 1
SELECT name, shopname FROM cats
JOIN shops ON shops.id = cats.shops_id;

-- 2
SELECT shopname FROM shops
JOIN cats ON shops.id = cats.shops_id
WHERE cats.name = "Murzik";

SELECT shopname FROM shops, cats
WHERE shops.id = cats.shops_id AND cats.name = "Murzik";

-- 3
SELECT shopname FROM shops
JOIN cats ON shops.id = cats.shops_id
WHERE cats.name NOT IN ("Murzik", "Zuza");

-- 4
SELECT an_name, an_price 
FROM analysis
JOIN orders ON orders.ord_an = analysis.an_id
WHERE DATE(orders.ord_datetime) BETWEEN "2020-02-05" AND "2020-02-12";
