import gleam/list
import gleam/option.{Some}
import gleam/regex

pub fn is_valid_line(line: String) -> Bool {
  case line {
    "[DEBUG]" <> _rest -> True
    "[INFO]" <> _rest -> True
    "[WARNING]" <> _rest -> True
    "[ERROR]" <> _rest -> True
    _ -> False
  }
}

pub fn split_line(line: String) -> List(String) {
  let options = regex.Options(case_insensitive: True, multi_line: False)
  let assert Ok(re) = regex.compile("<[~*=-]*>", with: options)
  regex.split(re, line)
}

pub fn tag_with_user_name(line: String) -> String {
  let options = regex.Options(case_insensitive: True, multi_line: False)
  let assert Ok(re) = regex.compile(" User\\s*(?<name>[^\\s]+)", with: options)
  let matches = regex.scan(re, line)
  let newline = case list.first(matches) {
    Error(_) -> {
      line
    }
    Ok(match) -> {
      let assert Ok(u) = list.first(match.submatches)
      let assert Some(u) = u
      "[USER] " <> u <> " " <> line
    }
  }
  newline
}
