# Tasks: [FEATURE NAME]

**Input**: Design documents from `/specs/[###-feature-name]/`
**Prerequisites**: plan.md (required), research.md, data-model.md, contracts/

## Execution Flow (main)

```
1. Load plan.md from feature directory
   → If not found: ERROR "No implementation plan found"
   → Extract: tech stack, libraries, structure
2. Load optional design documents:
   → data-model.md: Extract entities → model tasks
   → contracts/: Each file → contract test task
   → research.md: Extract decisions → setup tasks
3. Generate tasks by category:
   → Setup: project init, dependencies, linting
   → Tests: contract tests, integration tests
   → Core: models, services, CLI commands
   → Integration: DB, middleware, logging
   → Polish: unit tests, performance, docs
4. Apply task rules:
   → Different files = mark [P] for parallel
   → Same file = sequential (no [P])
   → Tests before implementation (TDD)
5. Number tasks sequentially (T001, T002...)
6. Generate dependency graph
7. Create parallel execution examples
8. Validate task completeness:
   → All contracts have tests?
   → All entities have models?
   → All endpoints implemented?
9. Return: SUCCESS (tasks ready for execution)
```

## Format: `[ID] [P?] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- Include exact file paths in descriptions

## Path Conventions

- **Single Flutter app**: `lib/features/`, `test/features/` at repository root
- **Full-stack**: `backend/src/`, `lib/features/`
- **Multi-platform**: `packages/core/lib/`, `apps/mobile/lib/`
- Paths shown below assume single Flutter app - adjust based on plan.md structure

## Phase 3.1: Setup

- [ ] T001 Create project structure per implementation plan
- [ ] T002 Add dependencies to pubspec.yaml (flutter_bloc, get_it, freezed, etc.)
- [ ] T003 [P] Configure linting in analysis_options.yaml (if not already configured)
- [ ] T004 [P] Set up dependency injection in lib/app/injection.dart

## Phase 3.2: Tests First (TDD) ⚠️ MUST COMPLETE BEFORE 3.3

**CRITICAL: These tests MUST be written and MUST FAIL before ANY implementation**

- [ ] T005 [P] Contract test for UserRepository.getUser in test/features/user/data/repositories/user_repository_test.dart
- [ ] T006 [P] Contract test for UserLocalDataSource.getUser in test/features/user/data/datasources/user_local_data_source_test.dart
- [ ] T007 [P] Unit test for GetUserUseCase in test/features/user/domain/usecases/get_user_test.dart
- [ ] T008 [P] Widget test for UserProfilePage in test/features/user/presentation/pages/user_profile_page_test.dart
- [ ] T009 [P] BLoC test for UserBloc in test/features/user/presentation/bloc/user_bloc_test.dart
- [ ] T010 [P] Integration test for user profile flow in test/integration/user_profile_flow_test.dart

## Phase 3.3: Core Implementation (ONLY after tests are failing)

- [ ] T011 [P] User entity in lib/features/user/domain/entities/user.dart
- [ ] T012 [P] UserModel (Freezed) in lib/features/user/data/models/user_model.dart
- [ ] T013 [P] UserRepository interface in lib/features/user/domain/repositories/user_repository.dart
- [ ] T014 [P] UserLocalDataSource interface in lib/features/user/data/datasources/user_local_data_source.dart
- [ ] T015 GetUserUseCase in lib/features/user/domain/usecases/get_user.dart
- [ ] T016 UserRepositoryImpl in lib/features/user/data/repositories/user_repository_impl.dart
- [ ] T017 UserLocalDataSourceImpl in lib/features/user/data/datasources/user_local_data_source_impl.dart
- [ ] T018 UserBloc (events + states) in lib/features/user/presentation/bloc/user_bloc.dart
- [ ] T019 UserProfilePage widget in lib/features/user/presentation/pages/user_profile_page.dart
- [ ] T020 Register dependencies in lib/app/injection.dart

## Phase 3.4: Integration

- [ ] T021 Connect UserLocalDataSource to Drift database
- [ ] T022 Add error handling (Failures, Either pattern if using dartz)
- [ ] T023 Add loading states to BLoC
- [ ] T024 Implement l10n strings in lib/l10n/arb/app_en.arb

## Phase 3.5: Polish

- [ ] T025 [P] Add unit tests for edge cases in test/features/user/domain/
- [ ] T026 Run code generation: dart run build_runner build --delete-conflicting-outputs
- [ ] T027 Format code: dart format .
- [ ] T028 Analyze code: flutter analyze (fix all warnings/errors)
- [ ] T029 Run all tests: very_good test --coverage --test-randomize-ordering-seed random
- [ ] T030 Verify coverage ≥80%: genhtml coverage/lcov.info -o coverage/
- [ ] T031 [P] Update README.md with feature documentation
- [ ] T032 Remove code duplication (extract common widgets/utilities)

## Dependencies

- Tests (T005-T010) before implementation (T011-T020)
- T011 blocks T012 (entity before model)
- T013 blocks T016 (interface before implementation)
- T014 blocks T017 (interface before implementation)
- T015 blocks T018 (use case before BLoC)
- T018 blocks T019 (BLoC before UI)
- T020 after all implementations (DI registration last)
- Code generation (T026) before analysis/tests (T027-T030)

## Parallel Example

```
# Launch T005-T010 together (all test files, independent):
Task: "Contract test for UserRepository.getUser in test/features/user/data/repositories/user_repository_test.dart"
Task: "Contract test for UserLocalDataSource.getUser in test/features/user/data/datasources/user_local_data_source_test.dart"
Task: "Unit test for GetUserUseCase in test/features/user/domain/usecases/get_user_test.dart"
Task: "Widget test for UserProfilePage in test/features/user/presentation/pages/user_profile_page_test.dart"
Task: "BLoC test for UserBloc in test/features/user/presentation/bloc/user_bloc_test.dart"
Task: "Integration test for user profile flow in test/integration/user_profile_flow_test.dart"
```

## Notes

- [P] tasks = different files, no dependencies
- Verify tests fail before implementing
- Commit after each task
- Avoid: vague tasks, same file conflicts

## Task Generation Rules

_Applied during main() execution_

1. **From Contracts** (if API integration):
   - Each contract file → contract test task [P]
   - Each endpoint → repository implementation task
2. **From Data Model**:
   - Each entity → domain entity task [P]
   - Each entity → data model task (Freezed) [P]
   - Relationships → repository tasks
3. **From User Stories**:
   - Each story → integration test [P]
   - Each screen → widget test [P]
   - Each user interaction → BLoC test [P]
4. **Clean Architecture Pattern**:

   - Domain layer first (entities, repository interfaces, use cases)
   - Data layer second (models, data sources, repository impls)
   - Presentation layer last (BLoCs, pages, widgets)

5. **Ordering**:
   - Setup → Tests → Domain → Data → Presentation → Polish
   - Tests ALWAYS before corresponding implementation
   - Dependencies block parallel execution
   - Code generation after all implementations, before final tests

## Validation Checklist

_GATE: Checked by main() before returning_

- [ ] All contracts have corresponding tests
- [ ] All entities have model tasks
- [ ] All tests come before implementation
- [ ] Parallel tasks truly independent
- [ ] Each task specifies exact file path
- [ ] No task modifies same file as another [P] task
