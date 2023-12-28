FROM webdevops/php-apache:8.2

RUN curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc
RUN curl https://packages.microsoft.com/config/debian/10/prod.list | tee /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql17
RUN ACCEPT_EULA=Y apt-get install -y mssql-tools
RUN apt-get install -y unixodbc-dev
RUN apt-get install -y libgssapi-krb5-2

RUN sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
RUN locale-gen

RUN pecl install sqlsrv && \
    pecl install pdo_sqlsrv

RUN printf "; priority=20\nextension=sqlsrv.so\n" > $(php-config --ini-dir)/sqlsrv.ini
RUN printf "; priority=30\nextension=pdo_sqlsrv.so\n" > $(php-config --ini-dir)/pdo_sqlsrv.ini

RUN sed -i 's,^\(MinProtocol[ ]*=\).*,\1'TLSv1.0',g' /etc/ssl/openssl.cnf && \
    sed -i 's,^\(CipherString[ ]*=\).*,\1'DEFAULT@SECLEVEL=1',g' /etc/ssl/openssl.cnf\