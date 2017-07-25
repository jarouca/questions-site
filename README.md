# Questions Site

A Rails app highlighting CRUD functionality and the use of nested resources by allowing users to submit and answer questions. Features include CRUD functionality for question and answer models, markdown support for users who wish to submit answers or questions in markdown, and a "best" option for users to mark an answer as "best answer".

This project uses the following libraries and frameworks:

- Ruby on Rails

## Setup

This app uses Ruby 2.2.5 and was developed on Ruby on Rails 5.0.3. 

To install, please run the following in your terminal: 

### Set up Rails

```
git clone https://github.com/jarouca/questions-site.git
cd rescue-mission
cd rescue-mission
bundle install
rake db:create
rake db:migrate
```

## Running the application

To run questions-site, please run the following command in your terminal from the rescue-mission directory:

`rails s`

Now open your browser and enter localhost:3000 in your address bar.

## Testing

To run the test suite, please enter the following command from the rescue-mission root directory:

`rspec`
