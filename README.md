# Thyme Capsule

This service provides user authentication and state syncing for the [Thyme](https://github.com/Gaya/thyme) time tracking app.

Run this service on your own server or used the hosted version on [https://usethyme.com](https://github.com/Gaya/thyme).

### Starting the service
`$ npm start`

### Running linting and tests
`$ npm test`

## Running your own instance

This repository has deployment setup for deploying on [Heroku](https://www.heroku.com/) or Herokish systems like [dokku](http://dokku.viewdocs.io/dokku/).

Make sure you link a database container using MySQL or MariaDB and expose the connection URL as the `DATABASE_URL` environment variable.

Set the [environment variables](#available-environment-variables) when running in production for security, especially the encryption key and JWT secret.

Read more about connecting the Thyme app to your instance in the [Thyme docs](https://github.com/Gaya/thyme).

## Available environment variables

Create a `.env` file in the root of the project and it will be used to extend `process.env`.

```
ENV=production/development/test
PORT=5000
ENCRYPTION_KEY=secret-key-for-encryption
SALT_ROUNDS=10
DATABASE_URL=database://connection-url
JWT_SECRET=jwt-hash-secret
APP_PACKAGE_LOCATION=https://raw.githubusercontent.com/ThymeApp/thyme/master/package.json
STRIPE_KEY=stripe-secret-key
STRIPE_PLAN_EUR=stripe-plan-id
STRIPE_PLAN_USD=stripe-plan-id
STRIPE_WEBHOOK_SIGNATURE=stripe-webhook-signing-secret
MAILGUN_DOMAIN=mg.usethyme.com
MAILGUN_API_KEY=secret-key
SENTRY_DSN=sentry-dns
```

### Create encryption key

```
python -c 'import secrets,sys; sys.stdout.write(secrets.token_urlsafe(24))' | xsel -ib
```

## Run
```
docker run --rm -it -v $PWD/.env:/app/.env -v /var/run/postgresql:/var/run/postgresql -v $PWD/src:/app/src -v $PWD/database.json:/app/database.json -v $PWD/sequelizerc:/app/.sequelizerc -v $PWD/.babelrc:/app/.babelrc -p 5000:5000 -v $PWD/tmp:/app/tmp thyme-capsule
```
