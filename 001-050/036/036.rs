fn reverse ( mut number : u32, base : u32 ) -> u32 {
    let mut reversed_number = 0;
    while number != 0 {
        reversed_number = reversed_number * base + (number % base);
        number /= base;
    }
    reversed_number
}

fn is_palindrome (number : u32, base : u32 ) -> bool {
    reverse(number, base) == number
}

fn main() {
    let sum = (1..=1_000_000).step_by(2)
        .filter(|&num| is_palindrome(num, 10) && is_palindrome(num, 2) )
        .fold(0, |sum, num| sum+num );
    println!("{}", sum);
}
