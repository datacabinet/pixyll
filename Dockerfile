FROM nginx:alpine
COPY default.conf /etc/nginx/conf.d/default.conf
RUN apk add ruby ruby-dev build-base zlib-dev
RUN mkdir /usr/share/nginx/html/blog/
RUN mkdir /blog_source
WORKDIR /blog_source
COPY . /blog_source
RUN gem install bundler
RUN bundle install
RUN gem install json bigdecimal
RUN jekyll build --destination=/usr/share/nginx/html/
