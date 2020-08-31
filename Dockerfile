FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /api
WORKDIR /api
COPY Gemfile /api/Gemfile
COPY Gemfile.lock /api/Gemfile.lock
RUN gem install bundler
RUN bundle update --bundler
RUN bundle install
COPY . /api

# RUN bundle exec rails db:create

# RUN bundle exec rails db:migrate

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]