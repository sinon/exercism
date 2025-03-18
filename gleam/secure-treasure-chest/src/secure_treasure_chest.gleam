import gleam/string

pub opaque type TreasureChest(t) {
  TreasureChest(treasure: t, password: String)
}

pub fn create(
  password: String,
  contents: treasure,
) -> Result(TreasureChest(treasure), String) {
  case string.length(password) {
    p if p >= 8 -> Ok(TreasureChest(contents, password))
    _ -> Error("Password must be at least 8 characters long")
  }
}

pub fn open(
  chest: TreasureChest(treasure),
  password: String,
) -> Result(treasure, String) {
  case chest.password == password {
    False -> Error("Incorrect password")
    True -> Ok(chest.treasure)
  }
}
