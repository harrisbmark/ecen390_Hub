# Pull image for Ubuntu 16.10
FROM ubuntu:16.10

# Update Ubuntu and install necessary modules for application
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


# Set the local environment and home to /var/www
ENV HOME /var/www/
WORKDIR /var/www/

# Remove the current html directory, clone our workspace, and install NodeJS modules
RUN rm -rf html/ && \
    git clone https://github.com/harrisbmark/ecen390_lasertag.git && \
    mv ecen390_lasertag/ html/ && \
    chown www-data:www-data ./ -R && \
    find ./ -type d -exec chmod 755 {} \; && \
    find ./ -type f -exec chmod 644 {} \; && \
    cd html && \
    cd ecen390_lasertag && \
    npm install

# Link the node command to the nodejs command
RUN ln -s /usr/bin/nodejs /usr/bin/node    

# Expose the NodeJS port
EXPOSE 3000

# Change the user to PostgreSQL for the following commands (and to run the SQL script later)
USER postgres

## Create a superuser and our normal lasertag user.
RUN /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker && \
    psql --command "CREATE USER lasertag WITH PASSWORD 'bgt56yhn';" &&\
    createdb -O lasertag lasertag

# Allow the database to be connected remotely
RUN echo "host all all 0.0.0.0/0  md5" >> /etc/postgresql/9.5/main/pg_hba.conf

# Add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.5/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Change to root user
USER root

# Set the default command to run when starting the container
CMD ["/usr/lib/postgresql/9.5/bin/postgres", "-D", "/var/lib/postgresql/9.5/main", "-c", "config_file=/etc/postgresql/9.5/main/postgresql.conf"]