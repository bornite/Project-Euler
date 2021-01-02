use std::{cmp, iter};

fn compute(sum: u64) -> Option<(u64, u64, u64)> {
    (2..sum - 1)
        .flat_map(|c| {
            let a_max = sum / 3;
            (1..a_max).zip(iter::repeat(c))
        })
        .map(|(a, c)| (a, sum - c - a, c))
        .find(|&(a, b, c)| a * a + b * b == c * c)
}

fn main() {
    let pythagorean_triplet: (u64, u64, u64) = compute(1000).unwrap();
    println!("{}", pythagorean_triplet.0 * pythagorean_triplet.1 * pythagorean_triplet.2);
}
