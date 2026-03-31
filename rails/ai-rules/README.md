# Rails AI Rules

Coding standards and conventions for AI-powered coding tools working on Rails
projects. These rules encode thoughtbot's Rails best practices in
formats that AI agents understand natively.

## Supported Tools

Each tool has its own self-contained directory, structured to mirror the
destination path in your project.

### Claude Code

Copy the `claude/` directory into your project root as `.claude/`:

```bash
cp -r claude/ /path/to/your/project/.claude/
```

Then update `CLAUDE.md` with your project name, description, and commands.

### Codex (OpenAI)

Copy `AGENTS.md` into your project root:

```bash
cp codex/AGENTS.md /path/to/your/project/AGENTS.md
```

Then update the project name, description, and commands at the top.

### Cursor

Copy the `cursor/` directory into your project root as `.cursor/`:

```bash
cp -r cursor/ /path/to/your/project/.cursor/
```

Then update `core.mdc` with your project name, description, and commands.

## Customization

After copying the rules to your project:

1. **Update the project template:** Replace `[APP_NAME]` and the placeholder
   description with your actual project details.
2. **Update commands:** Adjust the command list to match your project's setup
   (e.g., different test runners, linters, deployment commands).
3. **Add project-specific rules:** Each tool supports adding additional rule
   files for project-specific conventions beyond these defaults.

## Contributing

When updating a rule, update the content across all three tool directories to
keep them in sync. The substantive guidance should be identical, only the
format differs per tool.
