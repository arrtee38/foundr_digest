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

rails g model CreateUserSubmissions email first_name last_name website job_role text status

## Users
If a user exists, it has a pair to a UserSubmission with status 'approved'

- email
- first_name
- last_name
- website
- job_role
- user_submission_id # MAYBE

## Projects

- title
- description
- avatar_url (example: https://www.website.com/favicon.ico)
- user_id (ex: 5)

rails g model title description avatar_url user:references

## StakeholderUpdates

- content
- digest_id (which Digest does this update belong to?)

rails g model StakeholderUpdate title  content digest_id project:references

## Subscriptions
Subscribers are users with a relationship to other users.

- digest_id (ex: 5)
- user_id (ex: 2)

rails g model Subscription project:references user:references
