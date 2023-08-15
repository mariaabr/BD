# BD: Guião 6

## Problema 6.1

### *a)* Todos os tuplos da tabela autores (authors);

```
... Write here your answer ...
select * from authors
```

### *b)* O primeiro nome, o último nome e o telefone dos autores;

```
... Write here your answer 
select au_fname, au_lname, phone
from authors
```

### *c)* Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o último nome (ascendente); 

```
... Write here your answer ...
select au_fname, au_lname, phone
from authors
order by au_fname ASC, au_lname ASC
```

### *d)* Consulta definida em c) mas renomeando os atributos para (first_name, last_name, telephone); 

```
... Write here your answer ...
select au_fname as first_name, au_lname as last_name, phone as telephone
from authors
order by au_fname ASC, au_lname ASC
```

### *e)* Consulta definida em d) mas só os autores da Califórnia (CA) cujo último nome é diferente de ‘Ringer’; 

```
... Write here your answer ...
select au_fname as first_name, au_lname as last_name, phone as telephone, state
from authors
where state='CA' AND au_lname<>'Ringer'
order by au_fname ASC, au_lname ASC
```

### *f)* Todas as editoras (publishers) que tenham ‘Bo’ em qualquer parte do nome; 

```
... Write here your answer ...
select *
from publishers
where pub_name like '%Bo%'
```

### *g)* Nome das editoras que têm pelo menos uma publicação do tipo ‘Business’; 

```
... Write here your answer ...
select distinct titles.pub_id, pub_name
from titles
join publishers on titles.pub_id=publishers.pub_id
where type='Business'
```

### *h)* Número total de vendas de cada editora; 

```
... Write here your answer ...
select distinct publishers.pub_id, pub_name, sum(ytd_sales) as totalsalesperpub
from sales
join titles on sales.title_id=titles.title_id
join publishers on titles.pub_id=publishers.pub_id
group by publishers.pub_id, pub_name
```

### *i)* Número total de vendas de cada editora agrupado por título; 

```
... Write here your answer ...
select distinct titles.title_id, title, publishers.pub_id, pub_name, sum(qty) as totalsalesperpub
from sales
join titles on sales.title_id=titles.title_id
join publishers on titles.pub_id=publishers.pub_id
group by titles.title_id, title, publishers.pub_id, pub_name
```

### *j)* Nome dos títulos vendidos pela loja ‘Bookbeat’; 

```
... Write here your answer ...
select titles.title_id, title
from titles
join sales on titles.title_id=sales.title_id
join stores on sales.stor_id=stores.stor_id
where stores.stor_name='Bookbeat'
```

### *k)* Nome de autores que tenham publicações de tipos diferentes; 

```
... Write here your answer ...
select au_fname, au_lname, count(*) as tipos
from authors 
join titleauthor on authors.au_id=titleauthor.au_id
join titles on titleauthor.title_id=titles.title_id
group by au_fname, au_lname
having count(distinct titles.type) > 1
```

### *l)* Para os títulos, obter o preço médio e o número total de vendas agrupado por tipo (type) e editora (pub_id);

```
... Write here your answer ...
select avg(price) as precoMedio, sum(qty) as total
from titles
join sales on titles.title_id=sales.title_id
group by type, pub_id
```

### *m)* Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” (advance) é uma vez e meia superior à média do grupo (tipo);

```
... Write here your answer ...
select type
from titles
group by type
having max(advance) > 1.5*avg(advance)
```

### *n)* Obter, para cada título, nome dos autores e valor arrecadado por estes com a sua venda;

```
... Write here your answer ...
select title, au_fname, au_lname, price*royaltyper/100*royalty/100 as valVendas
from titles
join titleauthor on titles.title_id=titleauthor.title_id
join authors on titleauthor.au_id=authors.au_id

```

### *o)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, a faturação total, o valor da faturação relativa aos autores e o valor da faturação relativa à editora;

```
... Write here your answer ...
select title,ytd_sales, price*ytd_sales as faturacao, price*ytd_sales* royalty/100 as auths_revenue, price*ytd_sales*(100-royalty)/100 as publisher_revenue
from titles
order by title
```

