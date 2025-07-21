
FROM ruby:3.3.0-bookworm

LABEL author="Lakruzz <lars@lakruzz.com>"
LABEL maintainer="Lakruzz <lars@lakruzz.com>"

WORKDIR /app
EXPOSE 4000

# Liquid must run in UTF-8 env to support BOM characters

RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
    chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
    apt-get update && \
    apt-get install gh -y

RUN apt-get install -y locales && \
    echo "en_US UTF-8" > /etc/locale.gen && \
    locale-gen en_US UTF-8

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_CTYPE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Clean up apt cache to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Add a step where the Gemfile and Gemfile.lock are copied and the bundle is installed
COPY Gemfile Gemfile.lock ./

RUN bundle config set --global frozen true && \
    bundle config set --global path "/usr/local/bundle" && \
    bundle install

RUN rm ./Gemfile ./Gemfile.lock
