<!--
Sync Impact Report - Version 1.0.0
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Version Change: N/A → 1.0.0
Type: INITIAL CONSTITUTION

Principles Established:
  1. Test-Driven Development (Non-Negotiable)
  2. Clean Architecture Layers
  3. Code Quality Standards
  4. Performance Requirements
  5. User Experience Consistency
  6. Type Safety & Null Safety
  7. Immutability & State Management

Sections Added:
  - Core Principles (7 principles)
  - Development Standards
  - Quality Gates
  - Governance

Templates Status:
  ✅ plan-template.md - Reviewed, aligned with TDD and Clean Architecture
  ✅ spec-template.md - Reviewed, requirements align with UX consistency
  ✅ tasks-template.md - Reviewed, TDD workflow enforced
  ⚠️  Future: Consider adding Flutter-specific quickstart template

Follow-up TODOs:
  - None - All placeholders filled with concrete values

Rationale:
  This constitution establishes foundational principles for a Flutter 3.35.5/
  Dart 3.9.2 project following TDD and Clean Architecture patterns. It defines
  mandatory testing practices, architectural boundaries, code quality standards,
  and performance requirements specific to mobile development.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-->

# Word Game Constitution

## Core Principles

### I. Test-Driven Development (Non-Negotiable)

**TDD is mandatory for all feature development. No exceptions.**

- Tests MUST be written BEFORE implementation code
- Follow strict Red-Green-Refactor cycle:
  1. **Red**: Write failing test that defines desired behavior
  2. **Green**: Write minimal code to make test pass
  3. **Refactor**: Improve code while keeping tests green
- All code changes MUST be validated by automated tests
- Test coverage MUST be ≥80% for all production code
- Tests MUST be executed with `--test-randomize-ordering-seed random` to ensure independence

**Rationale**: TDD ensures code correctness, maintainability, and prevents regressions. Random test ordering catches hidden dependencies early. High coverage gives confidence in refactoring and changes.

**Test Categories Required**:

- **Unit Tests**: Test individual classes/functions in isolation (using mocktail for dependencies)
- **Widget Tests**: Test Flutter widgets and their interactions
- **Integration Tests**: Test feature flows end-to-end
- **Contract Tests**: Validate data layer contracts (repositories, data sources)

### II. Clean Architecture Layers

**All code MUST respect Clean Architecture layer boundaries.**

**Layer Structure** (dependency rule: outer layers depend on inner, never reverse):

```
lib/
├── features/           # Feature modules (Use Cases + Presentation)
│   └── [feature]/
│       ├── domain/     # Business logic (entities, repositories interfaces)
│       ├── data/       # Data implementation (repositories, data sources, models)
│       └── presentation/ # UI (pages, widgets, bloc/cubit)
├── core/              # Shared utilities, configs, constants
└── app/               # App initialization, routing, dependency injection
```

**Mandatory Rules**:

- Domain layer MUST NOT depend on data or presentation layers
- Domain layer MUST NOT import Flutter or external packages (except core Dart)
- Data models (JSON serializable) are separate from domain entities
- Use cases MUST be single-responsibility (one action per use case)
- Repository interfaces defined in domain, implemented in data layer
- Presentation MUST interact with domain through use cases only
- All dependencies injected via GetIt (registered in `app/` layer)

**Rationale**: Clean Architecture ensures testability, independence from frameworks/UI/databases, and allows business logic to evolve without breaking other layers. Clear boundaries prevent spaghetti code and make codebase navigable.

### III. Code Quality Standards

**All code MUST pass linter rules and follow Dart/Flutter best practices.**

**Enforced via `analysis_options.yaml`**:

- Strict mode enabled: `strict-casts`, `strict-inference`, `strict-raw-types`
- Very Good Analysis ruleset (industry-standard Flutter linting)
- Zero linter warnings or errors allowed in production code
- 80-character line length enforced for readability
- Trailing commas preserved for better diffs

**Naming Conventions**:

- Classes/Enums: `PascalCase`
- Variables/functions: `camelCase`
- Files: `snake_case.dart`
- Constants: `camelCase` with `const` or `final`
- Private members: prefix with `_`

**Documentation Requirements**:

- Public APIs MUST have doc comments (`///`)
- Complex logic MUST have inline comments explaining "why", not "what"
- README MUST be updated when adding new features or changing architecture
- API contracts (repositories, use cases) MUST document parameters and return types

**Code Organization**:

- One class per file (except tightly coupled classes like sealed unions)
- Maximum 300 lines per file (refactor if exceeded)
- Avoid deep nesting (max 3 levels in functions)
- Use early returns to reduce nesting

