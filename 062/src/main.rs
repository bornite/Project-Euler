extern crate itertools;
use itertools::Itertools;

fn gen_cubic_numbers(limit: usize) -> Vec<i128> {
    let mut vec = Vec::new();
    for i in 1.. {
        let n = (i as i128).pow(3);
        if n.to_string().chars().count() > limit {
            break;
        }
        vec.push(n);
    }
    return vec;
}

fn main() {
    let mut cubic_numbers = Vec::new();
    cubic_numbers = gen_cubic_numbers(4);
    for c in cubic_numbers {
        let mut digits: Vec<i32> = c.to_string().chars().map(|c| c as i32 - 48).collect();
        println!("{:?}", digits);
        let len_digits = digits.len();
        let it = digits.into_iter().permutations(4);
        for i in it {
            println!("{:?}", i);
        }
    }
}