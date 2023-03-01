FROM ruby:3.1.2-alpine

RUN mkdir -p /home/app
WORKDIR /home/app

# The files will be owned by app
COPY Gemfile /home/app/
COPY Gemfile.lock /home/app/

RUN gem install bundler -v 2.4.7

RUN bundle install

COPY . /home/app/

# CMD ["rackup", "-p", "8080"]
CMD ["rackup"]