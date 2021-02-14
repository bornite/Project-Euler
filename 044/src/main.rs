extern crate itertools;

use itertools::Itertools;
use std::collections::HashSet;

// Generate the nth pentagonal number
fn generate_pentagonal_number(n: i64) -> i64 {
    return n*(3*n - 1) / 2;
}

// Check if it is a pentagonal number from HashSet
fn is_pentagonal(n: i64, check_hs: &HashSet<i64>) -> bool {
    if check_hs.contains(&n) { return true }
    return false;
}

fn main() {
    let mut pentagonal_numbers = vec![];
    let mut check_hs = HashSet::new();
    for n in 1..=3000 {
        let p: i64 = generate_pentagonal_number(n);
        pentagonal_numbers.push(p);
        check_hs.insert(p);
    }

    // Take two numbers from "pentagonal_numbers" and make a pair whose sum and difference are pentagonal numbers.
    let result = pentagonal_numbers.into_iter().combinations(2).filter(|c|
        is_pentagonal(c[0] + c[1], &check_hs) && is_pentagonal((c[0] - c[1]).abs(), &check_hs)
    )
    .map(|c| (c[0] - c[1])
    .abs())
    .min()
    .unwrap();

    println!("{}", result);
}