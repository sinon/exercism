#![allow(unused)]

use std::collections::hash_map::Entry::{Occupied, Vacant};
use std::collections::HashMap;

pub fn can_construct_note(magazine: &[&str], note: &[&str]) -> bool {
    let mut track_words: HashMap<String, i32> = HashMap::new();
    for magazine_word in magazine.iter() {
        *track_words.entry(magazine_word.to_string()).or_insert(0) += 1;
    }
    for note_word in note.iter() {
        *track_words.entry(note_word.to_string()).or_insert(0) -= 1;

        match track_words.get(*note_word) {
            Some(val) => {
                if val.clone() < 0 {
                    return false;
                }
            }
            _ => {}
        };
    }
    return true;
}
