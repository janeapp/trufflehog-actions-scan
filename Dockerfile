FROM python:3.7-alpine

LABEL repository="https://github.com/janeapp/trufflehog-actions-scan"
LABEL homepage="https://github.com/actions"

RUN apk add --no-cache git less
RUN pip install truffleHog==2.2.1

COPY entrypoint.sh /entrypoint.sh
COPY regexes.json /regexes.json

ENTRYPOINT ["sh", "/entrypoint.sh"]
