# UX And Design Review

Review in this order so visual polish does not hide behavioral defects.

## 1. Requirement Traceability

- Does each planned outcome have a flow or surface?
- Are acceptance and non-goals respected?
- Did the prototype introduce unapproved behavior?

## 2. Task And Recovery

- Can users identify the next action?
- Are alternate, cancel, back, and recovery paths coherent?
- Are loading, empty, partial, error, offline, permission, and success states handled where relevant?
- Are destructive actions understandable and recoverable where possible?

## 3. Information And Content

- Does hierarchy reflect user language rather than technical structure?
- Are labels, instructions, errors, and confirmations specific?
- Is important context available at the decision point?

## 4. Accessibility

For web work, use the current WCAG 2.2 Recommendation as the baseline: <https://www.w3.org/TR/WCAG22/>. Select applicable success criteria and target level explicitly rather than claiming broad conformance without evidence.

Check relevant behavior including:

- Semantic structure, names, roles, and values
- Keyboard access, focus order, visible focus, and no traps
- Text alternatives and status announcements
- Contrast, non-color meaning, reflow, and text resize
- Labels, instructions, error identification, and recovery
- Target size and alternatives to dragging or complex gestures
- Timeouts, motion, reduced motion, and flashing content
- Accessible authentication and redundant-entry behavior

Automated testing catches only a subset. Record manual keyboard, screen-reader, zoom/reflow, touch, and cognitive/content evaluation as applicable.

## 5. Responsive And Platform Behavior

- Does layout adapt rather than merely shrink?
- Are reading order and action priority preserved?
- Are touch, pointer, keyboard, and orientation behaviors appropriate?
- For mobile, are lifecycle, permissions, offline, and platform conventions respected?

## 6. Design-System Consistency

- Are existing tokens and components reused correctly?
- Do new patterns solve a recurring product need?
- Are variants and states coherent across surfaces?
- Does the visual direction fit the product rather than generic AI defaults?

## 7. Technical Handoff

- Are assets, fonts, licenses, tokens, content, and states identified?
- Are mocks and production data boundaries explicit?
- Are performance and browser/device constraints included?
- Can TLC derive verifiable implementation tasks?

## Finding Format

```markdown
### UX-01: <Finding>

**Type:** Requirement | Usability hypothesis | Accessibility | Consistency | Technical
**Severity:** Blocker | High | Medium | Low
**Evidence:** ...
**Affected:** Requirement, flow, surface, or component
**Recommendation:** ...
**Validation:** ...
```

Do not present personal taste as a usability or accessibility defect.
