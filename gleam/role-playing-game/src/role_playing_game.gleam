import gleam/int
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    None -> "Mighty Magician"
    Some(n) -> n
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health {
    i if i <= 0 -> {
      case player.level {
        l if l >= 10 -> Some(Player(..player, health: 100, mana: Some(100)))
        _ -> Some(Player(..player, health: 100, mana: None))
      }
    }
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case cost, player.mana {
    c, Some(m) -> {
      case c <= m {
        False -> #(player, 0)
        True -> #(Player(..player, mana: Some(m - c)), c * 2)
      }
    }
    c, None -> #(Player(..player, health: int.max(player.health - c, 0)), 0)
  }
}
