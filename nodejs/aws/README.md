# AWS Lambda Language Benchmarking - Node.js

## AWS Lambda - Zip File

In order to ship the Node.js source code to AWS for usage in a Lambda the source code needs correctly zipped up, along with the Lambda layers dependencies.

Fortunately there are no external dependencies only core Node.js functions are used, so just the source code needs correctly zipped up.

```sh
cd src/
zip -r lambda_function.zip main.js
```

The zip file `lambda_function.zip` can then be uploaded for usage as a Node.js AWS Lambda.
