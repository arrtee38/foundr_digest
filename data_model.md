## Table Name Here

- attribute_name (data type)

## UserSubmissions
If a submission is approved, we will map the fields to a User record.

- email
- first_name
- last_name
- website
- job_role
- text
- status (pending, approved, rejected)
- user_id # MAYBE

## Users
If a user exists, it has a pair to a UserSubmission with status 'approved'

- email
- first_name
- last_name
- website
- job_role
- user_submission_id # MAYBE

## Digests

- title
- description
- avatar_url (example: https://www.website.com/favicon.ico)
- user_id (ex: 5)

## StakeholderUpdates

- content
- digest_id (which Digest does this update belong to?)

## Subscriptions
Subscribers are users with a relationship to other users.

- digest_id (ex: 5)
- user_id (ex: 2)
