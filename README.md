# README

This is the backend that hosts The Big List, the list of all University of Chicago Scavenger Hunt items. It is built in Rails with a Postgresql Database.

# Setup

Ensure your environment is set up with ruby installed, rails installed, and postgresql installed and running if you would like to develop locally.

# Testing

We use rspec for our test suite. Call `rspec` to ensure all tests pass before deploying.

# Linting

We use rubocop for linting. Call `rubocop` to ensure your code matches our coding conventions. Call `rubocop -a` to correct any autocorrectable offenses.

# Accessing the Google Sheets Implementation

## Setup

You need to set up a google_config.json in the root directory with data from a Google Cloud API project. Get this by creating a service account for an active Google Cloud API project here: https://console.cloud.google.com/projectselector2/iam-admin/serviceaccounts.

The json file should look like this:

```json
{
  "type": "service_account",
  "project_id": "censored",
  "private_key_id": "super secret",
  "private_key": "very long, very profane string",
  "client_email": "it's an iam email",
  "client_id": "some numbers",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/some more shit"
}
```

I forgot exactly how I created or downloaded this and ripped the one we're using for my local version and our heroku version from my wedding website. It's left as an exercise to the reader.
