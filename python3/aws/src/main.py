#!/usr/bin/env python3

import json
import hashlib


def lambda_handler(event, context):
    input = event['input'].encode('utf-8')
    hash = hashlib.sha256(input).hexdigest()
    return {
        'message' : hash
    }
