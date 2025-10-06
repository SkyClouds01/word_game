# Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]` | **Date**: [DATE] | **Spec**: [link]
**Input**: Feature specification from `/specs/[###-feature-name]/spec.md`

## Execution Flow (/plan command scope)

```
1. Load feature spec from Input path
   → If not found: ERROR "No feature spec at {path}"
2. Fill Technical Context (scan for NEEDS CLARIFICATION)
   → Detect Project Type from file system structure or context (web=frontend+backend, mobile=app+api)
   → Set Structure Decision based on project type
3. Fill the Constitution Check section based on the content of the constitution document.
4. Evaluate Constitution Check section below
   → If violations exist: Document in Complexity Tracking
   → If no justification possible: ERROR "Simplify approach first"
   → Update Progress Tracking: Initial Constitution Check
5. Execute Phase 0 → research.md
   → If NEEDS CLARIFICATION remain: ERROR "Resolve unknowns"
6. Execute Phase 1 → contracts, data-model.md, quickstart.md, agent-specific template file (e.g., `CLAUDE.md` for Claude Code, `.github/copilot-instructions.md` for GitHub Copilot, `GEMINI.md` for Gemini CLI, `QWEN.md` for Qwen Code, or `AGENTS.md` for all other agents).
7. Re-evaluate Constitution Check section
   → If new violations: Refactor design, return to Phase 1
   → Update Progress Tracking: Post-Design Constitution Check
8. Plan Phase 2 → Describe task generation approach (DO NOT create tasks.md)
9. STOP - Ready for /tasks command
```

**IMPORTANT**: The /plan command STOPS at step 7. Phases 2-4 are executed by other commands:

- Phase 2: /tasks command creates tasks.md
- Phase 3-4: Implementation execution (manual or via tools)

## Summary

[Extract from feature spec: primary requirement + technical approach from research]

## Technical Context

**Language/Version**: [e.g., Dart 3.9.2, Flutter 3.35.5 or NEEDS CLARIFICATION]  
**Primary Dependencies**: [e.g., flutter_bloc, get_it, freezed or NEEDS CLARIFICATION]  
**Storage**: [if applicable, e.g., Drift (SQLite), Hive, SharedPreferences or N/A]  
**Testing**: [e.g., flutter_test, mocktail, bloc_test or NEEDS CLARIFICATION]  
**Target Platform**: [e.g., iOS 13+, Android 8+ (API 26+), Web, Desktop or NEEDS CLARIFICATION]
**Project Type**: [single/web/mobile - determines source structure]  
**Performance Goals**: [domain-specific, e.g., 60 fps UI, <3s cold start, <100ms API response or NEEDS CLARIFICATION]  
**Constraints**: [domain-specific, e.g., offline-first, <50MB app size, WCAG AA compliance or NEEDS CLARIFICATION]  
**Scale/Scope**: [domain-specific, e.g., 10k users, 100 screens, 1M records locally or NEEDS CLARIFICATION]

## Constitution Check

_GATE: Must pass before Phase 0 research. Re-check after Phase 1 design._

Verify compliance with constitution principles (v1.0.0):

**I. Test-Driven Development**:

- [ ] TDD approach planned (tests before implementation)
- [ ] Test categories identified (unit, widget, integration, contract)
- [ ] Coverage target ≥80% achievable

**II. Clean Architecture Layers**:

- [ ] Feature follows domain/data/presentation structure
- [ ] Domain layer has no Flutter/external dependencies
- [ ] Repository interfaces in domain, implementations in data
- [ ] Use cases are single-responsibility

**III. Code Quality Standards**:

- [ ] Plan follows Dart/Flutter conventions
- [ ] Public APIs will be documented
- [ ] Files respect size limits (≤300 lines)
- [ ] No deep nesting planned (≤3 levels)

**IV. Performance Requirements**:

- [ ] UI performance considered (60fps target)
- [ ] Heavy computations planned for isolates if needed
- [ ] Lazy loading planned for large lists
- [ ] Async operations have timeout configs

**V. User Experience Consistency**:

- [ ] All strings use l10n (no hardcoded text)
- [ ] Theme values used (no hardcoded colors/styles)
- [ ] Accessibility considered (labels, contrast, touch targets)
- [ ] Error handling planned

**VI. Type Safety & Null Safety**:

- [ ] Sound null safety maintained
- [ ] Type annotations on public APIs
- [ ] Immutability enforced (Freezed for data models)
- [ ] No unsafe `!` operators without justification

**VII. Immutability & State Management**:

- [ ] BLoC/Cubit planned for state management
- [ ] State classes will be immutable (Freezed)
- [ ] BLoC tests planned independently of UI
- [ ] Proper disposal planned to prevent leaks

## Project Structure

### Documentation (this feature)

```
specs/[###-feature]/
├── plan.md              # This file (/plan command output)
├── research.md          # Phase 0 output (/plan command)
├── data-model.md        # Phase 1 output (/plan command)
├── quickstart.md        # Phase 1 output (/plan command)
├── contracts/           # Phase 1 output (/plan command)
└── tasks.md             # Phase 2 output (/tasks command - NOT created by /plan)
```

### Source Code (repository root)

<!--
  ACTION REQUIRED: Replace the placeholder tree below with the concrete layout
  for this feature. Delete unused options and expand the chosen structure with
  real paths (e.g., features/game, features/auth). The delivered plan must
  not include Option labels.
-->

