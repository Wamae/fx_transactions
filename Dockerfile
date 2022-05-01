FROM ruby:3.0.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev && rm -rf /var/cache/apk/*
WORKDIR /app
COPY . /app/
ENV BUNDLE_PATH /gems
#RUN bundle install
RUN ["chmod", "+x", "bin/docker_start.sh"]
ENTRYPOINT ["sh","bin/docker_start.sh"]
#CMD ["s", "-b", "0.0.0.0"]
EXPOSE 3000
