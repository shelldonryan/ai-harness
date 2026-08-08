# C4 View Selection

Select the smallest set of views that answers the current architecture questions.

## System Context

**Scope:** One software system.

**Shows:** The system in scope, people who use it, and directly connected external software systems.

**Audience:** Technical and non-technical stakeholders.

**Use when:** Establishing system boundaries, actors, ownership, and external dependencies.

Avoid internal containers, frameworks, protocols, and deployment details. Describe why each person or system interacts with the system in scope.

## Container

**Scope:** One software system.

**Shows:** Applications, processes, and data stores inside the system; directly connected people and external systems; responsibilities, major technologies, and communication.

**Audience:** Developers, architects, and operations/support.

**Use when:** Communicating the high-level technical structure and allocation of responsibilities.

A C4 container can be a server application, browser application, mobile app, desktop app, background worker, database, object store, or similar runtime element. It is not limited to operating-system or Docker containers.

Do not show load balancers, replicas, clusters, or environment-specific nodes here unless they are architectural applications in their own right. Use a Deployment view for topology.

## Component

**Scope:** One container.

**Shows:** Significant structural responsibilities inside that container, their interactions, and directly connected external elements.

**Audience:** Developers and architects working with the container.

**Use only when:** The container is complex, responsibility or dependency structure is unclear, onboarding benefits, or a planned change needs the view.

Do not equate components with features, classes, endpoints, React components, or tables. Prefer generating long-lived component views from code where practical.

## Dynamic

**Scope:** One scenario across a selected set of elements.

**Shows:** Ordered runtime interactions for an important use case, failure path, asynchronous workflow, or cross-container feature.

Use sequence diagrams or numbered relationships. Reference existing C4 element names and IDs. Keep one scenario per view.

## Deployment

**Scope:** One software system in one environment.

**Shows:** Deployment nodes, infrastructure boundaries, and instances of software containers.

Use when topology, networking, regions, scaling, failover, security zones, or operational ownership matters. Keep logical container definitions in the Container view and show their instances here.

## System Landscape

**Scope:** An enterprise, organization, or broad product landscape.

Use only when several software systems and their relationships must be understood together. Do not use it as a more complicated Context diagram for one small product.

## Code

**Scope:** One component.

Use only for unusually complex implementation structures. Prefer diagrams generated from source, tests, or schema because manually maintained class-level diagrams become stale quickly.
