FROM postgres

RUN localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8
ENV LANG ja_JP.UTF-8

ADD ./docker-entrypoint-initdb.d/*.sql /docker-entrypoint-initdb.d/

# ポート5432を開ける
EXPOSE 5432