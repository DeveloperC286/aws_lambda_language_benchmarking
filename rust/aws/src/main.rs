use lambda_runtime::{service_fn, Error, LambdaEvent};
use serde_derive::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

#[derive(Deserialize)]
struct Request {
    body: Option<String>,
}

#[derive(Deserialize)]
struct Body {
    input: Option<String>,
}

#[derive(Serialize)]
struct Response {
    #[serde(rename = "isBase64Encoded")]
    is_base64_encoded: bool,
    #[serde(rename = "statusCode")]
    status_code: u16,
    body: String,
}

#[tokio::main]
async fn main() -> Result<(), Error> {
    lambda_runtime::run(service_fn(handler)).await?;
    Ok(())
}

async fn handler(event: LambdaEvent<Request>) -> Result<Response, Error> {
    let (request, _) = event.into_parts();
    match request.body {
        Some(body) => match body.trim() {
            "" | "{}" => Ok(Response {
                is_base64_encoded: false,
                status_code: 400,
                body: "Empty request body.".to_string(),
            }),
            _ => {
                let parsed_body: Result<Body, serde_json::Error> = serde_json::from_str(&body);
                match parsed_body {
                    Ok(parsed_body) => match parsed_body.input {
                        Some(input) => Ok(Response {
                            is_base64_encoded: false,
                            status_code: 200,
                            body: hash_input(input),
                        }),
                        None => Ok(Response {
                            is_base64_encoded: false,
                            status_code: 400,
                            body: "No input within the request body.".to_string(),
                        }),
                    },
                    Err(error) => Ok(Response {
                        is_base64_encoded: false,
                        status_code: 400,
                        body: format!("{}", error),
                    }),
                }
            }
        },
        None => Ok(Response {
            is_base64_encoded: false,
            status_code: 400,
            body: "No request body.".to_string(),
        }),
    }
}

fn hash_input(input: String) -> String {
    let mut output = Sha256::digest(input.as_bytes());

    for _ in 1..100000 {
        output = Sha256::digest(output);
    }

    output.iter().map(|b| format!("{b:02x}")).collect()
}
