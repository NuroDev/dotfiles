# Personal Coding Standards

These are my personal preferences that apply to all projects unless overridden by a project-specific CLAUDE.md.

---

## Code Formatting

- **Arrow function parens**: always
- **Bracket spacing**: `{ foo }`
- **Indentation**: 4 tabs
- **Quotes**: single quotes
- **Semicolons**: always
- **Trailing commas**: always

---

## Naming Conventions

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

---

## Preferred Languages & Frameworks

- **Primary languages**: TypeScript
- **Frontend**: React or Preact
- **Backend**: Bun preferred when possible, if not fall back to Node.js
- **Styling**: TailwindCSS
- **Database**: SQLite for small projects, PostgreSQL for larger ones

---

## Preferred Tools & Libraries

### Package Managers

Bun is the preferred package manager. Secondary preference is pnpm, especially since many projects use it. Otherwise, npm or yarn can be used as needed.

### Build Tools

When building a library or package, use `tsdown`.

### Testing

If using Bun as a package manager, try to use Bun's built-in test runner. Otherwise, use Vitest.

### Linting & Formatting

Biome, preferrably with a JSONC configuration file similar to this:

```jsonc
{
  // Add a `$schema` with the Biome version here...
  "assist": {
    "actions": {
      "source": {
        "organizeImports": "on",
        "recommended": true
      }
    }
  },
  "files": {
    "includes": [
      // Add file patterns to include here
    ]
  },
  "formatter": {
    "attributePosition": "multiline",
    "enabled": true,
    "indentStyle": "tab",
    "indentWidth": 4,
    "lineEnding": "lf",
    "lineWidth": 90
  },
  "javascript": {
    "formatter": {
      "arrowParentheses": "always",
      "attributePosition": "multiline",
      "bracketSameLine": true,
      "bracketSpacing": true,
      "enabled": true,
      "jsxQuoteStyle": "single",
      "quoteStyle": "single",
      "semicolons": "always"
    },
    "globals": ["Astro"] // Only needed if using Astro
  },
  "linter": {
    "enabled": true,
    "rules": {
      "nursery": {
        "useSortedClasses": {
          "fix": "safe",
          "level": "warn",
          "options": {}
        }
      },
      "recommended": true,
      "style": {
        "noDefaultExport": "off",
        "noInferrableTypes": "error",
        "noParameterAssign": "error",
        "noUnusedTemplateLiteral": "error",
        "noUselessElse": "error",
        "useArrayLiterals": "off",
        "useAsConstAssertion": "error",
        "useBlockStatements": "off",
        "useConsistentArrayType": {
          "level": "warn",
          "options": {
            "syntax": "generic"
          }
        },
        "useDefaultParameterLast": "error",
        "useEnumInitializers": "error",
        "useFilenamingConvention": "off",
        "useNamingConvention": "off",
        "useNumberNamespace": "error",
        "useSelfClosingElements": "error",
        "useSingleVarDeclarator": "error"
      },
      "suspicious": {
        "noArrayIndexKey": "off"
      }
    }
  },
  "vcs": {
    "clientKind": "git",
    "defaultBranch": "main",
    "enabled": true
  }
}
```

### Version Control

Git

### Other Tools

- `clsx` and `tailwind-merge` for className management (If the project uses TailwindCSS)
- `hono` for a HTTP framework
- `better-result` for error handling
- `wrangler` for Cloudflare Workers projects
- `zod` for schema validation
- Lucide icons if using icons. There is usually packages specifically for the UI framework being used, e.g. `lucide-react` for React, `lucide-preact` for Preact, etc.
- Base UI for unstyled components

---

## Code Style Preferences

### Do's

- Use early returns to reduce nesting
- Prefer const over let
- Use descriptive variable names, but not too long that it is hard to read
- Try to use `function` over arrow functions for named functions, unless you specifically need lexical `this`
- Add error handling for external calls (network, database, filesystem, etc.)
- Try to use import path aliases, when possible, such as `~/*`
- Data structures, such as objects, should have their properties or keys sorted alphabetically, when possible. There may be some cases where it is better to not have them sorted alphabetically, such as `package.json` which has a preferred order.
- When creating a Hono router, chain handlers together like `app.get(...).get(...)` rather than `app.get(...); app.get(...); app.get(...);` to get full route type functionality.
- Always use TypeScript's `strict` mode.
- When possible, especially when performing asynchronous logic, try to make the function return a `Result` from `better-result` to allow for propper error handling.

### Don'ts

- Don't use `any` type in TypeScript
- Don't leave console.log in production code
- Don't nest callbacks more than 2 levels deep

---

## Comments & Documentation

- **Function comments**: JSDoc for public functions only
- **Inline comments**: only for complex logic
- **TODO format**: TODO(@username)
- **README requirements**: always include setup instructions

---

## Testing Preferences

- **Test file location**: in **tests** folder
- **Test file naming**: \*.test.ts
- **Coverage target**: 80%, focus on critical paths. But try to aim for high coverage overall.
- **Hono Testing**: When using a project that uses a Hono router, use the `testClient` helper from `hono/testing`.

---

<!-- ## Error Handling -->

<!-- Your error handling approach -->

<!-- - **Error messages**: e.g., user-friendly, include error codes
- **Logging**: e.g., structured JSON, log levels
- **Exceptions vs results**: e.g., throw errors, return Result types -->

---

## Project Structure

Example structure for a Cloudflare Worker:

```
project/
├── src/
│   ├── components/
│   ├── utils/
│   ├── types/
│   └── index.ts
└── tests/
```

Example structure for a monorepo:

```
project/
├── apps/
├── packages/
│   ├── public-package-name/
│   └── @org-name/
│       └── org-package-name/
├── scripts/
├── services/
└── workers/
```

---

## Security Practices

- Never commit secrets or API keys
- Validate all user input
- Use parameterized queries
<!-- - Implement rate limiting on APIs -->

---

## Performance Considerations

<!-- - Lazy load components/modules -->

- Optimize images before committing
- Avoid N+1 queries
- Use pagination for large datasets

---

## AI Assistant Instructions

- Always explain changes before making them
- Ask before adding new dependencies
- Keep commits small and focused
- Prefer simple solutions over clever ones
- Run tests after making changes

---

## Notes

NEVER use `rm -rf` to delete something. Use `trash` instead to move stuff to the trash can.
