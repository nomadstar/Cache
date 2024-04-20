# Postgres Dockerfile
FROM postgres:latest

# Set environment variables for PostgreSQL
ENV POSTGRES_USER postgrevieja
ENV POSTGRES_PASSWORD postgrevieja
ENV POSTGRES_DB minimi

# Copy the SQL script to initialize the database
COPY init.sql /docker-entrypoint-initdb.d/

# Expose the PostgreSQL port
EXPOSE 5432