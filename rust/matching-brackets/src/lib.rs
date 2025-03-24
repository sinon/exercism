use std::collections::HashMap;

pub fn brackets_are_balanced(string: &str) -> bool {
    let mut stack = Vec::new();
    let open = ['(', '{', '['];
    let valid_chars = ['(', '{', '[', ')', '}', ']'];
    let lookup = HashMap::from([('(', ')'), ('{', '}'), ('[', ']')]);
    for ch in string.chars() {
        if !valid_chars.contains(&ch) {
            continue;
        }
        if open.contains(&ch) {
            stack.push(ch);
        } else if stack.is_empty() {
            return false;
        } else {
            let cl = stack.last().unwrap();
            if *lookup.get(cl).unwrap() == ch {
                stack.pop();
                continue;
            } else {
                return false;
            }
        }
    }
    stack.is_empty()
}
