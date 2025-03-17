import gleam/int
import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Caprese -> 9
    ExtraSauce(p) -> 1 + pizza_price(p)
    ExtraToppings(p) -> 2 + pizza_price(p)
    Formaggio -> 10
    Margherita -> 7
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let sub_total =
    order
    |> list.map(pizza_price)
    |> int.sum
  case list.length(order) {
    1 -> sub_total + 3
    2 -> sub_total + 2
    _ -> sub_total
  }
}
