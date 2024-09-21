---
title: Containerized NextJS frontend
---
## Pre-Requisites
- [[Docker Installation Guide]]
- [Nodejs Docker Images](https://hub.docker.com/_/node)
## Project Setup and Frontend Initialization

1. Create project directory:
```bash
   mkdir fullstack-template-5 && cd fullstack-template-5
```

2. Create frontend directory:
```bash
   mkdir frontend && cd frontend
```

3. [Initialize the Next.js project ](https://nextjs.org/docs/app/api-reference/cli/create-next-app)with our preferences built into the command (non-interactive in the container):
```bash
   docker run --rm -v ${PWD}:/app -w /app \
   node:bookworm \
   npx create-next-app@latest . \
   --typescript \
   --eslint \
   --tailwind \
   --app \
   --src-dir \
   --import-alias "@/*"
```
or to see options run:
```bash
   docker run --rm -v ${PWD}:/app -w /app \
   node:bookworm \
   npx create-next-app@latest --help
```


4. Create a Dockerfile.dev:
```dockerfile
FROM node:bookworm
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# https://nextjs.org/telemetry
ENV NEXT_TELEMETRY_DISABLED=1
CMD ["npm", "run", "dev"]
```
   
These steps have successfully set up our Next.js frontend environment within a Docker container. We now have a Next.js project with TypeScript, ESLint, Tailwind CSS, and the App Router, along with a Dockerfile for development.

Now let's test our Dockerfile and setup:
![[next.js frontend docker build and run commands]]


The default NextJS page is now visible on my browser localhost:3000!
## Debug
You may get an error such as: `Bind for 0.0.0.0:3000 failed: port is already allocated`
If so, following commands are useful:
[[Docker stop and remove unwanted containers]]

## Final Steps for this step
1. [[Update ownership of project files]]
2. Push changes to a remote repository - consider [[Initialize a new GitHub Repo]]

## Filetree state
Our project should currently look like this:
```tree
~/projects/fullstack-template
$ tree -L 2
.
└── frontend
    ├── Dockerfile.dev
    ├── next.config.mjs
    ├── next-env.d.ts
    ├── node_modules
    ├── package.json
    ├── package-lock.json
    ├── postcss.config.mjs
    ├── README.md
    ├── src
    ├── tailwind.config.ts
    └── tsconfig.json

4 directories, 9 files
```
