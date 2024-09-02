# Build Args
# ARG ELIXIR_VERSION=1.14.3
ARG PHOENIX_VERSION=1.4.0
# ARG NODE_VERSION=14.20.1

FROM elixir:1.14.3-slim

# Install Node.js (required for Phoenix)
RUN apt-get update \
  && apt-get install -y \
      postgresql-client \
      sqlite3 \
      nodejs \
      npm \
      git \
      inotify-tools \
      curl

# Phoenix
RUN mix local.hex --force \
  && mix local.rebar --force \
  && mix archive.install --force hex phx_new 1.5.0

# App Directory
ENV APP_HOME /workspace
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME


# RUN adduser -D vscode
# USER vscode

# App Port
EXPOSE 4000

# Default Command
CMD ["mix", "phx.server"]