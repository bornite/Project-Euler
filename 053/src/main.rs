extern crate num_bigint;
extern crate num_traits;

use num_bigint::BigUint;
use num_traits::{Zero, One};

fn comb(n: u64, r: u64) -> BigUint {
    let f0: BigUint = Zero::zero();
    let f1: BigUint = One::one();
    match (n, r) {
        (0, _) | (_, 0) => f1,
        _ => comb(n, r - 1) * (n - r + 1) / r
    }
}

fn main() {
    let mut answer: u64 = 0;
    let limit: BigUint = 1_000_000u64.into();

    for n in 23..=100 {
        for r in 1..n {
            println!("{}, {}", n, r);
            let num: BigUint = comb(n, r);
            if num < limit {continue;}
            answer += 1;
        }
    }
    println!("{}", answer);
}
