#!/bin/bash

echo "Checking for '<TODO>' in *-secret.yaml files..."

find . -name "*-secret.yaml" -print0 | xargs -0 grep -l "<TODO>"

if [ $? -eq 0 ]; then
    echo "Found '<TODO>' in the files listed above."
    exit 1
else
    echo "No '<TODO>' found in *-secret.yaml files. All good!"
fi

find . -type f -name "*-secret.yaml" | while read -r secret_file; do
    echo "Processing: $secret_file"

    sealedsecret_file="${secret_file//-secret.yaml/-sealedsecret.yaml}"

    echo "Processing: $sealedsecret_file"

    kubeseal --format=yaml < "$secret_file" > "$sealedsecret_file"
done
exit 0
