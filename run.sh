#!/bin/bash

cat <<EOCREDS > /scalr-reporting/creds.json
{
    "api_url": "$API_URL",
    "api_key_id": "$API_KEY_ID",
    "api_key_secret": "$API_KEY_SECRET"
}
EOCREDS

python /scalr-reporting/scalr-reporting.py /scalr-reporting/creds.json
