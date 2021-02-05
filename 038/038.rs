pub fn places(n: u64) -> u32 {
    (n as f64).log(10f64) as u32 + 1
}

fn no_repeats(n: usize, digits: &mut [bool]) -> bool {
    let mut pan = true;
    let mut nc = n;
    while nc > 0 {
        let d = nc % 10;
        if digits[d] {
            pan = false;
            break;
        } else {
            digits[d] = true;
        }
        nc = nc / 10;
    }
    pan
}

pub fn pan_ok(n: u64) -> bool {
    let mut digits = [false; 10];
    digits[0] = true;
    no_repeats(n as usize, &mut digits)
}

pub fn pandigital_multiple(n: u64) -> u64 {
    let mut n = n;
    let mut m = 2;
    while places(n) < 9 {
        let next_multiple = m * n;
        n *= 10u64.pow(places(next_multiple));
        n += next_multiple;
        m += 1;
    }
    if places(n) > 10 {
        return 0;
    }

    match pan_ok(n) {
        true => n,
        _ => 0,
    }
}

pub fn main() {
    let digits: [u64; 9] = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    let c1 = 9;
    let mut highest = 0;
    for d in &digits {
        let c2 = 10 * c1 + d;
        let m = pandigital_multiple(c2);
        if m > highest {
            highest = m;
        }
        if pan_ok(c2) {
            for d in &digits {
                let c3 = 10 * c2 + d;
                let m = pandigital_multiple(c3);
                if m > highest {
                    highest = m;
                }
                if pan_ok(c3) {
                    for d in &digits {
                        let c4 = 10 * c3 + d;
                        let m = pandigital_multiple(c4);
                        if m > highest {
                            highest = m;
                        }
                    }
                }
            }

        }
    }
    println!("{}", highest);
}
