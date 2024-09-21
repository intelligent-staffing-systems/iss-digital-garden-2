---
title: docker-compose.yml full stack template
---

Docker Compose orchestrates our multi-container application, adhering to software architecture principles and development best practices.

```yaml
version: '3'
services:
  frontend:
    build:
      context: ./frontend
      dockerfile: Dockerfile.dev
    ports:
      - "3000:3000"
    volumes:
      - ./frontend:/app
      - /app/node_modules
    environment:
      - GOOGLE_CLIENT_ID=${GOOGLE_CLIENT_ID}
      - GOOGLE_CLIENT_SECRET=${GOOGLE_CLIENT_SECRET}
      - NEXTAUTH_SECRET=${NEXTAUTH_SECRET}
      - NEXTAUTH_URL=${NEXTAUTH_URL}
  backend:
    build:
      context: ./backend
      dockerfile: Dockerfile.dev
    ports:
      - "3001:3000"
    volumes:
      - ./backend:/app
    depends_on:
      - db
    environment:
      - DATABASE_URL=postgres://postgres:password@db:5432/app_development
  db:
    image: postgres:13
    volumes:
      - postgres_data:/var/lib/postgresql/data
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: password
    ports:
      - "5432:5432"

volumes:
  postgres_data:

```

Service Breakdown:

Frontend (Next.js):
- Build context and Dockerfile specified for reproducibility [2]
- Port 3000 exposed for local access
- Volume mount enables live code reloading [6]
- Configuration inspired by Next.js official Docker example [5]

Backend (Rails):
- Similar setup to frontend for consistency
- Port 3001 mapped to container's 3000 for API access
- Depends on db service, ensuring proper startup order [3]
- DATABASE_URL environment variable set for database connection
- Follows Rails Dockerfile best practices [7] and 12-factor app methodology [8]

Database (Postgres):
- Uses official Postgres image for reliability [9]
- Named volume for data persistence [4]
- Environment variables set for initial database setup
- Port exposure follows Docker networking best practices [10]

This configuration creates a development environment that's:
1. Isolated: Each service runs in its own container, following separation of concerns [1]
2. Consistent: Same setup across different development machines
3. Efficient: Live code reloading without rebuilding containers

The setup balances development convenience with production-like isolation, facilitating efficient full-stack development. It synthesizes best practices from official sources and widely-adopted methodologies, creating a robust environment that mirrors production setups while maintaining developer efficiency.

Primary sources:
[1] Separation of Concerns: https://en.wikipedia.org/wiki/Separation_of_concerns
[2] Docker build context: https://docs.docker.com/engine/reference/commandline/build/
[3] Docker Compose depends_on: https://docs.docker.com/compose/compose-file/compose-file-v3/#depends_on
[4] Docker volumes: https://docs.docker.com/storage/volumes/
[5] Next.js Docker example: https://github.com/vercel/next.js/tree/canary/examples/with-docker
[6] React development server: https://create-react-app.dev/docs/using-https-in-development/
[7] Ruby on Rails Dockerfile: https://docs.docker.com/samples/rails/
[8] The Twelve-Factor App: https://12factor.net/config
[9] Postgres Docker image: https://hub.docker.com/_/postgres
[10] Docker networking: https://docs.docker.com/network/