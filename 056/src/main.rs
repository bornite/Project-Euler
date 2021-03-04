extern crate num_bigint;
extern crate num_traits;

use num_bigint::BigInt;
use num_traits::Pow;

fn sum_of_digits(num: String) -> u64 {
    let mut sum: u64 = 0;
    for i in num.chars() {
        sum = sum + (i as u64 - 48);
    }
    return sum;
}

fn main() {
    let mut max: u64 = 0;
    let mut sum: u64 = 0;
    for a in 1..=100 {
        for b in 1..=100 {
            let x: BigInt = a.into();
            let ret = x.pow(b as u32);
            sum = sum_of_digits(ret.to_str_radix(10));
            if sum > max {
                max = sum;
            }
        }
    }
    println!("{}", max);
}