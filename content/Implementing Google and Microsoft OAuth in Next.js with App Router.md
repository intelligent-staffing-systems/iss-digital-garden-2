---
title: Implementing Google and Microsoft OAuth in Next.js with App Router
---

# Guide: Implementing Google and Microsoft OAuth in Next.js with App Router

This guide will walk you through the process of implementing both Google and Microsoft (Azure AD) OAuth in a Next.js application using the App Router.

## Prerequisites

- A Next.js project set up with the App Router
- Docker and Docker Compose installed
- Google Cloud Platform account
- Microsoft Azure account

## Step 1: Set Up OAuth Credentials

### Google OAuth Setup

1. Go to the [Google Cloud Console](https://console.cloud.google.com/).
2. Create a new project or select an existing one.
3. Navigate to "APIs & Services" > "Credentials".
4. Click "Create Credentials" and select "OAuth client ID".
5. Choose "Web application" as the application type.
6. Add `http://localhost:3000` to the "Authorized JavaScript origins".
7. Add `http://localhost:3000/api/auth/callback/google` to the "Authorized redirect URIs".
8. Note down the Client ID and Client Secret.

### Microsoft Azure AD Setup

1. Go to the [Azure Portal](https://portal.azure.com/).
2. Navigate to "Azure Active Directory" > "App registrations" > "New registration".
3. Name your application.
4. Set the redirect URI to `http://localhost:3000/api/auth/callback/azure-ad`.
   **Important:** Ensure you select "Web" as the platform for the redirect URI, not "Mobile & desktop".
5. After creation, note down the Application (client) ID and Tenant ID.
6. Go to "Certificates & secrets" and create a new client secret. Note down the secret value.

## Step 2: Update Environment Variables

Create or update your `.env` file in the project root:

```
GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret
AZURE_AD_CLIENT_ID=your_azure_client_id
AZURE_AD_CLIENT_SECRET=your_azure_client_secret
AZURE_AD_TENANT_ID=your_azure_tenant_id
NEXTAUTH_SECRET=your_nextauth_secret # generate a secure random string
NEXTAUTH_URL=http://localhost:3000
```

## Step 3: Update Dockerfile.dev

Update your `Dockerfile.dev`:

```dockerfile
FROM node:bookworm
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm install next-auth @azure/msal-node
COPY . .
ENV NEXT_TELEMETRY_DISABLED=1
CMD ["npm", "run", "dev"]
```

## Step 4: Update docker-compose.yml

Update your `docker-compose.yml`:

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
    environment:
      - GOOGLE_CLIENT_ID=${GOOGLE_CLIENT_ID}
      - GOOGLE_CLIENT_SECRET=${GOOGLE_CLIENT_SECRET}
      - AZURE_AD_CLIENT_ID=${AZURE_AD_CLIENT_ID}
      - AZURE_AD_CLIENT_SECRET=${AZURE_AD_CLIENT_SECRET}
      - AZURE_AD_TENANT_ID=${AZURE_AD_TENANT_ID}
      - NEXTAUTH_SECRET=${NEXTAUTH_SECRET}
      - NEXTAUTH_URL=${NEXTAUTH_URL}
  # ... other services
```

## Step 5: Update NextAuth Configuration

Update `src/app/api/auth/[...nextauth]/route.ts`:

```typescript
import NextAuth from "next-auth"
import GoogleProvider from "next-auth/providers/google"
import AzureADProvider from "next-auth/providers/azure-ad"
import type { NextAuthOptions } from 'next-auth'

export const authOptions: NextAuthOptions = {
  providers: [
    GoogleProvider({
      clientId: process.env.GOOGLE_CLIENT_ID!,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET!,
    }),
    AzureADProvider({
      clientId: process.env.AZURE_AD_CLIENT_ID!,
      clientSecret: process.env.AZURE_AD_CLIENT_SECRET!,
      tenantId: process.env.AZURE_AD_TENANT_ID!,
    }),
  ],
  // Add any additional NextAuth configuration here
}

const handler = NextAuth(authOptions)

export { handler as GET, handler as POST }
```

## Step 6: Update Home Page

Update `src/app/page.tsx`:

```typescript
import { getServerSession } from "next-auth/next"
import { authOptions } from "./api/auth/[...nextauth]/route"
import { redirect } from 'next/navigation'
import Link from 'next/link'

export default async function Home() {
  const session = await getServerSession(authOptions)

  if (session) {
    redirect('/dashboard')
  }

  return (
    <div className="flex flex-col items-center justify-center h-screen space-y-4">
      <Link href="/api/auth/signin?callbackUrl=/dashboard&provider=google"
        className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
        Sign in with Google
      </Link>
      <Link href="/api/auth/signin?callbackUrl=/dashboard&provider=azure-ad"
        className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
        Sign in with Microsoft
      </Link>
    </div>
  )
}
```

## Step 7: Create Dashboard Page

Create `src/app/dashboard/page.tsx`:

```typescript
import { getServerSession } from "next-auth/next"
import { authOptions } from "../api/auth/[...nextauth]/route"
import { redirect } from 'next/navigation'

export default async function Dashboard() {
  const session = await getServerSession(authOptions)

  if (!session) {
    redirect('/')
  }

  return (
    <div className="p-8">
      <h1 className="text-2xl font-bold mb-4">Welcome to your Dashboard</h1>
      <p>You are signed in as: {session.user?.email}</p>
      {/* Add more dashboard content here */}
    </div>
  )
}
```

## Step 8: Run the Application

1. Ensure all environment variables are set in your `.env` file at the project root.
2. From the project root, run:
   ```
   docker compose up --build
   ```
3. Visit `http://localhost:3000` in your browser.

You should now see options to sign in with both Google and Microsoft. After successful authentication, you'll be redirected to the dashboard.

## Next Steps

1. Enhance the dashboard to display more user-specific information.
2. Implement database operations for user data.
3. Integrate an LLM for generating messages on the dashboard.
4. Add proper error handling and loading states.
5. Implement sign-out functionality.

Remember to always follow security best practices and keep your credentials and environment variables secure.