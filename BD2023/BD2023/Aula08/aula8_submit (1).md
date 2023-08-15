# BD: Guião 8


## ​8.1. Complete a seguinte tabela.
Complete the following table.

| #    | Query                                                                                                      | Rows  | Cost     | Pag. Reads | Time (ms)    | Index used                        | Index Op.            | Discussion |
| :--- | :--------------------------------------------------------------------------------------------------------- | :---- | :----    | :--------- | :--------    | :---------                        | :------------------- | :--------- |
| 1    | SELECT * from Production.WorkOrder                                                                         | 72591 | 0.484    | 531        | 1171         | PK_WorkOrder_WorkOrderID          | Clustered Index Scan |            |
| 2    | SELECT * from Production.WorkOrder where WorkOrderID=1234                                                  | 1     | 0.00328  | 26         | 0.000        | PK_WorkOrder_WorkOrderID          | Clustered Index Seek |            |
| 3.1  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 10000 and 10010                               | 11    | 0.00329  | 220        | 1        | PK_WorkOrder_WorkOrderID          |Clustered Index Seek  |            |
| 3.2  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 1 and 72591                                   | 72591    | 0.473         |   750         |  3.3            |  PK_WorkOrder_WorkOrderID     |   Clustered Index Seek  |            |
| 4    | SELECT * FROM Production.WorkOrder WHERE StartDate = '2012-05-14'                                          | 55    | 0.393    | 556        |  9           | PK_WorkOrder_WorkOrderID          |  Clustered Index Scan|            |
| 5    | SELECT * FROM Production.WorkOrder WHERE ProductID = 757                                                   | 9     | 0.034    |  46        | 1             | PK_WorkOrder_WorkOrderID   |  Key Lookup Clustered    |            |
| 6.1  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 757                              | 9      | 0.0032   |  240          |   0.000           |IX_WorkeOrder_ProductId  |  Index Seek NonClustered    |            |
| 6.2  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945                              | 1105       |   0.004735       |   750         |   10           | IX_WorkeOrder_ProductId  |  Index Seek NonClustered     |            |
| 6.3  | SELECT WorkOrderID FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate =3ef                      |  1     |   0.00735       |   752        |     0.000        |  IX_WorkeOrder_ProductId  |  Index Seek NonClustered     |            |
| 7    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04' |  1     |    0.0073      |    558        |      0.000        |  IX_WorkeOrder_ProductId  |  Index Seek NonClustered    |            |
| 8    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04' |   1     |    0.0073      |    752       |      0.000        |  IX_WorkeOrder_ProductId  |  Index Seek NonClustered    |             |

## ​8.2.

### a)

```
... Write here your answer ...
ALTER TABLE mytemp ADD CONSTRAINT PK_RID PRIMARY KEY CLUSTERED (rid)
```

### b)

```
... Write here your answer ...
Milliseconds used: 91746
fragmentação dos indices: 99,54%
ocupação das paginas: 71,20%
```

### c)

```
... Write here your answer ...
fillfactor=65
Milliseconds used: 112765
fragmentação dos indices: 99,54%
ocupação das paginas: 71,20%

fillfactor=80
Milliseconds used: 122657
fragmentação dos indices: 99,15%
ocupação das paginas: 69,17%

fillfactor=90
Milliseconds used: 118483
fragmentação dos indices: 99,37%
ocupação das paginas: 69,98%
```

### d)

```
... Write here your answer ...
Milliseconds used: 120934
```

### e)

```
... Write here your answer ...
CREATE CLUSTERED INDEX idx_At1 ON mytemp(at1);
CREATE CLUSTERED INDEX idx__At2 ON mytemp(at2);
CREATE CLUSTERED INDEX Idx_At3_ ON mytemp(at3);
CREATE CLUSTERED INDEX Idx_Lixo ON mytemp(lixo)

Milliseconds used sem indices: 91684
Milliseconds used com indices: 96847
```

## ​8.3.

```
... Write here your answer ...
i)    Index Ssn on Employee(SSn)

ii)   Index FullName on Employee(Fname, Lname)

iii)  Index Dno on Employee(Dno)

iv) Index Pname on Project(Pname)

vi) Index Dnum on Project(Dnum)

v) Index Essn on Dependent(Essn)
```
