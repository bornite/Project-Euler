fn sum_of_divisors(n: usize) -> usize {
    let mut result = 0;
    let max = 1 + (n as f64).sqrt() as usize;
    for i in 2..max {
        if n % i == 0 {
            let x = n / i;
            if x == i {
                result += i;
            } else {
                result += i + x;
            }
        }
    }
    1 + result
}

fn main() {
    let max = 28123;
    let abundant_numbers: Vec<usize> = (2..max + 1).filter(|&n| sum_of_divisors(n) > n).collect();
    let mut abundant_sums = vec![false; 2 * max + 1];
    for i in 0..abundant_numbers.len() {
        for j in i..abundant_numbers.len() {
            abundant_sums[abundant_numbers[i] + abundant_numbers[j]] = true;
        }
    }
    let sum: usize = (1..max + 1).filter(|&i| !abundant_sums[i]).sum();
    println!("{}", sum);
}