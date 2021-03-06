fn is_pythagorean_number(a: u64, b: u64, c: u64) -> bool {
	return a*a + b*b == c*c
}

fn main() {
    let mut max_solutions = 0;
    let mut p_max_solutions = 0;
    'p:for perimeter in 2..1001 {
        let mut solutions = 0;
        'a:for a in 1..=perimeter/2 {
            'b:for b in a..=perimeter/2 {
                let c = perimeter - a - b;
                if c <= 0 {
			continue 'a;
		}
                if is_pythagorean_number(a, b, c) {
			solutions += 1;
		}
            }
        }
        if solutions > max_solutions {
            max_solutions = solutions;
            p_max_solutions = perimeter
	}
    }
    println!("{}", p_max_solutions);
}
