# BD: Guião 5


## ​Problema 5.1
 
### *a)*

```
... Write here your answwer ...
(π Pname,Pnumber (project) ⨝Pnumber=Pno works_on) ⨝ Essn=Ssn (πFname, Lname, Ssn (employee))
```


### *b)* 

```
... Write here your answer ...
π Fname, Minit, Lname, employee.Ssn (
	employee ⨝ employee.Super_ssn = supervisor.Ssn (
		ρ supervisor (
			π Ssn (
				σ (Fname='Carlos' ∧ Minit='D' ∧ Lname='Gomes') (employee)
			)
		)
	)
)
```


### *c)* 

```
... Write here your answer ...
γ Pname; sum(Hours)->NHours (
	project ⨝ Pnumber=Pno works_on
)
```


### *d)* 

```
... Write here your answer ...
π Fname, Minit, Lname (
	σ Dnumber = 3 ∧ Hours > 20 ∧ Pname = 'Aveiro' (
		employee ⨝Ssn = Essn (
			department ⨝ Dnumber = Dnum (
				project ⨝ Pnumber = Pno works_on
			)
		)
	)
)
```


### *e)* 

```
... Write here your answer ...
π Fname,Minit,Lname σ Pnumber=null (
	employee⟕Ssn=Essn (
		project⨝Pnumber=Pno works_on
	)
)
```


### *f)* 

```
... Write here your answer ...
γ Dname; AVG(Salary)->AvgSalary σ Sex='F' (
	department⨝Dno=Dnumber employee
)
```


### *g)* 

```
... Write here your answer ...
σ dependentes > 2 (
	γ Fname, Minit, Lname; count(Ssn)->dependentes (
		employee ⨝ Ssn=Essn dependent
	)
)
```


### *h)* 

```
... Write here your answer ...
π Fname, Minit,Lname, employee.Ssn (
	σ Essn = null (
		department⨝ Mgr_ssn = Ssn employee ⟕ Ssn = Essn dependent
	)
)
```


### *i)* 

```
... Write here your answer ...
π Fname, Minit, Lname, Address (
	γ Fname, Minit, Lname, Address; COUNT(Plocation)-> moreoneproject (
		(σ employee.Ssn = works_on.Essn (
			employee ⨝ ( σ project.Pnumber = works_on.Pno (
				works_on ⨝ (σ Plocation='Aveiro' (project))
			))
		)
		) ⨝ (σ department.Dnumber = employee.Dno (
			employee ⨝ (σ Dlocation≠'Aveiro' (
				department ⟕ dept_location)
			)
		))
	)
)
```


## ​Problema 5.2

### *a)*

```
... Write here your answer ...
mais simples:
π nif, nome, fax, endereco, condpag, tipo (
	σ encomenda.fornecedor=null (
		fornecedor ⟕ fornecedor.nif=encomenda.fornecedor (encomenda)
	)
)

outra:
π nif, nome, fax, endereco, condpag, tipo ( σ numencomendas=null (fornecedor ⟕ ( σ fornecedor.nif = encomenda.fornecedor ( fornecedor ⟕ ( γ fornecedor; count(fornecedor) -> numencomendas (encomenda))) )) )
```

### *b)* 

```
... Write here your answer ...
π codigo, nome, preco, iva, unidadesencomendadasporproduto (
	σ produto.codigo=item.codProd (
		produto ⨝ (
			γ codProd; AVG(item.unidades)-> unidadesencomendadasporproduto (item)
		)
	)
)
```


### *c)* 

```
... Write here your answer ...
γ avg(produtosporencomenda) -> Avgprodutosporencomenda (
	γ numEnc; count(numEnc) -> produtosporencomenda (item)
)
```


### *d)* 

```
... Write here your answer ...
π nif, fornecedor.nome, codigo, produto.nome, quantidadeporfornecedor (
	γ nif, fornecedor.nome, codigo, produto.nome; SUM(item.unidades)-> quantidadeporfornecedor (
		fornecedor ⨝ fornecedor.nif=encomenda.fornecedor (
			encomenda ⨝ encomenda.numero=item.numEnc (
				item ⨝ item.codProd=produto.codigo (produto)
			)
		)
	)
)
```


## ​Problema 5.3

### *a)*

```
... Write here your answer ...
π paciente.nome, paciente.numUtente, paciente.dataNasc, paciente.endereco σ~(
	prescricao.numPresc = null
)(
	paciente ⟕ paciente.numUtente = prescricao.numUtente prescricao
)
```

### *b)* 

```
... Write here your answer ...
γ especialidade; COUNT(numPresc) -> PrescEspe (
	prescricao ⨝ numMedico = numSNS medico
)
```


### *c)* 

```
... Write here your answer ...
γ farmacia.nome; COUNT(farmacia)->PrescFarm (
	prescricao ⨝ farmacia = nome farmacia 
)
```


### *d)* 

```
... Write here your answer ...
(π farmaco.nome (
	σ farmaceutica.numReg = 906 (
		farmaceutica ⟗ farmaceutica.numReg = farmaco.numRegFarm farmaco
	)
) - π presc_farmaco.nomeFarmaco (
	σ farmaceutica.numReg = 906 (
		farmaceutica ⟗ farmaceutica.numReg = numRegFarm presc_farmaco
	)
))
```

### *e)* 

```
... Write here your answer ...
γ farmacia.nome, farmaceutica.nome; COUNT(presc_farmaco.numRegFarm)->NumFarm (
	farmaceutica ⨝ numReg = numRegFarm presc_farmaco ⨝ presc_farmaco.numPresc = prescricao.numPresc (
		farmacia ⨝ nome = farmacia prescricao
	)
)
```

### *f)* 

```
... Write here your answer ...
σ MedPac > 1 (
	γ paciente.nome, paciente.numUtente, paciente.dataNasc ; COUNT(prescricao.numMedico)->MedPac (
		paciente ⨝ paciente.numUtente =  prescricao.numUtente (
			prescricao⨝ prescricao.numMedico = medico.numSNS medico
		)
	)
)
```
