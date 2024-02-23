# Aula 19: Mapeamentos
# -----------------------------------------------------------------

# Inserindo e estruturando coleções e relacionamentos 

db.livro2.insertOne( 
   {titulo:"Sistemas de Bancos de Dados", 
    palavras_chave:["SGBD","relacional","NoSQL"], 
    ano: 2017,
    gênero: ["Computação","Projeto"], 
    notaMédia: 4.0 
   })
   
db.livro2.insertOne( 
   {titulo:"Projeto de Banco de Dados", 
    palavras_chave:["SGBD","relacional"], 
    ano: 2015,
    gênero: ["Computação","Projeto"], 
    notaMédia: 4.0,
    editora: "Pearson",
    autor: [
       {nome:"Carlos Heuser", email: "ch@example.com"},
       {nome:"Carlos Heuser Jr", email: "chj@example.com"}
       ]
   }) 
   
 db.autor.insert (
   {nome: "Carlos Heuser ",
    email: "ch@example.com", 
    livro: [
      {num:1, titulo:"Projeto de Banco de Dados"},
      {num:2, titulo:"Projeto de NoSQL"}      
   ]})

db.livro2.insertOne( 
   {título:"Conde de Monte Cristo2", 
    numpags:663,
    ano:2012,
    palavraschave:["revolução","vingança"], 
    gênero: ["drama", "literatura"],
    notamedia: 4,     
    editora: "Zahar",
    autor: [
        {"01": ObjectId("6576faa90cb3e30d7473e7a0")    }]}) 
        
 
db.resenha.insertOne( 
   {
     livro:ObjectId("6576f9cb0cb3e30d7473e79d"),
     data: new Date (2022,11,21), 
     texto:  "Adorei, sensacional",
     comentário: [ { user:'Mario', mensagem:'Poderia ser melhor'}, { user:'Rebeca', mensagem:'Excelente'}], 
     nota: 5}
   )

 db.autor.insert (
   {nome: "Joana Brandão ",
    email: "jb@example.com", 
    livro: [
      {num:1, titulo:"Projeto de Banco NoSQL"}],
    beneficio: 1.000,
    instituição: "IFPB"  
})

db.autor.insert (
   {nome: "Mariana Chaves ",
    email: "mc@example.com", 
    livro: [
      {num:1, titulo:"Projeto de Banco NoSQL"}],
    empresa: "XXXX"  
      })



