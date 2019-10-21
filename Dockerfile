FROM google/dart-runtime:1

WORKDIR /app

ADD pubspec.* /app/
RUN pub get
ADD . /app
RUN pub get --offline

EXPOSE 8080

CMD []
ENTRYPOINT ["pub", "serve", "--hostname=0.0.0.0"]