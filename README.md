# Jupiter

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [Heroku Local]:

    % heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)

## Development

To run the application locally, use Docker Compose:

```
docker-compose up
```

The application container will respond on `http://localhost:3000`.

## Deployment to Kubernetes

### Create secrets

```bash
kubectl create secret generic jupiter-secrets \
  --from-literal=secret-key-base=$(bundle exec rake secret | base64) \
  --from-literal=postgres-db=jupiter \
  --from-literal=postgres-user=jupiter \
  --from-literal=postgres-password=s3cr3t
```

### Create PersistentVolume

TODO: explain

### Run deployment

TODO: explain


### Configuration

Environment variables:

* `APPLICATION_HOST`: Production hostname of the application
