#!/usr/bin/env python3

import json
import hashlib


def lambda_handler(event, context):
    body = event.get('body')

    if body is not None:
        body = body.strip()
        if body != '' and body != '{}':
            try:
                body = json.loads(body)
            except Exception:
                return {
                    'statusCode': 400,
                    'body': 'The request body is not valid JSON.'
                }

            if 'input' in body:
                input = body['input']

                if isinstance(input, str):
                    return {
                        'statusCode': 200,
                        'body': hash_input(input.encode('utf-8'))
                    }

                return {
                    'statusCode': 400,
                    'body': 'The input within the request body is not a String.'}

            return {
                'statusCode': 400,
                'body': 'No input within the request body.'
            }

        return {
            'statusCode': 400,
            'body': 'Empty request body.'
        }

    return {
        'statusCode': 400,
        'body': 'No request body.'
    }


def hash_input(input):
    output = hashlib.sha256(input).digest()

    for x in range(99998):
        output = hashlib.sha256(output).digest()

    return hashlib.sha256(output).hexdigest()
