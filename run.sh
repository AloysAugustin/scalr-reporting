#!/bin/bash

TEMPFILE=$(mktemp)

szradm -q list-global-variables --format=json > $TEMPFILE




cat <<EOCREDS > /scalr-reporting/creds.json
{
    "api_url": "$(cat $TEMPFILE | jq -r '.variables.values.API_URL')",
    "api_key_id": "$(cat $TEMPFILE | jq -r '.variables.values.API_KEY_ID')",
    "api_key_secret": "$(cat $TEMPFILE | jq -r '.variables.private_values.API_KEY_SECRET')"
}
EOCREDS

python /scalr-reporting/scalr-reporting.py /scalr-reporting/creds.json
