use lambda_runtime::{error::HandlerError, lambda, Context};
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

fn main() -> Result<(), Box<dyn std::error::Error>> {
    lambda!(handler);
    Ok(())
}

fn handler(request: Request, _: Context) -> Result<Response, HandlerError> {
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
                            body: format!("{:x}", Sha256::digest(input.as_bytes())),
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
