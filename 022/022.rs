fn get_char_socre(c: char) -> u64 {
    return (c as u64) - ('A' as u64) + 1;
}

fn sum_of_scores(names: Vec<&str>) -> u64 {
    let sum: u64 = names
        .iter()
        .enumerate()
        .map(|(i, name)| {
            let value: u64 = name.chars()
                .skip(1)
                .take(name.len() - 2)
                .map(|c| get_char_socre(c) )
                .sum();
            ((i + 1) as u64) * value
        })
        .sum();
    return sum;
}

fn main() {
    let mut names: Vec<&str> = include_str!("names.txt").split(',').collect();
    names.sort();
    println!("{:?}", names);
    println!("{}", sum_of_scores(names));
}