import gleam/list
import gleam/result

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0
    Cytosine -> 1
    Guanine -> 2
    Thymine -> 3
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0 -> Ok(Adenine)
    1 -> Ok(Cytosine)
    2 -> Ok(Guanine)
    3 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  dna
  |> list.map(encode_nucleotide)
  |> list.fold(<<>>, fn(acc, x) { <<acc:bits, x:2>> })
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  decode_do(dna, [])
}

fn decode_do(
  dna: BitArray,
  acc: List(Nucleotide),
) -> Result(List(Nucleotide), Nil) {
  case dna {
    <<>> -> Ok(acc |> list.reverse)
    <<val:2, rest:bits>> -> {
      use v <- result.try(decode_nucleotide(val))
      decode_do(rest, [v, ..acc])
    }
    _ -> Error(Nil)
  }
}