### *p)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, o nome de cada autor, o valor da faturação de cada autor e o valor da faturação relativa à editora;

```
... Write here your answer ...
select title,ytd_sales, (au_fname + ' '+ au_lname) as author, price*ytd_sales* royalty/100 as auth_revenue, price*ytd_sales*(100-royalty)/100 as publisher_revenue
from titles
join titleauthor on titles.title_id=titleauthor.title_id
join authors on titleauthor.au_id=authors.au_id
order by title, author
```

### *q)* Lista de lojas que venderam pelo menos um exemplar de todos os livros;

```
... Write here your answer ...
select stores.stor_id, stor_name, count(title) as exm,  count(sales.title_id) as exmVendidos
from stores 
join sales on stores.stor_id = sales.stor_id
join titles on sales.title_id  = titles.title_id
group by stores.stor_id, stor_name 
having (count(title) = count(sales.title_id)) and count(title) > 1
```

### *r)* Lista de lojas que venderam mais livros do que a média de todas as lojas;

```
... Write here your answer ...
select stores.stor_id, stor_name, sum(qty) as vendaLoja
from stores 
join sales on stores.stor_id = sales.stor_id
join titles on sales.title_id  = titles.title_id
group by  stores.stor_id, stor_name
having sum(qty) > (
	(select sum(qty) 
	from ((stores 
	join sales on stores.stor_id=sales.stor_id) 
	join titles on sales.title_id=titles.title_id))/(
		select count( stor_name) 
		from stores))

```

### *s)* Nome dos títulos que nunca foram vendidos na loja “Bookbeat”;

```
... Write here your answer ...
select titles.title_id, titles.title, stores.stor_id, stores.stor_name
from titles
join sales on titles.title_id=sales.title_id
join stores on sales.stor_id=stores.stor_id
where stor_name<>'Bookbeat'
```

### *t)* Para cada editora, a lista de todas as lojas que nunca venderam títulos dessa editora; 

```
... Write here your answer ...
select publishers.pub_id, pub_name, stores.stor_id, stor_name
from publishers, stores
except
select publishers.pub_id, pub_name, stores.stor_id, stor_name
from publishers
join titles on publishers.pub_id=titles.pub_id
join sales on titles.title_id=sales.title_id
join stores on sales.stor_id=stores.stor_id
```

## Problema 6.2

### ​5.1

#### a) SQL DDL Script
 
```
Não temos servidor local, utilizamos o site da aula passada.
```

#### b) Data Insertion Script

```
Não temos servidor local, utilizamos o site da aula passada.
```

#### c) Queries

##### *a)*

```
... Write here your answer ...
select distinct Pname, Pnumber, Fname, Minit, Lname, Ssn
FROM project, employee, works_on
WHERE Pnumber=Pno AND Essn=Ssn
```

##### *b)* 

```
... Write here your answer ...
SELECT distinct Employee.Fname, Employee.Minit, Employee.Lname, Employee.Ssn
FROM employee AS Employee JOIN employee AS Supervisor ON Employee.Super_ssn=Supervisor.Ssn
WHERE (Supervisor.Fname='Carlos' AND Supervisor.Minit='D' AND Supervisor.Lname='Gomes')
```

##### *c)* 

```
... Write here your answer ...
select distinct Pname, sum(Hours) AS NHours
from project, works_on
where Pnumber=Pno
GROUP BY Pname
```

##### *d)* 

```
... Write here your answer ...
select distinct Fname, Minit, Lname
from employee
join department on Dno=Dnumber
join works_on on Ssn=Essn
join project on Pno=Pnumber
where employee.Dno = 3 
AND project.Pname = 'Aveiro Digital'
AND works_on.Hours > 20
```

##### *e)* 

```
... Write here your answer ...
select distinct Fname, Minit, Lname
from project
join works_on on Pnumber=Pno
right outer join employee on Essn=Ssn
where Pnumber is null
```

##### *f)* 

```
... Write here your answer ...
select distinct Dname, avg(Salary) as AvgSalaryF
from department
join employee on Dnumber=Dno
where employee.Sex='F'
group by Dname
```

