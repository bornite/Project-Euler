
fn sum_of_divisors(n: u64) -> u64 {
    let mut divisors = vec![1];
    divisors[0] = 1;
    for i in 2..(n-1){
        if n % i == 0 {
            divisors.push(i);
        }
    }
    let sum: u64 = divisors.iter().sum();
    return sum;
}

fn is_amicable(n: u64) -> bool {
    let ret: bool;
    let sum_of_divisors_of_n: u64 = sum_of_divisors(n);

    if sum_of_divisors_of_n == n {
        return false;
    }
    if sum_of_divisors(sum_of_divisors_of_n) == n {
        ret = true;
    }
    else {
        ret = false;
    }
    return ret;
}

fn main() {
   let sum: u64 = (1..10000)
    .filter(|&n| {
        is_amicable(n) == true
    })
    .sum();
    println!("{}", sum);
}