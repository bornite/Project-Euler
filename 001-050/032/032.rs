use std::collections::HashSet;

fn is_pandigital(a: i32, b: i32) -> bool {
    let check_string = a.to_string() + &b.to_string() + &(a*b).to_string();
    let pandigital_digit = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
    let mut check_string_digit = check_string.chars().collect::<Vec<char>>();

    check_string_digit.sort();
    if check_string_digit == pandigital_digit {
        return true;
    }
    else {
        return false;
    }
} 

/*
 possible num of digits combinations
 1 x 1 = 7 : NG 10 * 10 = 100
 1 x 2 = 6 : NG 10 * 100 = 1000
 1 x 3 = 5 : NG 10 * 1000 = 10000
 1 x 4 = 4 : OK
 2 x 2 = 5 : NG 100 * 100 = 10000
 2 x 3 = 4 : OK
 3 x 3 = 3 : NG 100 * 100 = 10000
*/
fn main() {
    let mut pandigitals: Vec<i32> = Vec::new();
    for a in 1..=9 {
        for b in 1000..=9999 {
            if is_pandigital(a,b) {
                pandigitals.push(a*b);
            }
        }
    }
    for a in 10..=99 {
        for b in 100..=999 {
            if is_pandigital(a,b) {
                pandigitals.push(a*b);
            }
        }
    }

    println!("{:?}", pandigitals);
    let pandigitals_uniq: HashSet<i32> = pandigitals.into_iter().collect();
    println!("{:?}", pandigitals_uniq);
    let mut sum: i32 = 0;
    for v in pandigitals_uniq.iter() {
        sum += v;
    }
    println!("{}", sum);
}