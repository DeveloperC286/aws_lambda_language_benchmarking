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

                if type(input) == str:
                    input = input.encode('utf-8')
                    hash = hashlib.sha256(input).hexdigest()

                    return {
                        'statusCode': 200,
                        'body': hash
                    }

                return {
                    'statusCode': 400,
                    'body': 'The input within the request body is not a String.'
                }

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
