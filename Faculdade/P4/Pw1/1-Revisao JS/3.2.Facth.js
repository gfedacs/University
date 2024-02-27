

async function getOnePokemonStatus() {
    const response = await fetch('https://pokeapi.co/api/v2/pokemon/25');
    const pokemon = await response.json();
    return pokemon;
}


let nameOfPokemon = getOnePokemonStatus().then(pokemon => {
        console.log(pokemon.name);
    });

console.log(nameOfPokemon) 