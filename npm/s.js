async function getOnePokemonStatus(numero) {
    const response = await fetch('https://pokeapi.co/api/v2/pokemon/'+numero);
    const pokemon = await response.json();
    return pokemon;
  }

let array = []

for (let i = 1; i < 10; i++) {
    let a = await getOnePokemonStatus(i)
    array.push(a.name,a.base_experience,a.height,a.weight)
}



console.log(array)