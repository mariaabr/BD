# BD: Guião 7


## ​7.2 
 
### *a)*

```
... Write here your answer ...
It is possible to <u>underline</u> -> {A, B,.. }
-> R1 (_A_, B, C)
-> R2 (B,F)

A relação está na 1FN se e só se os atributos forem atómicos.
```

### *b)* 

```
... Write here your answer ...
Com Titulo_Livro e Nome_Autor como conjunto chaves da relação.

Primeiro faz-se a 2FN:
    R1 = {<u>Titulo_Livro</u>, <u>Nome_Autor</u>, Tipo_Livro, Preco, NoPaginas, Editor, Endereco_Editor, Ano_publicacao}
    R2 = {<u>Nome_Autor</u>, Afiliacao_Autor}

Para que não existam dependências entre atributos não chave decompõem-se mais as relações para chegar à 3FN:
    R1 = {<u>Titulo_Livro</u>, <u>Nome_Autor</u>, Tipo_Livro, NoPaginas, Editor, Ano_publicacao}
    R2 = {<u>Nome_Autor</u>, Afiliacao_Autor}
    R3 = {Tipo_Livro, NoPaginas, Preco}
    R4 = {Editor, Endereco_Editor}
```




## ​7.3
 
### *a)*

```
... Write here your answer ...
A chave da relação é o conjunto dos atributos A e B.
```


### *b)* 

```
... Write here your answer ...
R={A,B,C,D,E,F,G,H,I,J}

2FN:
    R1 = {A, B, C}
    R2 = {A, D, E, I, J}
    R3 = {B, F, G, H}
```


### *c)* 

```
... Write here your answer ...
3FN:
    R1 = {A, B, C}
    R2 = {A, D, E}
    R3 = {B, F}
    R4 = {D, I, J}
    R5 = {F, G, H}
```


## ​7.4
 
### *a)*

```
... Write here your answer ...
A chave da relação é o conjunto dos atributos A e B.
```


### *b)* 

```
... Write here your answer ...
R={A,B,C,D,E}

2FN:
    R1 = {A, B, C, D, E}

3FN:
    R1 = {A, B, C, D}
    R2 = {D, E}
```


### *c)* 

```
... Write here your answer ...
BCNF:
    R1 = {B, C, D}
    R2 = {D, E}
    R3 = {C, A}
```



## ​7.5
 
### *a)*

```
... Write here your answer ...
A chave da relação é o conjunto dos atributos A e B.
```

### *b)* 

```
... Write here your answer ...
R={A,B,C,D,E}

2FN:
    R1 = {A, B, E}
    R2 = {A, C, D}
```


### *c)* 

```
... Write here your answer ...
3FN:
    R1 = {A, B, E}
    R2 = {A, C}
    R3 = {C, D}
```

### *d)* 

```
... Write here your answer ...
BCNF:
Já se encontra na BCNF.
```
