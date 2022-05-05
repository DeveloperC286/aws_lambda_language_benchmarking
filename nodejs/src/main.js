const crypto = require('crypto');

exports.handler = (event, context, callback) => {
    if (typeof event.body !== 'undefined' && event.body) {
        let trimmedBody = event.body.trim();

        if (trimmedBody !== '{}' && trimmedBody !== '') {
            let input = null;

            try {
                input = JSON.parse(trimmedBody).input;
            } catch (e) {
                callback(null, {
                    "isBase64Encoded": false,
                    "statusCode": 400,
                    "headers": {},
                    "body": "The request body is not valid JSON."
                });
            }

            if (typeof input !== 'undefined' && input) {
                if (typeof input === 'string' || input instanceof String) {
                    callback(null, {
                        "isBase64Encoded": false,
                        "statusCode": 200,
                        "headers": {},
                        "body": hashInput(input)
                    });
                }

                callback(null, {
                    "isBase64Encoded": false,
                    "statusCode": 400,
                    "headers": {},
                    "body": "The input within the request body is not a String."
                });
            }

            callback(null, {
                "isBase64Encoded": false,
                "statusCode": 400,
                "headers": {},
                "body": "No input within the request body."
            });
        }

        callback(null, {
            "isBase64Encoded": false,
            "statusCode": 400,
            "headers": {},
            "body": "Empty request body."
        });
    }

    callback(null, {
        "isBase64Encoded": false,
        "statusCode": 400,
        "headers": {},
        "body": "No request body."
    });
}

function hashInput(input) {
    var output = crypto.createHash('sha256').update(input).digest();

    for (const _ in [...Array(99998).keys()]) { // eslint-disable-line no-unused-vars
        output = crypto.createHash('sha256').update(output).digest();
    }

    return crypto.createHash('sha256').update(output).digest('hex');
}