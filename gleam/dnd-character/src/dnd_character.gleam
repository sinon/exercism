import gleam/int
import gleam/list
import gleam/result

pub type Character {
  Character(
    charisma: Int,
    constitution: Int,
    dexterity: Int,
    hitpoints: Int,
    intelligence: Int,
    strength: Int,
    wisdom: Int,
  )
}

pub fn generate_character() -> Character {
  let cons = ability()
  Character(
    ability(),
    cons,
    ability(),
    10 + modifier(cons),
    ability(),
    ability(),
    ability(),
  )
}

pub fn modifier(score: Int) -> Int {
  result.unwrap(int.floor_divide(score - 10, 2), 0)
}

pub fn ability() -> Int {
  list.repeat(int.random(6) + 1, 3)
  |> list.reduce(fn(acc, x) { acc + x })
  |> result.unwrap(3)
}
