---
title: Containerized Ruby on Rails backend
---

## Prerequisites
- [the Rails Command Line](https://guides.rubyonrails.org/command_line.html) 
- [Ruby Docker image](https://hub.docker.com/_/ruby)  - i choose ruby:bookworm
## Filetree state
Our project should currently look like this:
```tree
~/projects/fullstack-template
$ tree -L 1

.
└── frontend

1 directory
```

## Backend Initialization
1. Create backend directory from project root:
```
mkdir backend && cd backend
```

2. Generate Rails API-only application:
[[Rails New Command Flags Analysis]]
[[setup a Rails API backend for a Next.js frontend]]
[[rails scalability and features considerations]]
```
docker run --rm -v ${PWD}:/app -w /app ruby:bookworm \
	bash -c "gem install rails && \
	rails new backend \
	  --api \
	  --database=postgresql \
	  --skip-javascript \
	  --skip-asset-pipeline \
	  --skip-sprockets \
	  --skip-action-cable \
	  --skip-action-mailbox \
	  --skip-action-text \
	  --name=backend
	 " 
```
or to see additional option run:
```
docker run --rm -v ${PWD}:/app -w /app ruby:bookworm \
	bash -c "gem install rails && \
	rails new --help"
```


3. Create Dockerfile.dev for Rails:
```Dockerfile
FROM ruby:bookworm
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
CMD ["rails", "server", "-b", "0.0.0.0"]
```

## Build and test the Rails backend:
```
docker build -f Dockerfile.dev -t ruby-backend-dev .
docker run -p 3001:3000 -v ${PWD}:/app ruby-backend-dev
```
if you go to localhost:3001 in the browser, you will see an error:
> [!ERROR] PostgreSQL Connection Failed
> connection to server on socket "/var/run/postgresql/.s.PGSQL.5432" failed: No such file or directory
> Is the server running locally and accepting connections on that socket?
### So we need to [[create a new Database in Ruby]].  

Rails' default welcome page, served by the built-in puma server (shipped with rails) is now error free.  You should also see some Ruby output in the docker compose terminal. The HTML response confirms Rails is running, but it's not API-ready yet.

At this point, all three components of our stack are configured and runnable with docker run commands:
1. Frontend (Next.js) on port 3000
2. Backend (Rails) on port 3001
3. Database (PostgreSQL) on port 5432

But, we still need additional tests before this is a full stack, which we will cover in the next step. 

Be sure to save your work so far by [[Pushing to a git remote repository]]
