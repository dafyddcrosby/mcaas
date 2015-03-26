# VERSION 0.1
# DOCKER-VERSION 1.4.1

FROM ruby:2.2.1

# Moving the Gemfile outside of the app workdir means bundle gets cached
ADD Gemfile /tmp/Gemfile
RUN bundle install --gemfile /tmp/Gemfile && \
    rm /tmp/Gemfile

ADD . /opt/mcaas
WORKDIR /opt/mcaas

EXPOSE 4567
CMD [ "ruby","./mcaas.rb","-o","0.0.0.0" ]
