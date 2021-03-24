use sha2::{Digest, Sha256};
use structopt::StructOpt;

#[derive(StructOpt, Debug)]
#[structopt(name = "aws_lambda_language_benchmarking")]
struct Args {
    #[structopt(short, long)]
    input: String,
}

fn main() {
    let args = Args::from_args();
    println!("{}", hash_input(args.input));
}

fn hash_input(input: String) -> String {
    let mut output = Sha256::digest(input.as_bytes());

    for _ in 1..100000 {
        output = Sha256::digest(&output);
    }

    format!("{:x}", output)
}
