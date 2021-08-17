# 👨‍💻 Projeto 2 - Analise das acoes AAPL, AMZN, GOOGL e TSLA 
Projeto 2 da cadeira Estatistica e Probabilidade para Computacao da UFPE. Precisamos fazer os seguintes To-Do's para esse projeto, envolvendo as acoes da Apple, Amazon, Google e Tesla durante um intervalo de tempo pre-determinado pela equipe. Baixamos os datasets da acoes do Yahoo Finance e juntamos em um csv so com uma coluna adicionada com o nome de 'Stock':

- [x]  Readme
- [x]  Adicionar input para classe a ser analisada
- [x]  Adicionar intervalo de datas da análise
- [x]  Adicionar uma tabela contendo:
    - [x]  média
    - [x]  mediana
    - [x]  moda
    - [x]  desvio padrão
    - [x]  valor máximo na série
    - [x]  valor mínimo na série
- [x]  Adicionar Gráfico em linha da série;
- [x]  Adicionar histograma da série
- [x]  Adicionar boxplot da série
- [x]  Adicionar segunda aba com:
    - [x]  duas classes a serem analisadas
    - [x]  intervalo de datas para a análise
    - [x]  uma tabela com o valor da correlação entre as classes
    - [x]  gráfico de linha das classes
    - [x]  gráfico em barra das médias de cada classe
    - [x]  scatterplot das classes

### Imagem do projeto
![image](https://user-images.githubusercontent.com/79955775/129764716-a04af51b-756a-467b-876c-4d658a673475.png)

Nossa principal dificuldade foi na selecao do Dataset, ja que foi dificil aprender uma lingugem nova e sentir confianca para formatar os dados do dataset para utilizar no codigo.

## 👾 Tecnologias usadas
Nos utilizamos da linguaguem R e do rstudio para escrever o codigo, alem das seguintes bibliotecas
- shiny
- shinydashboard
- dplyr
- ggplot2
- DT
- lubridate

## ❔ Como instalar
Sera necessario ter a linguagem R instalada no computador juntamente com todas as bibliotecas mencionadas acima. As quais podem ser instaladas com o comando abaixo no rstudio, a IDE para R que recomendamos.

```r
   install.packages(nome-da-biblioteca)
```
E para utiliza-las no IDE com o seguinte codigo?

```r
   library(nome-da-bibilioteca)
```

Tendo tudo pronto voce pode rodar no proprio rstudio, ou no diretorio em questao executar o seguinte codigo no terminal:
```bash
   R -f app.R
```

## 👥 Contribuidores 

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/CaiolBarreto">
        <img src="https://avatars.githubusercontent.com/u/79955775?v=4" width="100px;" alt="Foto do Caio Barreto no GitHub"/><br>
        <sub>
          <b>Caio Barreto</b>
        </sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/ClessonR">
        <img src="https://avatars.githubusercontent.com/u/53549230?v=4" width="100px;" alt="Foto do Clesson Roberto"/><br>
        <sub>
          <b>Clesson Roberto</b>
        </sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/CynaraCosta">
        <img src="https://avatars.githubusercontent.com/u/61971729?v=4" width="100px;" alt="Foto da Cynara Costa"/><br>
        <sub>
          <b>Cynara Costa</b>
        </sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/jfmvs">
        <img src="https://avatars.githubusercontent.com/u/61971830?v=4" width="100px;" alt="Foto do Joao Felipe"/><br>
        <sub>
          <b>Joao Felipe</b>
        </sub>
      </a>
    </td>
  </tr>
</table>
