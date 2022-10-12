FROM ruby:3.1.2
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
 && npm i -g npm \
 && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
 && echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
 && apt-get update -qq && apt-get install -qq --no-install-recommends \
      nodejs google-chrome-stable imagemagick postgresql-client       \
 && apt-get upgrade -qq \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && npm install -g yarn \
 && echo "Helpful information: \n$(cat /etc/issue) \n$(ruby --version) \nnode $(node -v) \n$(google-chrome --version)"
