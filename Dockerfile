FROM ruby:2.5

ENV NODE_URL="https://deb.nodesource.com/setup_10.x"\
	PORT="3000" \
	SECRET_KEY_BASE="REDACTED" \
	RAILS_MAX_THREADS="5" \
	BUNDLE_GEMFILE="/opt/app/Gemfile" \
	WORKDIR="/opt/app" \
	RAILS_ENV="production" \
	RACK_ENV="production" \
	RAILS_SERVE_STATIC_FILES="true"

EXPOSE $PORT

WORKDIR $WORKDIR

RUN curl -sL $NODE_URL | bash - \
	&& apt-get update -qq \
	&& apt-get install -y \
		build-essential \
		default-libmysqlclient-dev \
		nodejs \
		npm \
	&& npm install yarn -g

COPY Gemfile* ./

RUN bundle install \
	--jobs 20 \
	--retry 5 \
	--without \
		development \
		test

COPY . .

RUN bundle exec rake assets:precompile

CMD ["/opt/app/bin/entrypoint"]
