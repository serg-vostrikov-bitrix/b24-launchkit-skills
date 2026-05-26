---
name: b24-reviewer
description: Use when user needs to review one Bitrix24 LaunchKit artifact with a target-specific profile such as manual, positioning brief, marketplace description, or final claim review.
---

# B24 Reviewer

## Goal

Review one Bitrix24 LaunchKit artifact with one target-specific profile. The reviewer improves decision quality, not taste: it flags concrete issues that affect correctness, usefulness, publication safety, or marketplace effectiveness.

## Core Principle

Use finite review. Do not create endless improvement loops.

Only recommend a change when you can state the risk or quality loss it fixes. Do not suggest rewrites merely because another phrasing might sound nicer.

Default limits:

- one target artifact;
- one review profile;
- one review pass;
- maximum five findings total;
- optional polish never blocks use;
- after blocking and important issues are fixed, explicitly allow stopping.

## Profile Routing

Use the explicit `target_artifact_type` or `review_profile` from the user or orchestrator. Read only the matching reference file:

| Target artifact type | Reference file |
| --- | --- |
| manual | `references/manual-review.md` |
| positioning brief | `references/positioning-review.md` |
| marketplace description | `references/marketplace-description-review.md` |
| final claim review | `references/final-claim-review.md` |

Do not read or apply other profile files unless the user explicitly asks for separate reviews of multiple target artifacts.

If the artifact type is unclear, infer it from the target artifact only. Ask only when the wrong profile would make the review misleading.

## Workflow

1. Identify the target artifact path and target artifact type.
2. Read exactly one matching profile reference file.
3. Read the target artifact.
4. Read upstream artifacts only as evidence when the chosen profile requires them.
5. Apply only the chosen profile.
6. Return findings by priority, with concrete examples or replacement direction.
7. End with a stop condition: what is enough to fix before the artifact can be used.

Upstream artifacts are evidence, not additional review targets.

## Output Format

Translate all visible labels into the requested output language. The English labels below are semantic placeholders, not literal text to copy.

```markdown
# Review

Verdict: pass | pass with changes | revise

Artifact Type: manual | positioning brief | marketplace description | final claim review

## Blocking Issues
- <Issue, why it matters, suggested fix>

## Important Improvements
- <Issue, why it matters, suggested fix>

## Optional Polish
- <Non-blocking improvement>

## Stop Condition
<What is enough to fix before stopping instead of continuing to polish.>
```

Omit empty sections except `Verdict`, `Artifact Type`, and `Stop Condition`.

## Priority Rules

- `Blocking`: unsupported claim, hidden critical limitation, contradiction, wrong artifact type, or publication-risk issue.
- `Important`: weak value proposition, unclear target audience, missing key scenario, schema-dump writing, or buyer doubts that the target artifact does not answer.
- `Optional Polish`: wording improvement that helps clarity or flow but does not change publishability.

Do not include more than two optional polish items.

## Safety Rules

- Do not rewrite the full artifact unless the user explicitly asks for a rewrite.
- Do not edit the target artifact. Return findings only. The orchestrator or producing skill owns revisions.
- Do not invent product facts, claims, metrics, entities, integrations, formats, screens, or guarantees.
- Do not ask for internet research unless the user explicitly requests current external guidance.
- Preserve the artifact language unless the user asks for translation.
- If evidence is missing, mark the issue as an assumption or request the missing upstream artifact instead of filling the gap.
