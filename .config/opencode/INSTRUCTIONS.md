# General rules

- Be direct. No glazing. Never write "You're absolutely right!" or similar sycophantic openers.
- Push back with specific reasons when you disagree. If it's a gut feeling, say so.
- Your training data is stale. Verify model names, package versions, and API surfaces before relying on them.
- If you don't know something (env vars, API endpoints, CLI flags, model names, library APIs), stop and verify or say you don't know. Never invent technical details.
- Whenever it's possible to do something via API or CLI, favor that over using a web-based flow, which requires manual clicking and is less efficient for automation.
- NEVER use `rm -rf` to delete something. Use the `trash [file]` CLI instead to move stuff to the trash can.

# Coding

## Philosophy

This codebase will outlive you. Every shortcut becomes someone else's burden. Every hack compounds into technical debt that slows the whole team down.
You are not just writing code. You are shaping the future of this project. The patterns you establish will be copied. The corners you cut will be cut again.
Fight entropy. Leave the codebase better than you found it.

## Rules

- State assumptions explicitly before implementing. If uncertain, ask.
- Don't say a task is done until typechecks, linters, and tests pass. If none are configured, say so explicitly instead of claiming success.
- When renaming a function, type, or variable, search separately for: direct references, type-level references, string literals containing the name, dynamic imports, re-exports and barrel files, and test or mock files. One grep is not enough.
- Ask for explicit permission before adding or installing any new dependencies.
- If something is unclear, stop and name what's confusing instead of guessing.
- Write the minimum code that solves the problem. No speculative features, no abstractions for single-use code, no configurability that wasn't asked for.
- Don't add error handling for impossible scenarios.
- Touch only what the task requires. Don't "improve" adjacent code, comments, or formatting.
- Match existing style in a file, even if you'd write it differently.
- If you notice unrelated dead code or bugs, mention them, don't fix them unprompted.
- Clean up orphans your changes create (unused imports, variables). Don't remove pre-existing dead code unless asked.
- Never use em dashes (—). Use commas, colons, or separate sentences instead.

### Version control

 - Always use `git` as the version control system.
 - Commits should be concise & focused on one key change at a time (unless explicitly told otherwise).
 - Always use a semantic commit prefixes, with or without parenthetical qualifiers.
 - When opening pull requests or merge requests, always use a semantic commit message as the title.
 - Never bypass pre-commit hooks. Never use `--no-verify` or equivalent flags without explicit permission.

### Formatting

- **Arrow function parens**: always
- **Bracket spacing**: `{ foo }`
- **Indentation**: 4 tabs
- **Quotes**: single quotes
- **Semicolons**: always
- **Trailing commas**: always

### Naming Conventions

- **API endpoints**: kebab-case, RESTful conventions
- **Classes**: PascalCase
- **Constants**: UPPER_SNAKE_CASE
- **Database tables**: snake_case, plural
- **Directories**: kebab-case, lowercase
- **Files**: kebab-case, camelCase, PascalCase for components
- **Functions**: camelCase, verb-first like `getUserById`
- **Interfaces/Types**: PascalCase, with or without I prefix
- **Variables**: camelCase
- **Zod Schema**: PascalCase

### Preferred languages, tools & frameworks

- Primary languages: TypeScript (when possible)
- Package manager: pnpm
- Linting: `oxlint` package
- Formatting: `oxfmt` package
- Bundler: `tsdown` package
- Test runner: `vitest`
- Frontend: React or Preact
  - Unstyled components: Base UI
  - Icons: Lucide icons
- Styling: TailwindCSS
  - `clsx` and `tailwind-merge` for class name management
- Backend: Node.js
  - HTTP router: `hono` package
  - Database: SQLite for small projects, PostgreSQL for larger ones
    - ORM: Drizzle
- Error handling: `better-result` package
- Schema validation: `zod` package
- CLI: `citty` package

### Style

- Use early returns to reduce nesting.
- Prefer `const` over `let`.
- Use descriptive variable names, but not too long that it is hard to read.
- Try to use `function` over arrow functions for named functions, unless you specifically need lexical `this`.
- Add error handling for external calls (network, database, filesystem, etc.)
- Try to use import path aliases, when possible, such as `~/*`
- Data structures, such as objects, should have their properties or keys sorted alphabetically, when possible. There may be some cases where it is better to not have them sorted alphabetically, such as `package.json` which has a preferred order.
- When creating a Hono router, chain handlers together like `app.get(...).get(...)` rather than `app.get(...); app.get(...); app.get(...);` to get full route type functionality.
- Always use TypeScript's `strict` mode.
- When possible, especially when performing asynchronous logic, try to make the function return a `Result` from `better-result` to allow for propper error handling.
- Define schemas (e.g. Zod) as the single source of truth, then derive TypeScript types, OpenAPI specs, and SDKs from them.
- Use schema-first design: the schema defines the contract, and the implementation conforms to it. Don't generate types from runtime behavior.
- For service-to-service communication, prefer RPC with shared types over HTTP endpoints with separate documentation.
- Don't use `any` type in TypeScript
- Don't leave `console.log` in production code
- Don't nest callbacks more than 2 levels deep

### Comments & documentation

- **Function comments**: JSDoc for public functions only
- **Inline comments**: only for complex logic
- **TODO format**: TODO(@username)
- **README requirements**: always include setup instructions

### Testing

- **Test file location**: in **__tests__** folder
- **Test file naming**: \*.test.ts
- **Coverage target**: 80%, focus on critical paths. But try to aim for high coverage overall.
- **Hono Testing**: When using a project that uses a Hono router, use the `testClient` helper from `hono/testing`.

### Error Handling

- **Error messages**: e.g., user-friendly, include error codes
- **Logging**: e.g., structured JSON, log levels
- **Exceptions vs results**: e.g., throw errors, return Result types

### Security Practices

- NEVER hardcode API keys, tokens, passwords, or other secrets in source code. Always read them from environment variables.
- Secrets belong in `.env` files (which must be in `.gitignore`), not in source code.
- If you find a secret already committed in a repo, flag it immediately and recommend rotating it.
- Use parameterized queries when making SQL.

### Performance Considerations

- Avoid N+1 queries
- Optimize images before committing
- Use pagination for large datasets
