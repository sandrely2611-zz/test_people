# README

Hey there! 

In order to have this project setup and running do as follow:

### Development

```
$ bundle install
$ bin/rake db:setup
$ bin/rails server
```

### Env variables

To setup the variables the master.key is required. 
Inside the credentials.yml.enc are two values:

```
api_salesloft:
  api_url: xxx
  auth_token: xxx
```

### Test

This project uses Minitest for testing.

```
$ rails test
```
