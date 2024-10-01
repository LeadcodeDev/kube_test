FROM dart:stable AS build

WORKDIR /app

COPY . /app

WORKDIR /app

RUN dart pub get
RUN dart compile exe src/main.dart -o mineral

FROM scratch
COPY --from=build /runtime /
COPY --from=build /app/mineral /app/
COPY --from=build /app/pubspec.yaml /

CMD ["/app/mineral"]
