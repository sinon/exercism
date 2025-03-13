pub fn verse(n: u32) -> String {
    format!(
        "{} bottles of beer on the wall, {} bottles of beer.\nTake one down and pass it around, {} bottles of beer on the wall.\n", n, n, n - 1
     ).to_string()
}

pub fn sing(start: u32, end: u32) -> String {
    unimplemented!("sing verses {} to {}, inclusive", start, end)
}
