# Operações CRUD básicas
# -----------------------------------------------------------------


# Inserir um documento na minhanovacolecao e criar a coleção
db.minhanovacolecao.insertOne({nome: "João"})

#inserir mais um único documento na mesma coleção 
db.minhanovacolecao.insertOne( 
  { nome: "Marcia", idade: 23, hobbies: ["dança", "filmes"], 
    endereço: { rua: "JJ", num: 35, apto: 202 } } )
    
#verificando inserção
    
db.minhanovacolecao.find( { nome: "Marcia" } )

# inserir vários documentos em uma coleção
db.minhanovacolecao.insertMany( [ 
  { nome: "Alana", idade: 33, hobbies: ["volley", "filmes"], 
           endereço: { rua: "XX", num: 305, apto: 502 } }, 
  { nome: "Alvaro", idade: 43, hobbies: ["volley", "squash"], 
           endereço: { rua: "YY", num: 43 } }]  )

    
#inserindo a partir de uma variavel
document = ( { nome: "Anísio", idade: 36, hobbies: ["futebol", "rock"], endereço: { rua: "MM", num: 305, apto: 502 } } )
db.minhanovacolecao.insertOne(document)

# criando coleção quando se cria índice ou se insere documento 

db.NovaColecaoTeste1.insertOne({x: 1})
db.NovaColecaoTeste2.createIndex({y: 1})

# contando documentos na coleção
db.minhanovacolecao.countDocuments({});

# Recuperando documentos com o FIND
db.minhanovacolecao.find( {nome : "Marcia"})

#filtros
db.minhanovacolecao.find( { nome: "João" } )
db.minhanovacolecao.find( { nome: { $in: [ "João", "Marcia" ] } } )
db.minhanovacolecao.find( { nome: /^A/ } )

db.minhanovacolecao.find({ 
$or : 
    [ {"nome" : "Alvara"}, 
      {"nome" : "Alvaro"} ] }) 

db.minhanovacolecao.find(
{ "nome" : 
{ $in : ["Alvara", "Alvaro"] } }) 

# find com projeção
db.minhanovacolecao.find( { nome: { $in: [ "João", "Marcia" ] } }, { nome: 1, idade: 1 } )
db.minhanovacolecao.find( { nome: { $in: [ "João", "Marcia" ] } }, { nome: 1, idade: 1, _id: 0  } )

#acesso a documentos embutidos
db.minhanovacolecao.find( { endereço: { rua: "JJ", num: 35, apto: 202 } } )
db.minhanovacolecao.find( { "endereço.rua": "JJ" } )

# acesso a arrays
db.minhanovacolecao.find( { "hobbies.1": "filmes" } )
db.minhanovacolecao.find( { hobbies: ["volley", "filmes"] } )
db.minhanovacolecao.find( { hobbies: { $all: ["filmes", "volley"] } } )

# outras consultas

db.minhanovacolecao.find( { nome: "Alvaro" }, { idade: 0, _id: 0 } )

db.minhanovacolecao.find( { nome: "Alvaro" }, { idade: 1, "endereço.rua": 1 } )

# atualizando dados
db.minhanovacolecao.updateOne( { "nome" : "Alvaro" }, { $set: { "idade" : 38 } })

db.minhanovacolecao.updateMany( { idade: { $gt: 40 } }, { $set: { "Bônus" : true } } )

db.minhanovacolecao.updateOne( { "nome" : "Alvara" }, { $set: {"idade" : 57, hobbies: ["judo", "filmes"], 
   endereço: { rua: "KK", num: 305, apto: 202 } } }, 
   { upsert: true })

# removendo objeto
db.minhanovacolecao.deleteOne( { Bônus: true } )
