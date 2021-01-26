use sha2::{Digest, Sha256};
use structopt::StructOpt;

#[derive(StructOpt, Debug)]
#[structopt(name = "aws-lambda-benchmarking")]
struct Args {
    #[structopt(short, long)]
    input: String,
}

fn main() {
    let args = Args::from_args();
    println!("{:x}", Sha256::digest(args.input.as_bytes()));
}
