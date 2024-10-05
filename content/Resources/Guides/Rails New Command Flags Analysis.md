---
title: Rails New Command Flags Analysis
---

## Basic Configuration Flags

1. `--skip-namespace`: 
   - Benefit: Simpler structure for small to medium-sized applications
   - Use case: Single-purpose apps or MVPs where you don't need complex namespacing

2. `--skip-collision-check`:
   - Benefit: Faster app generation
   - Use case: When you're absolutely sure about your app name and structure

3. `--ruby=PATH`:
   - Benefit: Ensures consistent Ruby version
   - Use case: Projects with specific Ruby version requirements or when using version managers like RVM or rbenv

4. `--name=NAME`:
   - Benefit: Custom naming without changing directory
   - Use case: When the app name differs from the directory name or for generating components within an existing app

5. `--template=TEMPLATE`:
   - Benefit: Customized app setup
   - Use case: Companies with standard setups, or developers with preferred configurations

## Database and ORM Flags

6. `--database=DATABASE`:
   - Benefit: Preconfigures for specific databases
   - Use case: Projects with predetermined database requirements (e.g., PostgreSQL for complex queries, MySQL for legacy integrations)

7. `--skip-active-record`:
   - Benefit: Lighter app without ORM
   - Use case: API-only applications, or when using alternative data stores (e.g., MongoDB with Mongoid)

## Version Control and Docker Flags

8. `--skip-git`:
   - Benefit: No initial Git setup
   - Use case: When using alternative version control or when Rails app is part of a larger, already versioned project

9. `--skip-docker`:
   - Benefit: No Docker configuration
   - Use case: Projects not requiring containerization or using alternative container solutions

## Component-specific Flags

10. `--skip-action-mailer`:
    - Benefit: Removes email functionality
    - Use case: Apps without email requirements or using third-party email services

11. `--skip-action-mailbox`:
    - Benefit: Removes inbound email processing
    - Use case: Apps that don't need to receive and process emails

12. `--skip-action-text`:
    - Benefit: Removes rich text editing capabilities
    - Use case: Simple apps or APIs without rich text content needs

13. `--skip-active-job`:
    - Benefit: Removes background job infrastructure
    - Use case: Simple apps without background processing needs

14. `--skip-active-storage`:
    - Benefit: Removes file attachment functionality
    - Use case: Apps that don't need to handle file uploads or use alternative file storage solutions

15. `--skip-action-cable`:
    - Benefit: Removes WebSocket functionality
    - Use case: Apps without real-time features

## Asset Pipeline and Frontend Flags

16. `--skip-asset-pipeline`:
    - Benefit: Removes asset compilation
    - Use case: API-only applications or when using separate frontend frameworks

17. `--asset-pipeline=ASSET_PIPELINE`:
    - Benefit: Chooses between Sprockets, Propshaft, or no asset pipeline
    - Use case: Propshaft for newer, simpler apps; Sprockets for legacy support

18. `--skip-javascript`:
    - Benefit: Removes JavaScript from the app
    - Use case: Static sites or when using a separate JavaScript framework

19. `--skip-hotwire`:
    - Benefit: Removes Hotwire integration
    - Use case: When not using Hotwire for frontend interactivity

20. `--javascript=JAVASCRIPT`:
    - Benefit: Chooses JavaScript approach (importmap, webpack, etc.)
    - Use case: Tailoring to team expertise or project requirements (e.g., webpack for complex SPAs)

21. `--css=CSS`:
    - Benefit: Chooses CSS processor
    - Use case: Tailwind for rapid prototyping, Sass for complex styling needs

## Testing and Quality Flags

22. `--skip-test`:
    - Benefit: Removes test directory and configurations
    - Use case: When using alternative testing frameworks or for quick prototypes

23. `--skip-system-test`:
    - Benefit: Removes system test configurations
    - Use case: Projects focusing on unit and integration tests instead of full system tests

24. `--skip-rubocop`:
    - Benefit: Skips RuboCop setup
    - Use case: Projects using alternative linting tools or with existing style guides

25. `--skip-brakeman`:
    - Benefit: Skips Brakeman security scanner setup
    - Use case: Projects using alternative security scanning tools

## Deployment and Environment Flags

26. `--skip-bootsnap`:
    - Benefit: Removes Bootsnap gem for faster boot times
    - Use case: Small apps or environments where boot time isn't critical

27. `--api`:
    - Benefit: Configures a minimal stack for API-only apps
    - Use case: Backend services, microservices, or apps serving mobile/SPA frontends

28. `--minimal`:
    - Benefit: Creates a minimal Rails app with fewer dependencies
    - Use case: Microservices, simple apps, or when you want full control over which components to include

## Development Environment Flags

29. `--skip-dev-gems`:
    - Benefit: Skips development-specific gems
    - Use case: When using alternative debugging tools or for very minimal setups

30. `--dev`:
    - Benefit: Sets up the app with a Gemfile pointing to your Rails checkout
    - Use case: For Rails core contributors or when testing against a specific Rails version

31. `--edge`:
    - Benefit: Uses the latest stable Rails branch
    - Use case: Testing apps against upcoming Rails features

32. `--main`:
    - Benefit: Uses the main branch of Rails
    - Use case: Testing cutting-edge Rails features or contributing to Rails

These flags allow you to tailor your Rails application to specific project needs, from minimal API-only services to full-featured web applications with custom asset handling and testing setups.