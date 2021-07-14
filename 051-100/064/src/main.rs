use std::collections::BTreeSet;

fn cont_fraction_len(num: u32) -> usize {
    let mut m = 0;
    let mut d = 1;
    let a_0 = (num as f32).sqrt() as u32;
    let mut a = a_0;
    let mut n_frac = 1;

    while a != 2*a_0 {
        m = d*a - m;
        d = (num - m*m)/d;
        a = (a_0 + m)/d;
        n_frac += 1;
    }
    n_frac
}

fn main() {
    let squares: BTreeSet<u32> = (1..100+1).map(|x| x*x).collect();

    println!("{}",
        (1..10_000+1)
            .filter(|n| (n-1)%4 == 0 || (n-2)%4 == 0 ) // fast square pre-check
            .filter(|n| !squares.contains(n))
            .filter(|&n| (cont_fraction_len(n) - 1) % 2 == 1)
            .count()
    )
}