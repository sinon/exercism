#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}


pub fn sublist<T: PartialEq + std::fmt::Debug>(_first_list: &[T], _second_list: &[T]) -> Comparison {
    if _first_list.len() == _second_list.len() {
        if _first_list.eq(_second_list) == true {
            return Comparison::Equal
        }
    }
    else if _first_list.len() > _second_list.len() {
        let idx = _second_list.len();
        let diff = _first_list.len() - _second_list.len();
        for i in 0..diff + 1{
            if _first_list[i..idx + i].eq(_second_list) {
                return Comparison::Superlist
            }
        }
    } else if _second_list.len() > _first_list.len() {
        let idx = _first_list.len();
        let diff = _second_list.len() - _first_list.len();
        for i in 0..diff + 1 {
            if _second_list[i..idx + i].eq(_first_list) {
                return Comparison::Sublist
            }
        }
    }
    return Comparison::Unequal
}
