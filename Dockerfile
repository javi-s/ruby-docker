FROM ruby:2.4.2

# Dependencies
RUN apt-get update && apt-get install -y nodejs sqlite3 postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Main working directory
WORKDIR /usr/src/app/

# Copy Gemfile and install
COPY Gemfile* ./
RUN bundle install

# Copy the app
COPY . ./

# Expose port 3000
EXPOSE 3000

# Launching rails server
WORKDIR /usr/src/app/app

# Configure "bundle exec" as default
ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server", "-b", "0.0.0.0"]
