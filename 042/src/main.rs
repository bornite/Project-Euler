fn word_value(word: &str) -> u64 {
    // all ascii and uppercase, no further checks done
    let offset = 'A' as u64 - 1;
    word.chars().fold(0, |sum, char| sum + (char as u64) - offset)
}

fn main() {
    let input = include_str!("../words.txt").to_string();

    // first 100 triangle numbers
    let triangle_numbers : Vec<_> = (0..100).map(|i| i*(i+1)/2).collect();

    let count = input.split(',')
        .map(|word| word.trim_matches('"'))
        .filter(|word| triangle_numbers.contains(&word_value(word)))
        .count();
    println!("{}", count);
}
