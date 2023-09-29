use clap::Parser;
use sha2::{Digest, Sha256};

#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None)]
struct Args {
    #[arg(short, long)]
    input: String,
}

fn main() {
    let args = Args::parse();
    println!("{}", hash_input(args.input));
}

fn hash_input(input: String) -> String {
    let mut output = Sha256::digest(input.as_bytes());

    for _ in 1..100000 {
        output = Sha256::digest(output);
    }

    format!("{:x}", output)
}
