fn sum_of_digit_fifth_powers(n: u64) -> u64 {
    let sum: u64 = n.to_string().chars().map(|c| (c as u64 - 48).pow(5)).sum();
    return sum;
}

fn main() {
    let mut sum: u64 =  0;
    for n in 2..999999 {
        if n == sum_of_digit_fifth_powers(n) {
            sum += n;
            println!("{}", n);
        }
    }
    println!("{}", sum);
}