#!/bin/bash

URL="http://localhost:3000/health"

echo "Testing health endpoint..."

response=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$response" -eq 200 ]; then
    echo "Health check PASSED"
    exit 0
else
    echo "Health check FAILED - HTTP status: $response"
    exit 1
fi

