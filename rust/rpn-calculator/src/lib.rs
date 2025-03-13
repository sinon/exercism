#[derive(Debug)]
pub enum CalculatorInput {
    Add,
    Subtract,
    Multiply,
    Divide,
    Value(i32),
}

pub fn evaluate(inputs: &[CalculatorInput]) -> Option<i32> {
    if inputs.is_empty() {
        return None;
    }
    let mut stack: Vec<i32> = vec![];
    for input in inputs.into_iter() {
        match input {
            CalculatorInput::Add => {
                let first = stack.pop();
                let second = stack.pop();
                match (first, second) {
                    (Some(x), Some(y)) => { stack.push(y + x)},
                    (Some(_), None) => {break},
                    (None, Some(_)) => {break},
                    (None, None) => {break},
                }
            },
            CalculatorInput::Subtract => {
                let first = stack.pop();
                let second = stack.pop();
                match (first, second) {
                    (Some(x), Some(y)) => { stack.push(y - x)},
                    (Some(_), None) => {break},
                    (None, Some(_)) => {break},
                    (None, None) => {break},
                }
            },
            CalculatorInput::Multiply => {
                let first = stack.pop();
                let second = stack.pop();
                match (first, second) {
                    (Some(x), Some(y)) => { stack.push(y * x)},
                    (Some(_), None) => {break},
                    (None, Some(_)) => {break},
                    (None, None) => {break},
                }
            }
            CalculatorInput::Divide => {
                let first = stack.pop();
                let second = stack.pop();
                match (first, second) {
                    (Some(x), Some(y)) => { stack.push(y / x)},
                    (Some(_), None) => {break},
                    (None, Some(_)) => {break},
                    (None, None) => {break},
                }
            }
            CalculatorInput::Value(v) => {
                stack.push(v.clone())
            }
        }
    }
    if (stack.is_empty()) | (stack.len() > 1) {
        None
    } else {
        Some(stack[0])
    }
}
