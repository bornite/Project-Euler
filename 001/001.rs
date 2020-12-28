use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    let n: i64 = args[1].parse().unwrap();
    let s: i64 = sum_of_multiples_of_three_and_five(n);
    println!("{}", s);
}

fn sum_of_multiples_of_three_and_five(n: i64) -> i64 {
    let s: i64 = (1..n).filter(|&i| i % 3 == 0 || i % 5 == 0).sum();
    return s;
}