```
# [REMOVE IF UNUSED] Option 1: Single Flutter app (DEFAULT for mobile)
lib/
├── features/
│   └── [feature]/
│       ├── domain/           # Entities, repository interfaces, use cases
│       ├── data/             # Repository implementations, data sources, models
│       └── presentation/     # Pages, widgets, BLoCs/Cubits
├── core/
│   ├── config/               # Theme, routing, env configs
│   ├── constants/            # App-wide constants
│   └── misc/                 # Utilities, extensions
└── app/                      # App initialization, DI setup

test/
├── features/
│   └── [feature]/
│       ├── domain/           # Unit tests for use cases
│       ├── data/             # Contract tests for repositories/data sources
│       └── presentation/     # Widget tests, BLoC tests
└── integration/              # End-to-end feature tests

# [REMOVE IF UNUSED] Option 2: Flutter app + Backend API (full-stack)
backend/
├── src/
│   ├── models/
│   ├── services/
│   └── api/
└── tests/

lib/                          # Flutter app (same structure as Option 1)
└── [same as above]

# [REMOVE IF UNUSED] Option 3: Multi-platform Flutter (shared lib + platform apps)
packages/
├── core/                     # Shared business logic
│   └── lib/
│       └── features/         # Domain + Data layers
└── ui_components/            # Shared widgets

apps/
├── mobile/                   # Mobile app
│   └── lib/
│       └── features/         # Presentation layer only
└── web/                      # Web app
    └── lib/
        └── features/         # Presentation layer only
```

**Structure Decision**: [Document the selected structure and reference the real
directories captured above]

## Phase 0: Outline & Research

1. **Extract unknowns from Technical Context** above:

   - For each NEEDS CLARIFICATION → research task
   - For each dependency → best practices task
   - For each integration → patterns task

2. **Generate and dispatch research agents**:

   ```
   For each unknown in Technical Context:
     Task: "Research {unknown} for {feature context}"
   For each technology choice:
     Task: "Find best practices for {tech} in {domain}"
   ```

3. **Consolidate findings** in `research.md` using format:
   - Decision: [what was chosen]
   - Rationale: [why chosen]
   - Alternatives considered: [what else evaluated]

**Output**: research.md with all NEEDS CLARIFICATION resolved

## Phase 1: Design & Contracts

_Prerequisites: research.md complete_

1. **Extract entities from feature spec** → `data-model.md`:

   - Entity name, fields, relationships
   - Validation rules from requirements
   - State transitions if applicable

2. **Generate API contracts** from functional requirements:

   - For each user action → endpoint
   - Use standard REST/GraphQL patterns
   - Output OpenAPI/GraphQL schema to `/contracts/`

3. **Generate contract tests** from contracts:

   - One test file per endpoint
   - Assert request/response schemas
   - Tests must fail (no implementation yet)

4. **Extract test scenarios** from user stories:

   - Each story → integration test scenario
   - Quickstart test = story validation steps

5. **Update agent file incrementally** (O(1) operation):
   - Run `.specify/scripts/bash/update-agent-context.sh copilot`
     **IMPORTANT**: Execute it exactly as specified above. Do not add or remove any arguments.
   - If exists: Add only NEW tech from current plan
   - Preserve manual additions between markers
   - Update recent changes (keep last 3)
   - Keep under 150 lines for token efficiency
   - Output to repository root

**Output**: data-model.md, /contracts/\*, failing tests, quickstart.md, agent-specific file

## Phase 2: Task Planning Approach

_This section describes what the /tasks command will do - DO NOT execute during /plan_

**Task Generation Strategy**:

- Load `.specify/templates/tasks-template.md` as base
- Generate tasks from Phase 1 design docs (contracts, data model, quickstart)
- Each contract → contract test task [P]
- Each entity → model creation task [P]
- Each user story → integration test task
- Implementation tasks to make tests pass

**Ordering Strategy**:

- TDD order: Tests before implementation
- Dependency order: Models before services before UI
- Mark [P] for parallel execution (independent files)

**Estimated Output**: 25-30 numbered, ordered tasks in tasks.md

**IMPORTANT**: This phase is executed by the /tasks command, NOT by /plan

## Phase 3+: Future Implementation

_These phases are beyond the scope of the /plan command_

**Phase 3**: Task execution (/tasks command creates tasks.md)  
**Phase 4**: Implementation (execute tasks.md following constitutional principles)  
**Phase 5**: Validation (run tests, execute quickstart.md, performance validation)

## Complexity Tracking

_Fill ONLY if Constitution Check has violations that must be justified_

| Violation                  | Why Needed         | Simpler Alternative Rejected Because |
| -------------------------- | ------------------ | ------------------------------------ |
| [e.g., 4th project]        | [current need]     | [why 3 projects insufficient]        |
| [e.g., Repository pattern] | [specific problem] | [why direct DB access insufficient]  |

## Progress Tracking

_This checklist is updated during execution flow_

**Phase Status**:

- [ ] Phase 0: Research complete (/plan command)
- [ ] Phase 1: Design complete (/plan command)
- [ ] Phase 2: Task planning complete (/plan command - describe approach only)
- [ ] Phase 3: Tasks generated (/tasks command)
- [ ] Phase 4: Implementation complete
- [ ] Phase 5: Validation passed

**Gate Status**:

- [ ] Initial Constitution Check: PASS
- [ ] Post-Design Constitution Check: PASS
- [ ] All NEEDS CLARIFICATION resolved
- [ ] Complexity deviations documented

---

_Based on Constitution v1.0.0 - See `.specify/memory/constitution.md`_
