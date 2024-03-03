async function getOnePokemonStatus() {
    const response = await fetch('https://pokeapi.co/api/v2/pokemon/25');
    const pokemon = await response.json();
    return pokemon;
  }
  
  async function getPokemonName() {
    const pokemon = await getOnePokemonStatus();
    return pokemon.species.name;
  }
  
  let main = async function () {
    const pokemonName = await getPokemonName();
    console.log(pokemonName.length); // Corrected 'length'

    if (pokemonName.length > 0) {
       console.log("Not Empty");
    } else {
       console.log("Empty");
    }
      }
  
main()


