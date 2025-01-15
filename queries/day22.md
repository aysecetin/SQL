## DAY 22

## Problem
You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

column | type
-------|---------
N      |Integer
P      |Integer

Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.

**Sample Output**

1 Leaf  
2 Inner  
3 Leaf  
5 Root  
6 Leaf  
8 Inner  
9 Leaf  


## solution 
```mysql
SELECT 
    N,
    CASE
        WHEN P IS NULL THEN 'Root'                        -- A node with no parent is the root
        WHEN N NOT IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL) THEN 'Leaf' 
                                                          -- A node that is not a parent to any other node is a leaf
        ELSE 'Inner'                                      -- All other nodes are inner nodes
    END AS NodeType
FROM BST
ORDER BY N;
```
