# BD: Guião 8


## ​8.1. Complete a seguinte tabela.
Complete the following table.

| #    | Query                                                                                                      | Rows   | Cost    | Pag. Reads | Time (ms) | Index used             | Index Op.            | Discussion |
| :--- | :--------------------------------------------------------------------------------------------------------- | :----- | :------ | :--------- | :-------- | :--------------------- | :------------------- | :--------- |
| 1    | SELECT * from Production.WorkOrder                                                                         | 72591  |  0.484  |     531    |    1171   | …                      | Clustered Index Scan |            |
| 2    | SELECT * from Production.WorkOrder where WorkOrderID=1234                                                  |        |         |            |           |                        |                      |            |
| 3.1  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 10000 and 10010                               | 11     |0.0032952|     26     |     0     |PK_WorkOrder_WorkOrderID| Clustered Index Seek |            |
| 3.2  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 1 and 72591                                   | 72591  |0.473502 |     556    |     16    |PK_WorkOrder_WorkOrderID| Clustered Index Seek |            |
| 4    | SELECT * FROM Production.WorkOrder WHERE StartDate = '2007-06-25'                                          |        |         |            |           |                        |                      |            |
| 5    | SELECT * FROM Production.WorkOrder WHERE ProductID = 757                                                   |        |         |            |           |                        |                      |            |
| 6.1  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 757                              |        |         |            |           |                        |                      |            |
| 6.2  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945                              |        |         |            |           |                        |                      |            |
| 6.3  | SELECT WorkOrderID FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04'            |        |         |            |           |                        |                      |            |
| 7    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04' |        |         |            |           |                        |                      |            |
| 8    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04' |        |         |            |           |                        |                      |            |

## ​8.2.

### a)

```
... Write here your answer ...
ALTER TABLE mytemp ADD CONSTRAINT PK_RID PRIMARY KEY CLUSTERED (rid)
```

### b)

```
... Write here your answer ...
Inserted      50000 total records
Milliseconds used: 91746
```

### c)

```
... Write here your answer ...
```

### d)

```
... Write here your answer ...
```

### e)

```
... Write here your answer ...
```

## ​8.3.

```
... Write here your answer ...
```
