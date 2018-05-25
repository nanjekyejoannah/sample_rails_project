# Base image
FROM ruby:2.5.1

#RUN mkdir /myapp

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /myapp
WORKDIR /myapp

RUN RAILS_ENV=production bundle exec rake assets:precompile --trace
CMD ["rails","server","-b","0.0.0.0"]