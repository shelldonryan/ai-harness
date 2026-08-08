# C4 Review

Review both architectural truth and communication quality.

## Scope And Purpose

- Is the diagram type named?
- Is exactly one system or one container in scope for the core hierarchical views?
- Is the intended audience clear?
- Does the view answer a current question or support a decision?

## Elements

- Does every element have a unique, meaningful name?
- Is its C4 type explicit?
- Is its responsibility concise and distinct?
- Are internal and external ownership boundaries correct?
- Are technologies shown only where appropriate?

## Relationships

- Is every relationship directional?
- Does every label explain intent?
- Are protocols or asynchronous semantics shown when important?
- Are indirect relationships omitted unless they clarify the view?
- Do data stores have clear owners and readers/writers?

## Level-Specific Checks

### Context

- People and directly connected external systems only
- No internal applications, modules, databases, or framework details
- Understandable by non-technical readers

### Container

- All significant applications, processes, and stores inside the system boundary
- Responsibilities distributed without unexplained overlap
- Major communication paths and technology choices visible
- Deployment instances and infrastructure topology kept separate

### Component

- Exactly one container decomposed
- Components represent significant responsibilities, not implementation inventory
- External dependencies are shown only when directly connected
- The view provides enough value to justify maintenance

### Dynamic

- One scenario and a clear starting event
- Interactions ordered and named
- Failure or asynchronous behavior included when it changes understanding

### Deployment

- One environment named
- Container instances map back to the logical Container view
- Nodes, zones, regions, and trust boundaries shown only where relevant

## Consistency

- Element names and IDs agree across views.
- Container relationships refine rather than contradict Context relationships.
- Component relationships refine rather than contradict Container relationships.
- ADRs, domain ownership, feature designs, and diagrams agree.
- Brownfield recommendations are not presented as current facts.

## Artifact Value

Before approval, ask:

- Who will read this again?
- Which decision or task consumes it?
- What event should trigger an update?
- Could a smaller view or prose answer the same question?

Remove or consolidate a view when it has no useful maintenance path.
