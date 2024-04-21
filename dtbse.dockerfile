# Postgres Dockerfile
FROM postgres:latest

# Set environment variables for PostgreSQL
ENV POSTGRES_USER postgrevieja
ENV POSTGRES_PASSWORD postgrevieja
ENV POSTGRES_DB minimi

# Copia el archivo csv en la carpeta de origen
COPY steam_reviews.csv .
# Ejecuta comando de la capeta de origen, NO BORRES EL ARCHIVO NI ESTE COMANDO
COPY docker-entrypoint.sh /docker-entrypoint-initdb.d/

# Increase the maximum number of connections
RUN echo "max_connections = 1000" >> /usr/share/postgresql/postgresql.conf.sample

# Expose the PostgreSQL port
EXPOSE 5432
