use std::env;
use compiler::analyzer;

fn main() {
    println!("Compiling from jack to xml");
    analyzer(env::args())
}
