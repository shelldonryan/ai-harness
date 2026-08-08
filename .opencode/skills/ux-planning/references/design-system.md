# Design-System Planning

A design system is a maintained product capability, not a one-time style guide. Create or extend it only when recurring interface decisions need shared language and implementation.

## Start From Product Use

1. Inventory existing tokens and components.
2. Map approved flows to needed patterns and states.
3. Reuse before adding.
4. Generalize only after at least one real use is understood.
5. Define ownership, testing, and change behavior.

## Suggested Documentation

Keep a concise `DESIGN_SYSTEM.md` section or file containing only durable decisions:

```markdown
# Design System

## Product Character And Principles
## Foundations
## Semantic Token Model
## Layout And Responsive Rules
## Typography Roles
## Color And Status Semantics
## Motion And Reduced Motion
## Component Inventory And Status
## Interaction And Accessibility Contracts
## Content Conventions
## Contribution And Change Rules
## Executable Sources
```

Do not manually copy every code token or component prop when code, generated documentation, or Storybook is the maintained source.

## Token Layers

- **Primitive:** raw palette, size, duration, and font values
- **Semantic:** purpose such as `surface`, `text-muted`, `danger`, or `focus-ring`
- **Component:** limited component-specific decisions when semantic tokens are insufficient

Design and consume semantic tokens by default. Avoid using a raw color name as the only meaning of an interface state.

## Component Contract

For a shared component, define:

- Purpose and when not to use it
- Anatomy
- Variants based on product need
- States including focus, disabled, loading, error, and selected where relevant
- Content rules
- Keyboard and assistive-technology behavior
- Responsive behavior
- Token dependencies
- Test and documentation status

Do not add variants merely for speculative flexibility.

## Governance

Record whether each pattern is proposed, experimental, stable, or deprecated. A breaking visual or behavioral change requires impact analysis across consuming features.

For an existing product, preserve established patterns unless the approved scope is a redesign. For a new product, define a distinctive visual direction rather than relying on default framework appearance.
