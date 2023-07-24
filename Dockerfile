FROM freeradius/freeradius-server:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt-get install -y tzdata
RUN ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && dpkg-reconfigure -f noninteractive tzdata
RUN apt install -y mysql-client
COPY raddb/clients.conf /etc/raddb/clients.conf
COPY raddb/mods-available/sql /etc/raddb/mods-enabled/sql
COPY raddb/sites-available/default /etc/raddb/sites-available/default
COPY raddb/sites-available/inner-tunnel /etc/raddb/sites-available/inner-tunnel
