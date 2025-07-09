use std::collections::{HashMap, HashSet};

fn char_count(w: &str) -> HashMap<char, usize> {
    let mut letter_counts: HashMap<char, usize> = HashMap::new();
    let char_vec: Vec<char> = w.to_lowercase().chars().collect();
    for c in char_vec {
        *letter_counts.entry(c).or_insert(0) += 1;
    }
    letter_counts
}

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &'a [&str]) -> HashSet<&'a str> {
    let w_count = char_count(word);
    let anagrams: HashSet<&str> = possible_anagrams
        .into_iter()
        .enumerate()
        .map(|(idx, x)| (char_count(x), idx))
        .filter(|(counts, idx)| {
            *counts == w_count && word.to_lowercase() != possible_anagrams[*idx].to_lowercase()
        })
        .map(|(_, idx)| possible_anagrams[idx])
        .collect();
    anagrams
}
