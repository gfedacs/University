# Opera��es CRUD b�sicas
# -----------------------------------------------------------------


# Inserir um documento na minhanovacolecao e criar a cole��o
db.minhanovacolecao.insertOne({nome: "Jo�o"})

#inserir mais um �nico documento na mesma cole��o 
db.minhanovacolecao.insertOne( 
  { nome: "Marcia", idade: 23, hobbies: ["dan�a", "filmes"], 
    endere�o: { rua: "JJ", num: 35, apto: 202 } } )
    
#verificando inser��o
    
db.minhanovacolecao.find( { nome: "Marcia" } )

# inserir v�rios documentos em uma cole��o
db.minhanovacolecao.insertMany( [ 
  { nome: "Alana", idade: 33, hobbies: ["volley", "filmes"], 
           endere�o: { rua: "XX", num: 305, apto: 502 } }, 
  { nome: "Alvaro", idade: 43, hobbies: ["volley", "squash"], 
           endere�o: { rua: "YY", num: 43 } }]  )

    
#inserindo a partir de uma variavel
document = ( { nome: "An�sio", idade: 36, hobbies: ["futebol", "rock"], endere�o: { rua: "MM", num: 305, apto: 502 } } )
db.minhanovacolecao.insertOne(document)

# criando cole��o quando se cria �ndice ou se insere documento 

db.NovaColecaoTeste1.insertOne({x: 1})
db.NovaColecaoTeste2.createIndex({y: 1})

# contando documentos na cole��o
db.minhanovacolecao.countDocuments({});

# Recuperando documentos com o FIND
db.minhanovacolecao.find( {nome : "Marcia"})

#filtros
db.minhanovacolecao.find( { nome: "Jo�o" } )
db.minhanovacolecao.find( { nome: { $in: [ "Jo�o", "Marcia" ] } } )
db.minhanovacolecao.find( { nome: /^A/ } )

db.minhanovacolecao.find({ 
$or : 
    [ {"nome" : "Alvara"}, 
      {"nome" : "Alvaro"} ] }) 

db.minhanovacolecao.find(
{ "nome" : 
{ $in : ["Alvara", "Alvaro"] } }) 

# find com proje��o
db.minhanovacolecao.find( { nome: { $in: [ "Jo�o", "Marcia" ] } }, { nome: 1, idade: 1 } )
db.minhanovacolecao.find( { nome: { $in: [ "Jo�o", "Marcia" ] } }, { nome: 1, idade: 1, _id: 0  } )

#acesso a documentos embutidos
db.minhanovacolecao.find( { endere�o: { rua: "JJ", num: 35, apto: 202 } } )
db.minhanovacolecao.find( { "endere�o.rua": "JJ" } )

# acesso a arrays
db.minhanovacolecao.find( { "hobbies.1": "filmes" } )
db.minhanovacolecao.find( { hobbies: ["volley", "filmes"] } )
db.minhanovacolecao.find( { hobbies: { $all: ["filmes", "volley"] } } )

# outras consultas

db.minhanovacolecao.find( { nome: "Alvaro" }, { idade: 0, _id: 0 } )

db.minhanovacolecao.find( { nome: "Alvaro" }, { idade: 1, "endere�o.rua": 1 } )

# atualizando dados
db.minhanovacolecao.updateOne( { "nome" : "Alvaro" }, { $set: { "idade" : 38 } })

db.minhanovacolecao.updateMany( { idade: { $gt: 40 } }, { $set: { "B�nus" : true } } )

db.minhanovacolecao.updateOne( { "nome" : "Alvara" }, { $set: {"idade" : 57, hobbies: ["judo", "filmes"], 
   endere�o: { rua: "KK", num: 305, apto: 202 } } }, 
   { upsert: true })

# removendo objeto
db.minhanovacolecao.deleteOne( { B�nus: true } )
