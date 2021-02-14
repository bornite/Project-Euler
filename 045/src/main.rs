fn triangle ( n : u64 ) -> u64 { (n*n+n)/2 }
fn pentagon ( n : u64 ) -> u64 { (3*n*n-n)/2  }
fn hexagon  ( n : u64 ) -> u64 { (4*n*n-2*n)/2 }

fn main() {
	let triangle_start = 285+1;
	let mut pentagon_start = 165+1;
	let mut hexagon_start = 143+1;
	'tri:for tr in triangle_start.. {
		let triangle_number = triangle(tr);
		for pen in pentagon_start.. {
			let pentagon_number = pentagon(pen);
			if pentagon_number < triangle_number { 
				//pentagon_start += 1;
				continue 
			} else if pentagon_number > triangle_number { break }
			
			for hex in hexagon_start.. { // pentagon == triangle here
				let hexagon_number = hexagon(hex);
				if hexagon_number < triangle_number {
					//hexagon_start += 1;
				} else if hexagon_number > pentagon_number { break }
				else {
					println!("{},{},{}:{}", tr, pen, hex, triangle_number);
					break 'tri;
				}
			}
		}
		//if tr % 10000 == 0 { println!("{}", triangle_number/2) }
	}
}