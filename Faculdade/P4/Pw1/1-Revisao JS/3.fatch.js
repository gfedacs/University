//let Deck=fetch("https://www.deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1").then(retorno=>retorno.json()).then(dado=>Deck= dado)



async function getDeck(){


    try{
    const result = await fetch("https://www.deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1")

    const resultJson = await result.json()
    const resultJson2 = resultJson
    return resultJson2;

    }
    catch(error){
        console.log(error)
    }
  
}
let deckzin
let array = []

for (let i = 0; i < 10; i++) {
    getDeck().then(dado=> {deckzin=dado;
        array.push(deckzin.deck_id);
        console.log(array)})
}

    








