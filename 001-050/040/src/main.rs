fn main() {
    let mut string = "0.".to_string();

    /*
    Single digit number : 9
    Two-digit number    : 99 - 9 = 90
    3-digit number      : 999 - 99 = 900
    4-digit number      : 9999 - 999 = 9000
    ...
    All characters in numbers of 5 digits or less -> 9 * 1 + 90 * 2 + 900 * 3 + 9000 * 4 + 90000 * 5 = 488889 characters
    Number of characters in the number between 100,000 and 200,000 -> 100_001 * 6 = 600006 characters
    Therefore, Number of characters less than or equal to 200,000 = 1,088,895 characters
    */
    for int in 1..200_000 { string.push_str( &int.to_string() ) }

    let mut product = 1;
    for i in 1..6+1 {
        let position = 10usize.pow(i) + 1;
        let digit: u64 = string[position..position+1].parse().ok().expect("");
        product *= digit;
    }
    println!("{}", product);
}
