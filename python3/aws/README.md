# AWS Lambda Benchmarking - Python3

## AWS Lambda - Zip File
In order to ship the Python3 source code to AWS for usage in a Lambda the source code needs correctly zipped up, along with the Lambda layers dependencies.

Fortunately there are no external dependencies only core Python3 functions are used, so just the source code needs correctly zipped up.

```
cd src/
zip -r lambda_function.zip main.py
```

The zip file `lambda_function.zip` can then be uploaded for usage as a Python3 AWS Lambda.
