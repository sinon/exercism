import gleam/list
import gleam/result
import gleam/string

pub fn abbreviate(phrase phrase: String) -> String {
  phrase
  |> string.replace(each: "-", with: " ")
  |> string.replace(each: "_", with: " ")
  |> string.uppercase
  |> string.split(" ")
  |> list.map(string.first)
  |> result.values
  |> string.join("")
}
