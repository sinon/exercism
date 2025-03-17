import gleam/list
import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.new()
  |> set.insert(card)
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(set.contains(collection, card), set.insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let have_my_card = set.contains(collection, my_card)
  let have_their = set.contains(collection, their_card)
  let collection =
    collection
    |> set.insert(their_card)
    |> set.delete(my_card)
  case have_my_card, have_their {
    _, True -> #(False, collection)
    False, _ -> #(False, collection)
    True, False -> {
      #(True, collection)
    }
  }
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  boring_cards_do(collections) |> set.to_list
}

fn boring_cards_do(collections: List(Set(String))) -> Set(String) {
  case collections {
    [] -> set.new()
    [v] -> v
    [head, next] -> set.intersection(head, next)
    [head, ..rest] -> set.intersection(head, boring_cards_do(rest))
  }
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.fold(set.new(), fn(acc, x) { set.union(acc, x) })
  |> set.size
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection |> set.filter(fn(x) { string.contains(x, "Shiny ") })
}
