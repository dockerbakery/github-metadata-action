FROM alpine:latest

# Mount the secrets and print their contents
# See https://docs.docker.com/reference/dockerfile/#run---mounttypesecret
RUN --mount=type=secret,id=GITHUB_ENV cat /run/secrets/GITHUB_ENV
# RUN --mount=type=secret,id=GITHUB_EVENT_PATH cat /run/secrets/GITHUB_EVENT_PATH
RUN --mount=type=secret,id=GITHUB_OUTPUT cat /run/secrets/GITHUB_OUTPUT

# Use arguments provided at build time and print them
# See https://docs.docker.com/reference/dockerfile/#arg
ARG GITHUB_ACTOR
RUN echo $GITHUB_ACTOR
