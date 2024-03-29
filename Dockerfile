FROM ruby:3.1.2
RUN mkdir -p /usr/apt/keyrings \
 && wget -q -O /usr/apt/keyrings/google.pub https://dl-ssl.google.com/linux/linux_signing_key.pub \
 && echo "deb [signed-by=/usr/apt/keyrings/google.pub] https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
 && curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
 && apt-get install -qq --no-install-recommends       \
      nodejs google-chrome-stable imagemagick postgresql-client libgeos-dev \
 && apt-get upgrade -qq \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && npm install -g npm yarn \
 && echo \
 && sed 's/ \\n \\l//;q' /etc/issue \
 && RUBY=$(ruby --version |sed -E 's/[^0-9]*([0-9.]+).*/ruby-\1/')             \
 && NODE=$(node --version |sed -E 's/[^0-9]*([0-9]+\.[0-9]+).*/node-\1/')      \
 && CHROME=$(google-chrome --version |sed -E 's/[^0-9]*([0-9]+).*/chrome-\1/') \
 && echo "${RUBY}_${NODE}_${CHROME}\n"
