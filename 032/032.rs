use std::collections::HashSet;

fn is_pandigital(a: i32, b: i32) -> bool {
    let c: i32 = a * b;
    let a_string = a.to_string();
    let b_string = b.to_string();
    let c_string = c.to_string();
    let check_string = a_string + &b_string + &c_string;
    let mut check_string_digit = check_string.chars().collect::<Vec<char>>();
    let pandigital_digit = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

    check_string_digit.sort();
    if check_string_digit == pandigital_digit {
        return true;
    }
    else {
        return false;
    }
} 

fn main() {
    let mut pandigitals: Vec<i32> = Vec::new();
    for a in 1..=4999 {
        for b in 1..=99 {
            if is_pandigital(a,b) {
                pandigitals.push(a*b);
            }
        }
    }
    println!("{:?}", pandigitals);
    let pandigitals_uniq: HashSet<i32> = pandigitals.into_iter().collect();
    println!("{:?}", pandigitals_uniq);
    let mut sum: i32;
    sum = 0i32;
    for v in pandigitals_uniq.iter() {
        sum += v;
    }
    println!("{}", sum);
}