##### *g)* 

```
... Write here your answer ...
select distinct Fname, Minit, Lname, Ssn, count(Essn) as numDependents
from dependent
join employee on Essn=Ssn
group by Fname, Minit, Lname, Ssn
having numDependents > 2
```

##### *h)* 

```
... Write here your answer ...
select distinct Dname, Mgr_ssn, Fname, Minit, Lname
from department
join employee on Mgr_ssn=Ssn
left outer join dependent on Ssn=Essn
where Essn is null
```

##### *i)* 

```
... Write here your answer ...
select distinct Fname, Minit, Lname,Ssn, Address, count(Ssn) as moreoneproject
from dept_location
right outer join department on dept_location.Dnumber=department.Dnumber
join employee on department.Dnumber=Dno
join works_on on Ssn=Essn
join project on Pno=Pnumber
where Dlocation<>'Aveiro' AND Plocation='Aveiro'
group by Fname, Minit, Lname,Ssn, Address
having moreoneproject >= 1
```

### 5.2

#### a) SQL DDL Script
 
```
Não temos servidor local, utilizamos o site da aula passada.
```

#### b) Data Insertion Script

```
Não temos servidor local, utilizamos o site da aula passada.
```

#### c) Queries

##### *a)*

```
... Write here your answer ...
select distinct nif, nome, fax, endereco, condpag, tipo
from encomenda
right outer join fornecedor on fornecedor=nif
where numero is null
```

##### *b)* 

```
... Write here your answer ...
select distinct codigo, nome, preco, iva, avg(item.unidades) as unidadesencomendadasporproduto
from produto
join item on codigo=codProd
group by codigo, nome, preco, iva
```


##### *c)* 

```
... Write here your answer ...
select distinct avg(produtosporencomenda) as avgprodutosporencomenda
from (select distinct numEnc, count(numEnc) as produtosporencomenda
      from item
      group by numEnc) as produtosEnc
```


##### *d)* 

```
... Write here your answer ...
select distinct nif, fornecedor.nome, codigo, produto.nome, sum(item.unidades) as quantidadeporfornecedor
from produto
join item on codigo=codProd
join encomenda on numEnc=numero
join fornecedor on fornecedor=nif
group by nif, fornecedor.nome, codigo, produto.nome
```

### 5.3

#### a) SQL DDL Script
 
```
Não temos servidor local, utilizamos o site da aula passada.
```

#### b) Data Insertion Script

```
Não temos servidor local, utilizamos o site da aula passada.
```

#### c) Queries

##### *a)*

```
... Write here your answer ...
select distinct nome,paciente.numUtente, numPresc
from paciente left outer join prescricao on paciente.numUtente = prescricao.numUtente
where numPresc is null
```

##### *b)* 

```
... Write here your answer ...
select distinct especialidade, count(numPresc) as PrescEspe
from medico join prescricao on numSNS = numMedico 
group by especialidade
```


##### *c)* 

```
... Write here your answer ...
select distinct farmacia.nome, count(farmacia) as PrescFarm
from prescricao join farmacia on farmacia = nome
group by farmacia.nome
```


##### *d)* 

```
... Write here your answer ...
select distinct farmaco.nome, formula
from farmaco left outer join presc_farmaco on nome = nomeFarmaco
where farmaco.numRegFarm = 906 AND numPresc is null
```

##### *e)* 

```
... Write here your answer ...
select distinct farmacia.nome, farmaceutica.nome, COUNT(presc_farmaco.numRegFarm) as numFarm
from farmaceutica 
join presc_farmaco on numReg = numRegFarm
join prescricao on presc_farmaco.numPresc = prescricao.numPresc
join farmacia on farmacia.nome = farmacia
group by farmacia.nome, farmaceutica.nome

```

##### *f)* 

```
... Write here your answer ...
select distinct paciente.nome, paciente.numUtente, paciente.dataNasc, count(prescricao.numMedico) as MedPac
from paciente 
join prescricao on paciente.numUtente = prescricao.numUtente
join medico on numMedico=numSNS
group by paciente.nome, paciente.numUtente, paciente.dataNasc
having MedPac > 1
```
