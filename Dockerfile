FROM alpine:3.7

ENV	PORT="3000" \
	SECRET_KEY_BASE="REDACTED" \
	RAILS_MAX_THREADS="5" \
	BUNDLE_GEMFILE="/opt/app/Gemfile" \
	WORKDIR="/opt/app" \
	RAILS_ENV="production" \
	RACK_ENV="production" \
	RAILS_SERVE_STATIC_FILES="true" \
	BUILD_PACKAGES="bash curl-dev ruby-dev build-base mariadb-dev yarn libffi-dev tzdata" \
	RUBY_PACKAGES="ruby ruby-io-console ruby-bundler ruby-bigdecimal"


EXPOSE $PORT

WORKDIR $WORKDIR

RUN	apk update \
	&& apk upgrade \
	&& apk add --no-cache $BUILD_PACKAGES \
	&& apk add --no-cache $RUBY_PACKAGES \
	&& rm -rf /var/cache/apk/* \
	&& npm install yarn -g

COPY Gemfile* ./

RUN bundle install \
	--jobs 20 \
	--retry 5 \
	--without \
		development \
		test

COPY . .

RUN bundle exec rake assets:precompile --trace

CMD ["/opt/app/bin/entrypoint"]
