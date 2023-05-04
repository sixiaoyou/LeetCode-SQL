'''
[LeetCode-2480. Form a Chemical Bond]
Table: Elements

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| symbol      | varchar |
| type        | enum    |
| electrons   | int     |
+-------------+---------+
symbol is the primary key for this table.
Each row of this table contains information of one element.
type is an ENUM of type ('Metal', 'Nonmetal', 'Noble')
 - If type is Noble, electrons is 0.
 - If type is Metal, electrons is the number of electrons that one atom of this element can give.
 - If type is Nonmetal, electrons is the number of electrons that one atom of this element needs.


Two elements can form a bond if one of them is 'Metal' and the other is 'Nonmetal'.

Write an SQL query to find all the pairs of elements that can form a bond.

Return the result table in any order.

The query result format is in the following example.



Example 1:

Input:
Elements table:
+--------+----------+-----------+
| symbol | type     | electrons |
+--------+----------+-----------+
| He     | Noble    | 0         |
| Na     | Metal    | 1         |
| Ca     | Metal    | 2         |
| La     | Metal    | 3         |
| Cl     | Nonmetal | 1         |
| O      | Nonmetal | 2         |
| N      | Nonmetal | 3         |
+--------+----------+-----------+
Output:
+-------+----------+
| metal | nonmetal |
+-------+----------+
| La    | Cl       |
| Ca    | Cl       |
| Na    | Cl       |
| La    | O        |
| Ca    | O        |
| Na    | O        |
| La    | N        |
| Ca    | N        |
| Na    | N        |
+-------+----------+
Explanation:
Metal elements are La, Ca, and Na.
Nonmeal elements are Cl, O, and N.
Each Metal element pairs with a Nonmetal element in the output table.
'''

��Solution��

��First��
select e1.symbol as metal, e2.symbol as nonmetal from Elements e1 cross join Elements e2 where e1.type = 'Metal' and e2.type = 'Nonmetal';

��Second��
select e1.symbol metal, e2.symbol nonmetal
 from
 (select symbol from Elements e1 where e1.type = 'Metal') e1,
 (select symbol from Elements e2 where e2.type = 'Nonmetal') e2 ;