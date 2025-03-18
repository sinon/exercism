pub type GbTree(key, value)

@external(erlang, "gb_trees", "empty")
pub fn new_gb_tree() -> GbTree(k, v)

pub fn insert(tree: GbTree(k, v), key: k, value: v) -> GbTree(k, v) {
  do_insert(tree, key, value)
}

@external(erlang, "gb_trees", "insert")
fn do_insert(tree: GbTree(k, v), key: l, value: v) -> GbTree(k, v)

pub fn delete(tree: GbTree(k, v), key: k) -> GbTree(k, v) {
  do_delete(tree, key)
}

@external(erlang, "gb_trees", "delete_any")
fn do_delete(tree: GbTree(k, v), key: k) -> GbTree(k, v)
