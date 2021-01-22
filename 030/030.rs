fn sum_of_digit_fifth_powers(n: u64) -> u64 {
    let sum: u64 = n.to_string().chars().map(|c| (c as u64 - 48).pow(5)).sum();
    return sum;
}

fn main() {
    let mut sum: u64 =  0;
    let range = 2..999999;
    let result = range.filter(|i| *i == sum_of_digit_fifth_powers(*i)).fold(0, |sum, x| sum + x);
    println!("{}", result);
}