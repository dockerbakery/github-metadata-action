FROM alpine:latest

RUN --mount=type=secret,id=GITHUB_ENV cat /run/secrets/GITHUB_ENV
RUN --mount=type=secret,id=GITHUB_EVENT_PATH cat /run/secrets/GITHUB_EVENT_PATH
RUN --mount=type=secret,id=GITHUB_OUTPUT cat /run/secrets/GITHUB_OUTPUT
