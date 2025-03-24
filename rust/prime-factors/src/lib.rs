pub fn factors(n: u64) -> Vec<u64> {
    let mut n = n;
    let mut factors = Vec::new();
    let mut i = 2;
    while i * i <= n {
        if n.rem_euclid(i) != 0 {
            i += 1;
        } else {
            n /= i;
            factors.push(i)
        }
    }
    if n > 1 {
        factors.push(n)
    }
    factors
}

pub fn factors_rec(n: u64) -> Vec<u64> {
    match (2..=n).find(|i| n % i == 0) {
        None => vec![],
        Some(i) => [vec![i], factors_rec(n / i)].concat(),
    }
}

pub fn factors_rec_2(n: u64) -> Vec<u64> {
    (2..=n)
        .find(|i| n % i == 0)
        .map_or_else(Vec::new, |i| [vec![i], factors(n / i)].concat())
}
