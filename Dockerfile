FROM ubuntu:16.10

RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    apt-get install -y byobu curl git htop man unzip vim wget && \
    apt-get install -y nodejs npm apache2 && \
    apt-get install -y postgresql postgresql-contrib postgresql-client && \
    apt-get install -y python-software-properties software-properties-common && \
    rm -rf /var/lib/apt/lists/*


ENV HOME /var/www/
WORKDIR /var/www/

RUN rm -rf html/ && \
    git clone https://github.com/harrisbmark/ecen390_lasertag.git && \
    mv ecen390_lasertag/ html/ && \
    cd html && \
    npm install

RUN ln -s /usr/bin/nodejs /usr/bin/node    

EXPOSE 3000

USER postgres

RUN /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker && \
    psql --command "CREATE USER lasertag WITH PASSWORD 'bgt56yhn';" &&\
    createdb -O lasertag lasertag

RUN echo "host all all 0.0.0.0/0  md5" >> /etc/postgresql/9.5/main/pg_hba.conf

RUN echo "listen_addresses='*'" >> /etc/postgresql/9.5/main/postgresql.conf

EXPOSE 5432

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/usr/lib/postgresql/9.5/bin/postgres", "-D", "/var/lib/postgresql/9.5/main", "-c", "config_file=/etc/postgresql/9.5/main/postgresql.conf"]