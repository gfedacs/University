async function getEndereco(){
    const array1 =[]
    const resultado = await fetch("https://viacep.com.br/ws/58015280/json/");
    const resultadoJson = await resultado.json();
    array1.push(resultadoJson);
    
    const resultado1 = await fetch("https://viacep.com.br/ws/01001000/json/");
    const resultadoJson1 = await resultado1.json();

    array1.push(resultadoJson1);

    return array1


}
    //
//let endereco
//t array = []
//array2 = []


//getEndereco().then(dado=>{array=dado;
 //                             array.forEach(element =>{
  //                                  array2.push(element.logradouro);
   //                                     console.log(array2)
   //                           });
                            

//})


async function getInformacoes() {

       let logradouro ;
       array1=[]
    
        logradouro = await getEndereco().then(dado => {
            dado.forEach(element => {
                array1.push(element.ibge);
                
            });
        });  

        return array1;
}


getInformacoes().then(dado=>dado.forEach(element=> {if (element<3000000){
    console.log("Menor que 3kk") }
    else if (element>3000000){
        console.log("Maior que 3kk")}
    }))