use std::cmp::max;

fn largest_palindrome_from_product_of_two_numbers() -> i64 {
    let mut largest = 0;
    for i in (100..1000).rev() {
        for j in (i..1000).rev() {
            let num = i * j;
            if is_palindrome(num) {
               largest = max(largest, num);
            }
        }
    }
    largest
}

fn is_palindrome(n: i64) -> bool {
    let num_str = n.to_string();
    let reversed_num_str = num_str.chars().rev().collect::<String>();
    num_str == reversed_num_str
}

fn main() {
    println!("{}", largest_palindrome_from_product_of_two_numbers());
}

