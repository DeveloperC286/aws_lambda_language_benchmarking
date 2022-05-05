import { check } from 'k6';
import http from 'k6/http';
import crypto from 'k6/crypto';

export default function() {
    // Given
    const payload = JSON.stringify({
        input: crypto.sha256(crypto.randomBytes(42), 'hex'),
    });
    const params = {
        headers: {
            'Content-Type': 'application/json',
        },
    };

    // When
    let response = http.post(`${__ENV.URL}`, payload, params);

    // Then
    check(response, {
        'is status 200': (r) => r.status === 200,
    });
};
