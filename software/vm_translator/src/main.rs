use std::env;

use vm_translator::vm_translator;

fn main() {
    println!("Translation from vm code to hack assembly code!");
    vm_translator(env::args());
}
