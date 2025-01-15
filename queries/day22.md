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
