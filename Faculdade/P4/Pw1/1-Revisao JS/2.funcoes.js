let matricula = [1,2,3,4,5,6,7,8,9,10];

cont = 0
matricula.forEach(numero =>{
    cont = cont + numero ;
    console.log(cont)

}

)


console.log("---------------------------------------------------")

let alunos = [
    {
      "matricula": "345",
      "nome": "Carlos",
      "idade": 20,
    },
    {
      "matricula": "246",
      "nome": "João",
      "idade": 33,
    },
    {
      "matricula": "156",
      "nome": "Maria",
      "idade": 18,
    },
    {
      "matricula": "543",
      "nome": "José",
      "idade": 40,
    },
    {
      "matricula": "765",
      "nome": "Sebastião",
      "idade": 25,
    },  
  ];

alunos.forEach(aluno=>{
                console.log(aluno.nome, aluno.idade,aluno.matricula)
                console.log("opa")})


let alunos1 = alunos.filter(aluno=>aluno.idade>30);

console.log(alunos1)

//console.log(alunos)

console.log("---------------------------------------------------")


// map: Cria um novo array aplicando uma função a cada elemento do array original, retornando um novo array com os resultados.

let sep = console.log(alunos.map(aluno=>aluno.nome="João"))

console.log(alunos);

// filter: Cria um novo array contendo apenas os elementos que satisfazem uma condição especificada.

let sep2 = console.log(alunos.filter(aluno => aluno.nome== "João" && aluno.idade == 33));


// reduce: Reduz o array a um único valor aplicando uma função acumuladora a cada elemento, resultando em um valor acumulado final.



console.log("---------------------------------------------------")
console.log("                                                    ")
numeros = [1,2,3,4,5,11,7,100000000,9,10,3333];

console.log(numeros.reduce((acumulador,numero)=>{
            if (numero > acumulador){
                return numero;
            } else if (numero <= acumulador) {
                return acumulador;
            }
},0));



console.log(numeros.reduce((a,n)=>{
        let tamanho = numeros.length;
        
        if (tamanho % 2 == 1){
            tamanho = tamanho - 0.5/2;
            return numeros[tamanho];
        }
        return numeros[tamanho/2];
},0));

let numeros10 = [1,2,99,4,5,6,71,823423,6666,10];


function mediana (array){
    let ordem = array.sort((a,b)=>a-b);
    let tamanho = ordem.length;
    // 1, 2, 3, 4, 5, 6, 7, 8, 9
    if (tamanho % 2 == 1){
        return ordem[(tamanho-1)/2];
    }
    let soma = ordem[(tamanho/2)-1] + ordem[(tamanho/2)];
    console.log(ordem[(tamanho/2)-1])
    console.log(ordem[(tamanho/2)])
    return soma/2;


}


console.log(mediana(numeros10));

