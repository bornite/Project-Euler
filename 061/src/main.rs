pub struct Permutations<'a, T> {
    elems: &'a [T],
    idxs: Vec<usize>,
    cycles: Vec<usize>,
    consumed: bool,
}

impl<'a, T: 'a> Permutations<'a, T> {
    /// Creates a new `Permutations` iterator
    ///
    /// # Example
    ///
    /// ```
    /// use iter::Permutations;
    /// let nums = &[1, 2, 3];
    /// let mut it = Permutations::new(nums, 2);
    /// assert_eq!(Some((vec![1, 2], vec![3])), it.next());
    /// ```
    pub fn new(elems: &'a [T], n: usize) -> Permutations<'a, T> {
        let cycles = if n <= elems.len() {
            (0..n).map(|x| elems.len() - x).collect()
        } else {
            vec![]
        };
        Permutations {
            elems,
            idxs: (0..elems.len()).collect(),
            cycles,
            consumed: n > elems.len(),
        }
    }
}

impl<'a, T: Clone> Iterator for Permutations<'a, T> {
    type Item = (Vec<T>, Vec<T>);

    fn next(&mut self) -> Option<(Vec<T>, Vec<T>)> {
        if self.consumed {
            return None;
        }

        let n = self.cycles.len();
        let perm = self.idxs[..n]
            .iter()
            .map(|&i| self.elems[i].clone())
            .collect();
        let rest = self.idxs[n..]
            .iter()
            .map(|&i| self.elems[i].clone())
            .collect();

        if n == 0 {
            self.consumed = true;
            return Some((perm, rest));
        }

        loop {
            for i in (0..n).rev() {
                self.cycles[i] -= 1;
                if self.cycles[i] == 0 {
                    let p = self.idxs.remove(i);
                    self.idxs.push(p);
                    self.cycles[i] = self.elems.len() - i;
                    if i == 0 {
                        self.consumed = true;
                        return Some((perm, rest));
                    }
                } else {
                    let j = self.cycles[i];
                    let len = self.idxs.len();
                    let (p, q) = (self.idxs[i], self.idxs[len - j]);
                    self.idxs[i] = q;
                    self.idxs[len - j] = p;
                    return Some((perm, rest));
                }
            }
        }
    }
}

fn triangle(n: u32) -> u32 {
    n * (n + 1) / 2
}
fn square(n: u32) -> u32 {
    n * n
}
fn pentagonal(n: u32) -> u32 {
    n * (3 * n - 1) / 2
}
fn hexagonal(n: u32) -> u32 {
    n * (2 * n - 1)
}
fn heptagonal(n: u32) -> u32 {
    n * (5 * n - 3) / 2
}
fn octagonal(n: u32) -> u32 {
    n * (3 * n - 2)
}

fn create_map(fs: &[fn(u32) -> u32]) -> Vec<Vec<Vec<u32>>> {
    fs.iter()
        .map(|&f| {
            let mut result = (0..100)
                .map(|_| Vec::with_capacity(100))
                .collect::<Vec<_>>();
            for i in 1.. {
                let n = f(i);
                if n > 9999 {
                    break;
                }

                if n < 1000 {
                    continue;
                }
                let (hi, lo) = (n / 100, n % 100);
                if lo < 10 {
                    continue;
                }

                result[hi as usize].push(lo);
            }
            result
        })
        .collect()
}

fn find_cycle(map: &mut [Vec<Vec<u32>>]) -> Vec<Vec<u32>> {
    let head = &map[map.len() - 1];

    let mut result = vec![];
    for (maps, _) in Permutations::new(&map[..map.len() - 1], map.len() - 1) {
        for (lst, fsts) in head.iter().enumerate() {
            for &fst in fsts {
                for mut v in find_chain(fst, lst as u32, &maps) {
                    v.push(fst);
                    result.push(v)
                }
            }
        }
    }
    result
}

fn find_chain(fst: u32, lst: u32, maps: &[Vec<Vec<u32>>]) -> Vec<Vec<u32>> {
    if maps.is_empty() {
        if fst == lst {
            return vec![vec![]];
        }
        return vec![];
    }

    let mut result = vec![];
    for &n in &maps[0][fst as usize] {
        for mut v in find_chain(n, lst, &maps[1..]) {
            v.push(n);
            result.push(v)
        }
    }
    result
}

fn cycle_to_nums(map: &[u32]) -> Vec<u32> {
    let mut result = map.to_vec();
    for (i, &n) in map[1..].iter().enumerate() {
        result[i] += 100 * n
    }
    result[map.len() - 1] += 100 * map[0];
    result
}

fn solve() -> String {
    let map: &[fn(u32) -> u32] = &[
        triangle, square, pentagonal, hexagonal, heptagonal, octagonal,
    ];
    find_cycle(&mut create_map(map))
        .iter()
        .map(|vs| cycle_to_nums(&vs).into_iter().sum::<u32>())
        .sum::<u32>()
        .to_string()
}

fn main() {
    println!("{}", solve());
}