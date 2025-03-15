import gleam/string

pub fn hey(remark: String) -> String {
  let remark = string.trim(remark)
  let is_nothing = string.is_empty(remark)
  let all_caps =
    remark == string.uppercase(remark) && remark != string.lowercase(remark)
  let is_question = string.last(remark) == Ok("?")
  case remark, all_caps, is_question, is_nothing {
    _, _, _, True -> "Fine. Be that way!"
    _, False, True, False -> "Sure."
    _, True, True, False -> "Calm down, I know what I'm doing!"
    _, True, False, False -> "Whoa, chill out!"
    _, _, _, False -> "Whatever."
  }
}
