FROM alpine:3.15

ADD entrypoint.sh /entrypoint.sh

RUN \
    chmod +x /entrypoint.sh && \
    apk add --no-cache python2 gettext && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools && \
    pip install Django>=1.9 gunicorn django-grappelli==2.8.1 django-solo-grappelli>=1.1.2 django-loginas==0.3.1 && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/entrypoint.sh"]
