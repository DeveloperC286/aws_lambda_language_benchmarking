# AWS Lambda Language Benchmarking - Rust

## AWS Lambda - Zip File
To prepare the Rust source code to be used in an AWS Lambda, the source code needs to be compiled to a binary and then zipped up.
Rust has no provided runtime so using the `provided.al2` runtime so you must name the binary `bootstrap`.

While Rust does compile a static binary by default, the standard library is dynamically linked to libc.
Dynamic linking can create incompatibility issues, so you want a fully static binary for the provided runtime.
The easiest way to achieve this is by using the tool  Cross, which compiles the target `x86_64-unknown-linux-musl` inside a Docker image.

```
cargo install cross
cross build --target x86_64-unknown-linux-musl --release
cp target/x86_64-unknown-linux-musl/release/aws_lambda_benchmarking bootstrap
zip lambda_function.zip bootstrap
```

The zip file `lambda_function.zip` can then be uploaded for usage as a Rust AWS Lambda using a provided runtime.
