FROM ruby:3.0.2
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
  && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
  && apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs google-chrome-stable imagemagick postgresql-client  \
  && apt-get upgrade -qq \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*\
  && npm install -g yarn
