import gleam/iterator.{type Iterator}

pub type Item {
  Item(name: String, price: Int, quantity: Int)
}

pub fn item_names(items: Iterator(Item)) -> Iterator(String) {
  items |> iterator.map(fn(x) { x.name })
}

pub fn cheap(items: Iterator(Item)) -> Iterator(Item) {
  items |> iterator.filter(fn(x) { x.price <= 30 })
}

pub fn out_of_stock(items: Iterator(Item)) -> Iterator(Item) {
  items |> iterator.filter(fn(x) { x.quantity == 0 })
}

pub fn total_stock(items: Iterator(Item)) -> Int {
  items |> iterator.fold(0, fn(acc, x) { acc + x.quantity })
}
