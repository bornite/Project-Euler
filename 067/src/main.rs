use std::cmp::max;

fn parse(s: &str) -> Vec<Vec<u64>> {
    let mut graph: Vec<Vec<u64>> = s
        .trim()
        .lines()
        .map(|line| line.split(' ').map(|s| s.parse::<u64>().unwrap()).collect())
        .collect();

        return graph;
}

fn find_path(triangle: Vec<Vec<u64>>) -> u64 {
    let mut graph: Vec<Vec<u64>> = triangle;
    for row in (0..(graph.len() - 1)).rev() {
        for i in 0..graph[row].len() {
            graph[row][i] += max(graph[row + 1][i], graph[row + 1][i + 1]);
        }
    }
    return graph[0][0];
}

fn main() {
    // read at compile time from file
	let data = include_str!("triangle.txt");
    let triangle: Vec<Vec<u64>> = parse(data);

    println!("{}", find_path(triangle));
}
