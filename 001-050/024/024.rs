fn permutate<T>(sequence: &mut [T])
where
    T: Ord,
{
    if sequence.len() < 2 {
        return;
    }

    let mut i = sequence.len() - 1;
    while i > 0 && sequence[i - 1] >= sequence[i] {
        i -= 1;
    }

    if i == 0 {
        return;
    }

    let mut j = sequence.len() - 1;
    while j >= i && sequence[j] <= sequence[i - 1] {
        j -= 1;
    }

    sequence.swap(j, i - 1);
    sequence[i..].reverse();
}

fn main() {
    let mut digits: Vec<char> = "0123456789".chars().collect();
    for _ in 1..1_000_000 {
        permutate(&mut digits);
    }
    println!("{}", digits.iter().collect::<String>());
}
