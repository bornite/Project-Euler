fn get_length_of_terms_collatz_sequence(n: u64) -> u64 {
    let mut i: u64 = n;
    let mut length: u64 = 1;
    loop {
        if i == 1 {
            break;
        }
        if i % 2 == 0 {
            i = i/2;
        }
        else {
            i = 3*i + 1;
        }
        length = length + 1;
    }
    return length;
}

fn main() {
    let mut max_len_of_seqs: (u64, u64); /* (number, Length of the Collatz sequence starting from `number`) */
    max_len_of_seqs = (1, 1);
    for n in 2..1000000+1 {
        let length: u64 = get_length_of_terms_collatz_sequence(n);
        println!("number:{}, terms:{}", n, length);
        if max_len_of_seqs.1 < length {
            max_len_of_seqs = (n, length);
        }
    }
    println!("number:{}, terms:{}", max_len_of_seqs.0, max_len_of_seqs.1);
}