# Writing Style: No AI Patterns

Shared writing rules for every B24 LaunchKit artifact. Producing skills apply them while writing; `b24-reviewer` checks against them. This file is the single source for these rules: skills link here instead of repeating them.

Good writing is invisible. When readers notice the style, it distracts from the content. AI patterns are noticeable, and they break the buyer's trust in the app being described.

## Scope

- These rules govern wording only. Factual rules in the producing skill and the `Do Not Claim` guardrails always win: never add, drop, or soften a fact to make a sentence sound better.
- The examples are in English. When the artifact is in another language, apply the same pattern in that language: its own empty intensifiers, bureaucratic phrasing, throat-clearing openers, and fragment rhythm.
- Structured parts of an artifact (headings, tables, numbered steps, bullet lists where the skill template allows them) are not "staccato". The rhythm rules apply to running prose.

## Banned words (delete or replace)

| Word | Why it's bad | Alternative |
|------|--------------|-------------|
| delve | AI signature word | explore, examine, look at |
| realm | Pretentious | area, field |
| tapestry | Purple prose | (delete entirely) |
| landscape | Corporate speak | situation, environment |
| leverage | Jargon | use |
| utilize | Jargon | use |
| robust | Meaningless | strong, reliable |
| seamless | Almost always false | smooth, easy |
| comprehensive | Rarely necessary | full, complete |
| cutting-edge | Cliché | modern, new |
| holistic | Corporate | complete, full |
| synergy | Corporate | (delete, rewrite) |
| paradigm | Overused | model, approach |
| empower | Vague | (say what the user can now do) |
| innovative | Empty praise | (describe what is new) |
| transformative | Hyperbolic | changed, improved |
| rich (as modifier) | Empty | (delete or be specific) |

## Banned phrases

Throat-clearing (delete entirely):

- "It's important to note that..."
- "In today's [X] landscape..."
- "Let's dive/delve into..."
- "Without further ado..."
- "In this article/guide, we will..."
- "It's worth mentioning that..."
- "It goes without saying..."
- "As we all know..."

Empty hedges:

- "To be fair..." / "To be honest..."
- "At the end of the day..."
- "When it comes to..."
- "In terms of..."
- "With respect to..."

AI enthusiasm:

- "This is a game-changer"
- "...and that's a good thing!"
- "Here's the thing:"
- "...and that's okay!"

Corporate buzzwords:

- "Moving forward..." / "Going forward..."
- "At this point in time..."
- "Due to the fact that..."
- "In order to..."

## Banned rhythm: AI staccato

The most recognizable AI pattern is choppy dramatic fragments: a short sentence followed by a contradicting or punch-line fragment, used for rhetorical effect. Short sentences are fine; fragments used for drama are not.

Contrast fragment:

- ❌ "Other tools copy deals. This one copies history. Not just records."
- ✅ "The app transfers deals together with their activity history, not only the records."

Punch-line fragment:

- ❌ "The migration runs in the background. While your team keeps working."
- ✅ "The migration runs in the background while the team keeps working in Bitrix24."

Staccato list:

- ❌ "No spreadsheets. No manual re-entry. No lost comments."
- ✅ "Data moves without spreadsheets or manual re-entry, and comments stay attached to their records."

## Banned sentence openers and endings

Do not start sentences with:

- "So," or "Well,"
- "Now," (when not about time)
- "Look," or "Listen,"
- "Basically," or "Essentially,"

Do not end sentences with:

- "...right?"
- "...you know?"
- "...if you will"

## Substitution table

| If you wrote | Write instead |
|--------------|---------------|
| utilize | use |
| facilitate | help |
| implement | build, add, create |
| leverage | use |
| functionality | feature |
| methodology | method |
| in order to | to |
| due to the fact that | because |
| at this point in time | now |
| a large number of | many |
| in the event that | if |
| prior to | before |
| subsequent to | after |
| in close proximity to | near |
| has the ability to | can |

## Headings

Use sentence case for headings, not title case: "How the migration works", not "How The Migration Works". Skill templates show headings in title case only as semantic placeholders; the written artifact uses sentence case.

## Patterns to avoid in product text

- "Not just X, it's Y": ❌ "This isn't just an integration, it's a new way of working." ✅ State what the app does.
- "Fundamentally transforms": ❌ "It fundamentally transforms how sales teams operate." ✅ Describe the actual change.
- Inflated significance: ❌ "a major milestone", "a groundbreaking solution". ✅ Give the facts and let the buyer judge.
- Empty transitions: ❌ "With that in mind...", "Building on this foundation...", "Taking this a step further...". ✅ Make the next point.

## Before and after

AI slop:

> In today's rapidly evolving business landscape, it's crucial to leverage robust tools. Let's delve into how this comprehensive solution seamlessly empowers your team.

Human writing:

> The app creates a Bitrix24 task for every overdue invoice and assigns it to the deal owner.

## Red flags in technical and product writing

1. Lists of near-synonyms: "comprehensive, sophisticated, and robust" (pick one or none).
2. Excessive hedging: "may potentially be able to possibly...".
3. Noun stacking: "production-ready deployment system infrastructure".
4. Passive voice hiding agency: "It was determined that..." (by whom?).
5. Circular definitions: "The app enables users to use the functionality."

## Final check

Before handing over the artifact:

1. Search the text for the banned words and phrases above, and for their equivalents in the output language.
2. Can this word or phrase be deleted without losing meaning? Delete it.
3. Is this the simplest way to say it? Simplify.
4. Would you say this out loud to a colleague? If not, rewrite. A TED-talk intro, a LinkedIn post, or a press-release tone means rewrite.
5. Does this add information or only sound impressive? If the latter, cut it.

---

Adapted from the `ai-writing-detox` skill in [alenazaharovaux/share](https://github.com/alenazaharovaux/share/blob/main/skills/ai-writing-detox/SKILL.md), based on [jamditis/claude-skills-journalism](https://github.com/jamditis/claude-skills-journalism). Copyright (c) 2025 Joe Amditis, MIT License.