**Rationale**: Consistent code quality improves readability, reduces bugs, and speeds up onboarding. Strict linting catches issues early. Well-documented code reduces cognitive load for all team members.

### IV. Performance Requirements

**The app MUST be performant and responsive.**

**Frame Rate**:

- UI MUST maintain 60 fps during normal interactions
- Animations MUST NOT drop below 60 fps on target devices
- Use Flutter DevTools Performance view to measure and optimize
- Heavy computations MUST run on isolates to avoid blocking UI thread

**Build & Startup**:

- Cold start MUST complete in <3 seconds on mid-range devices
- Hot reload MUST complete in <1 second for iterative development
- App size MUST remain under reasonable limits (aim <50MB for release APK/IPA)

**Memory**:

- Avoid memory leaks (dispose controllers, streams, subscriptions)
- Profile memory usage with DevTools Memory view
- Large lists MUST use lazy loading (ListView.builder, GridView.builder)

**Network & Data**:

- API calls MUST have timeout configuration (default 30s)
- Implement loading states for async operations
- Cache frequently accessed data appropriately
- Use pagination for large datasets

**Performance Testing**:

- Use `flutter run --profile` for performance profiling (NOT debug mode)
- Measure frame rendering times with `flutter run --trace-skia`
- Integration tests MUST validate performance-critical paths

**Rationale**: Mobile users expect smooth, fast apps. Performance issues lead to poor ratings and user churn. Proactive performance measurement prevents degradation over time.

### V. User Experience Consistency

**UI MUST be consistent, accessible, and follow platform conventions.**

**Design System**:

- Use Material Design 3 widgets and theming
- Define theme in `core/config/theme/` (colors, typography, spacing)
- All colors, text styles, and spacing MUST come from theme (no hardcoded values)
- Support light and dark themes

**Localization (i18n)**:

