# Container Profiles

Use these as decision prompts, not mandatory document sections.

## Web Application

- Rendering and delivery model: server, client, static, or hybrid
- Route and information architecture ownership
- Authentication session and authorization behavior
- Server/client state boundaries, caching, and invalidation
- Design-system reuse and responsive behavior
- Accessibility and keyboard behavior
- Loading, empty, error, offline, and recovery states
- Browser support and performance budgets
- Security headers, untrusted content, and browser storage
- Unit, component, integration, visual, and end-to-end tests
- Build, environment configuration, deployment, and observability

Load `ux-planning` for user experience, design-system, accessibility, and prototype decisions.

## Mobile Application

- Supported platforms, versions, devices, and form factors
- Navigation, deep links, and application lifecycle
- Authentication, secure local storage, and permissions
- Offline capability, local persistence, sync, and conflict behavior
- Push notifications and background work
- Platform service integrations
- Accessibility, localization, and adaptive layouts
- Network constraints, battery, startup, and runtime performance
- Unit, UI, device, integration, and release testing
- Signing, environments, store distribution, telemetry, and crash reporting

Do not assume the web interaction model transfers directly to mobile.

## API

- Consumers and contract ownership
- Protocol, resource or operation design, and versioning
- Authentication, authorization, trust boundaries, and abuse protection
- Validation, errors, pagination, filtering, and compatibility
- Idempotency, concurrency, transactions, and consistency
- Data ownership and persistence boundaries
- External integrations, timeouts, retries, and circuit behavior
- Audit, logs, metrics, traces, and correlation
- Unit, integration, contract, security, and end-to-end tests
- Deployment, configuration, migrations, scaling, and recovery

Do not expose internal domain entities as public contracts by default.

## Worker Or Scheduled Process

- Trigger, schedule, queue, topic, or event source
- Delivery semantics and ordering expectations
- Idempotency and deduplication
- Concurrency, partitioning, and backpressure
- Retry policy, poison messages, dead-letter handling, and replay
- Transaction boundaries and side-effect safety
- Checkpointing, cancellation, graceful shutdown, and recovery
- Logs, metrics, traces, alerts, and operational controls
- Deterministic unit tests plus integration and failure-path tests
- Deployment, scaling, ownership, and runbook needs

Do not say "exactly once" without defining the mechanism and boundary.

## Data Store

- Authoritative owner and permitted readers/writers
- Data model responsibilities and integrity rules
- Access patterns and performance expectations
- Migration and compatibility strategy
- Transactions, consistency, and concurrency
- Retention, privacy, encryption, and audit requirements
- Backup, restore, replication, and disaster recovery evidence
- Capacity, monitoring, maintenance, and operational ownership
- Schema, migration, integration, and recovery testing

Avoid shared-database coupling between independently evolving services unless explicitly accepted.

## External Integration Adapter

- External owner, contract, limits, and change policy
- Local interface and anti-corruption translation
- Authentication and secret handling
- Timeouts, retries, idempotency, quotas, and fallback
- Error classification and user impact
- Contract tests, sandbox behavior, and production observability

An adapter may be a component inside another container rather than its own container. Let runtime and deployment requirements decide.
