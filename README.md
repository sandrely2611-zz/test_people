# README

Hey there! 

In order to have this project setup and running do as follow:

### Development

```
$ bundle install
$ bin/rake db:setup
$ yarn install
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

### People Endpoint 
To see the people list to the root path, or click on the Salesloft logo in the navigation bar
```
localhost:3000/characters
```

To see the character counter go to: 
```
localhost:3000/characters
```

To see the character counter go to: 
```
localhost:3000/duplicated_emails
