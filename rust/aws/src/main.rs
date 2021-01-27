use lambda_runtime::{error::HandlerError, lambda, Context};
use serde_derive::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

#[derive(Deserialize)]
struct Body {
    input: String,
}

#[derive(Serialize)]
struct Response {
    body: String,
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    lambda!(handler);
    Ok(())
}

fn handler(body: Body, _: Context) -> Result<Response, HandlerError> {
    Ok(Response {
        body: format!("{:x}", Sha256::digest(body.input.as_bytes())),
    })
}