- All user-facing strings MUST use `l10n` (Flutter's localization system)
- Never hardcode text in widgets
- ARB files in `lib/l10n/arb/` for all supported languages
- Generate localizations with `flutter gen-l10n`

**Accessibility**:

- All interactive widgets MUST have semantic labels
- Color contrast MUST meet WCAG AA standards (4.5:1 for text)
- Support screen readers (test with TalkBack/VoiceOver)
- Ensure touch targets ≥48x48 logical pixels

**Navigation**:

- Use declarative routing (Flutter Navigator 2.0 or go_router)
- Maintain navigation state (deep linking support)
- Back button behavior MUST match platform expectations

**Error Handling**:

- Show user-friendly error messages (no stack traces or technical jargon)
- Provide actionable recovery steps (retry, contact support)
- Log technical errors for debugging (preserve stack traces internally)

**Rationale**: Consistent UX builds trust and reduces user frustration. Accessibility ensures inclusivity. Localization enables global reach. Professional error handling maintains user confidence even when things go wrong.

### VI. Type Safety & Null Safety

**Leverage Dart's strong type system and null safety.**

**Null Safety (Sound)**:

- Code MUST be 100% null-safe (no `// @dart=2.9` opt-outs)
- Use non-nullable types by default
- Use nullable types (`Type?`) only when absence of value is valid
- Prefer `late` for deferred initialization over nullable types
- NEVER use `!` (bang operator) without null checks or documentation justifying safety

**Type Annotations**:

- Public APIs MUST have explicit type annotations
- Avoid `dynamic` except when working with truly dynamic data (JSON parsing)
- Use `Object?` instead of `dynamic` when type is unknown but bounded
- Generic types MUST be constrained where possible (`T extends SomeBase`)

**Immutability**:

- Prefer `final` over `var` for all variables
- Domain entities MUST be immutable (use `@immutable` annotation)
- Data models MUST use Freezed for immutable data classes with copyWith
- Collections MUST be unmodifiable when exposed (`UnmodifiableListView`)

**Rationale**: Null safety eliminates null reference errors (the "billion-dollar mistake"). Strong typing catches bugs at compile time. Immutability prevents subtle bugs from shared state mutation and enables easier reasoning about code.

### VII. Immutability & State Management

**Manage state predictably using BLoC pattern.**

**State Management Rules**:

- Use `flutter_bloc` (v9.1.1+) for all feature state management
- Each feature MUST have a BLoC or Cubit managing its state
- State classes MUST be immutable (use Freezed for state unions)
- UI MUST react to state changes (BlocBuilder, BlocListener, BlocConsumer)
- NEVER mutate state directly; emit new state objects

**BLoC Best Practices**:

- Events represent user actions or external triggers
- States represent UI representations (loading, success, error, etc.)
- BLoC logic MUST be unit tested independently of UI
- Use `bloc_test` package for testing BLoCs
- Dispose BLoCs properly to prevent memory leaks

**Data Flow**:

```
User Action → Event → BLoC → Use Case → Repository → Data Source
                ↓
            New State → UI Update
```

**Global State**:

- App-level state (auth, theme, locale) managed by dedicated BLoCs
- Provide global BLoCs at app root via BlocProvider
- Feature-specific state isolated to feature modules

**Rationale**: BLoC pattern separates business logic from UI, making both independently testable. Immutable state prevents race conditions and makes state changes explicit and traceable. Predictable state flow simplifies debugging.

## Development Standards

### Version Control

- **Flutter SDK**: 3.35.0+
- **Dart SDK**: 3.9.0+
- Branch strategy: `main` (production), `develop` (integration), feature branches (`###-feature-name`)
- Commits MUST follow Conventional Commits format: `type(scope): description`
  - Types: `feat`, `fix`, `docs`, `test`, `refactor`, `perf`, `chore`
- Pull requests require passing CI (linting + tests) before merge

### Dependencies

- Keep dependencies up to date (monthly review recommended)
- Pin major versions in `pubspec.yaml` to avoid breaking changes
- Document reason for each dependency addition
- Prefer official Flutter packages over third-party when available
- Required packages for architecture:
  - State: `bloc`, `flutter_bloc`
  - DI: `get_it`
  - Immutability: `freezed`, `freezed_annotation`
  - JSON: `json_annotation`, `json_serializable`
  - Testing: `mocktail`, `bloc_test`

### Code Generation

- Use `build_runner` for code generation (Freezed, JSON serialization)
- Run `dart run build_runner build --delete-conflicting-outputs` after model changes
- Generated files (`*.freezed.dart`, `*.g.dart`) excluded from linting
- NEVER manually edit generated files

### Flavors & Environments

- Three flavors: `development`, `staging`, `production`
- Each flavor has dedicated entry point: `main_development.dart`, `main_staging.dart`, `main_production.dart`
- Environment-specific configs in `core/config/env/`
- Run with: `flutter run --flavor <flavor> --target lib/main_<flavor>.dart`

## Quality Gates

All features MUST pass these gates before merging:

### 1. Test Gate

- [ ] All tests pass locally: `very_good test --coverage --test-randomize-ordering-seed random`
- [ ] Test coverage ≥80% (verify with `genhtml coverage/lcov.info -o coverage/`)
- [ ] All test categories present: unit, widget, integration, contract
- [ ] Tests follow AAA pattern (Arrange, Act, Assert)

### 2. Lint Gate

- [ ] Zero linter errors: `flutter analyze`
- [ ] Zero linter warnings (fix or suppress with justification)
- [ ] Formatting compliant: `dart format --set-exit-if-changed .`

### 3. Architecture Gate

- [ ] Clean Architecture layers respected (domain ← data, domain ← presentation)
- [ ] No domain layer dependencies on Flutter or external packages
- [ ] Use cases implement single responsibility
- [ ] All dependencies injected via GetIt

### 4. Performance Gate

- [ ] No frame drops in performance profiling (`flutter run --profile`)
- [ ] Memory leaks checked (dispose all controllers/streams)
- [ ] Large lists use lazy loading (builder patterns)

### 5. UX Gate

- [ ] All text uses l10n (no hardcoded strings)
- [ ] Theme values used (no hardcoded colors/text styles)
- [ ] Accessibility labels present on interactive widgets
- [ ] Error states handled gracefully

### 6. Documentation Gate

- [ ] Public APIs documented with doc comments
- [ ] README updated if feature affects usage or architecture
- [ ] Complex logic explained with inline comments

## Governance

### Constitution Authority

This constitution supersedes all other practices, conventions, or guidelines. When conflicts arise, constitutional principles take precedence.

### Amendment Process

1. **Proposal**: Document proposed change with rationale and impact analysis
2. **Review**: All team members review and provide feedback
3. **Approval**: Requires consensus (or majority vote if consensus not reached)
4. **Migration**: Create migration plan for existing code if needed
5. **Documentation**: Update constitution with new version number

### Versioning

Constitution follows semantic versioning:

- **MAJOR**: Backward-incompatible governance changes or principle removals
- **MINOR**: New principles added or materially expanded guidance
- **PATCH**: Clarifications, wording improvements, non-semantic refinements

### Compliance Review

- Constitution compliance verified during code reviews
- Violations must be justified or refactored before merge
- Technical debt from constitutional violations tracked and prioritized
- Monthly review of adherence and effectiveness

### Living Document

This constitution is a living document. As the project evolves, principles may be refined, added, or removed through the amendment process. The goal is continuous improvement while maintaining stability.

---

**Version**: 1.0.0 | **Ratified**: 2025-10-05 | **Last Amended**: 2025-10-05
