extern crate num_bigint;
extern crate num_traits;

use num_bigint::BigUint;

fn get_e_seq(i: u64) -> u64 {
    match i {
        0 => 2u64,
        i if i % 3 == 0 => (2 * (i / 3)),
        _ => 1,
    }
}

fn sum_of_digits(n: BigUint) -> u32 {
    n.to_string()
    .chars()
    .filter_map(|c| c.to_digit(10))
    .sum::<u32>()
}

fn main() {
    let upper_bound: usize = 100;
    let mut d: BigUint = 1u64.into();
    let mut n: BigUint = 2u64.into();

    for i in 2..=upper_bound {
        let temp_d = d;
        let temp_n = n;
        
        let c: u64 = get_e_seq(i as u64);

        d = temp_n.clone();
        n = c * temp_n.clone() + temp_d.clone();
    }
    let result = sum_of_digits(n);
    println!("{}", result);
}