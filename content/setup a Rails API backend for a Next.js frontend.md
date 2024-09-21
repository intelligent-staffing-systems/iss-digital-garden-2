---
title: setup a Rails API backend for a Next.js frontend
---
For your setup with a Rails API backend and a Next.js frontend in a single repo, certain flags are indeed more desirable. Let's go through the most relevant ones:

1. `--api`: This is the most crucial flag for your setup. It configures Rails for API-only mode, removing unnecessary middleware and views.

2. `--database=postgresql`: Assuming you're using PostgreSQL, which is common for production apps. If you're using a different database, adjust accordingly.

3. `--skip-javascript`: Since your frontend is in Next.js, you don't need Rails to handle JavaScript.

4. `--skip-asset-pipeline`: API-only applications typically don't need an asset pipeline.

5. `--skip-sprockets`: Another flag to skip frontend-related setup.

6. `--skip-action-cable`: Unless you're planning to use WebSockets from your API.

7. `--skip-action-mailer`: If you're not handling emails from your API. If you are, you might want to keep this.

8. `--skip-action-mailbox`: For skipping inbound email processing.

9. `--skip-action-text`: APIs typically don't need rich text processing.

Regarding your question about using `--name=backend`:

Yes, using `--name=backend` is a good idea in your case. Here's why:

1. Proper naming: It clearly identifies the purpose of this part of your application.
2. Future command usage: As you mentioned, it will be helpful for future Rails commands. When you generate models, controllers, etc., they'll be properly namespaced.
3. Clarity in a monorepo: It makes it clear which part of your repo is the backend, especially useful if you have multiple services.

So, combining all of this, your Rails new command might look something like this:

```bash
rails new backend --api --database=postgresql --skip-javascript --skip-asset-pipeline --skip-sprockets --skip-action-cable --skip-action-mailbox --skip-action-text --name=backend

```

This command will create a new Rails application configured as an API, named "backend", using PostgreSQL as the database, and skipping several frontend-related and unnecessary (for an API) components.

A few notes:

1. You'll need to run this command from the directory where you want the `backend` folder to be created.

2. If you're using a different database, replace `postgresql` with your preferred option.

3. I've left out `--skip-action-mailer` in case you need to send emails from your API. If you don't need this functionality, you can add it to the command.

4. After running this command, you might want to move into the newly created `backend` directory and initialize a git repository there (if you haven't already initialized one in the parent directory).

Remember, you can always add or remove components later if your needs change. This setup gives you a good starting point for an API-only Rails application that will work well alongside your Next.js frontend.