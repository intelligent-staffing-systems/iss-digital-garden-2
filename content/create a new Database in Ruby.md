---
title: create a new Database in Ruby
---

## **Create a Docker network**: 
   This is something docker compose will set up for us; this network allows containers to communicate with each other.
   ```
   docker network create myapp-network
   ```

## **Run PostgreSQL container**:
   ```
   docker run --name postgres \
     -e POSTGRES_PASSWORD=mysecretpassword \
     --network myapp-network \
     -d postgres
   ```
   - `--name postgres`: Names the container for easy reference.
   - `-e POSTGRES_PASSWORD=mysecretpassword`: Sets the database password.
   - `--network myapp-network`: Connects to the created network.
   - `-d`: Runs in detached mode.

## Test a Database operation
   run the rails/backend container:
   ```
   cd backend/
   docker build -t backend -f Dockerfile.dev .
   docker run --rm \
     --network myapp-network \
     -e DATABASE_URL=postgres://postgres:mysecretpassword@postgres:5432/myapp_development \
     backend rails db:create
   ```
   - `--rm`: Removes the container after execution.
   - `--network myapp-network`: Connects to the same network as PostgreSQL.
   - `-e DATABASE_URL=...`: Sets the database connection string.
     - `postgres://`: Specifies the database type.
     - `postgres:mysecretpassword`: Username and password.
     - `@postgres`: Hostname (container name of PostgreSQL).
     - `:5432`: Default PostgreSQL port.
     - `/myapp_development`: Database name.
[[rails db create command]]

If successful, you should see a message like "Created database 'app_development'".

Test again:
```bash
curl http://localhost:3001
```

You should now see valid output!  Database created!

If you still encounter issues, check your `config/database.yml` file to ensure it's properly configured for your Docker environment. 