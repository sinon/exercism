pub fn verse(n: u32) -> String {
    let v = [
        "", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten",
    ];
    match (n, n.saturating_sub(1)) {
        (1, 0) => "One green bottle hanging on the wall,
One green bottle hanging on the wall,
And if one green bottle should accidentally fall,
There'll be no green bottles hanging on the wall.\n"
            .to_string(),
        (2, 1) => "Two green bottles hanging on the wall,
Two green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be one green bottle hanging on the wall.\n"
            .to_string(),
        (x, y) => {
            format!(
                "{} green bottles hanging on the wall,
{} green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be {} green bottles hanging on the wall.\n",
                v[x as usize],
                v[x as usize],
                v[y as usize].to_lowercase()
            )
        }
    }
}

pub fn recite(start: u32, verse_count: u32) -> String {
    let end = start - (verse_count - 1);
    println!("start:{start} end: {end}");
    (end..=start)
        .rev()
        .map(verse)
        .collect::<Vec<_>>()
        .join("\n")
}
