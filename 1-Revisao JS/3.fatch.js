async function getOnePokemonStatus() {
    const response = await fetch('https://pokeapi.co/api/v2/pokemon/25');
    const pokemon = await response.json();
    return pokemon;
  }
  
  async function getPokemonName() {
    const pokemon = await getOnePokemonStatus();
    return pokemon.species.name;
  }
  
let a = getPokemonName()


console.log("chegou aqui")
console.log(a)






