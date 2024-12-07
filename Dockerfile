FROM ruby:3.2.2-alpine

# Needed to build nio4r for puma
RUN apk update && apk add --no-cache build-base

# install bundler for ruby dependencies
RUN gem install bundler -v 2.4.10

# copy app
COPY app /home/app

# copy Gemfiles for bundler
COPY Gemfile Gemfile.lock /home/app/
WORKDIR /home/app

RUN bundle install

# Environment settings
ENV APP_ENV="production"
EXPOSE 4567

CMD ["bundle", "exec", "puma", "--port", "4567"]

