---
draft: false
title: "How vibe-coding has liberated me from my own OCD"
date: 2026-08-30
cover:
  image: "cover.png"
---

"Vibe coding" has become the tech industry's latest favourite buzzword. Depending on who you ask, it's either an undisciplined hack where engineers blindly mash tab until something compiles, or a magical utopian future where software writes itself.

In practice, neither extreme captures the reality. Real vibe coding isn't about surrendering your brain to the LLM; it's about shifting your role from a typist to an architectural director. 

And frankly? It is utterly addictive.

There is nothing quite like having a sudden spark of inspiration at 10 PM and holding a working, interactive prototype in your hands by midnight. It feeds your creative juices in a way traditional coding simply couldn't match. For someone like me, the real superpower isn't just raw speed—it's cognitive liberation. It completely prevents me from getting bogged down in the weeds of boilerplate syntax, library quirks, or endless configuration rabbit holes. Instead, I can stay laser-focussed on what actually matters: the user experience, the features, and the end outcome.

The best part? This process isn't rocket science, and you don't need to be Silicon Valley royalty or hold a PhD in AI to pull it off. It simply comes down to heavy daily usage, developing good taste, and knowing how to steer your tools rather than fighting them.

Over the last several months of building with AI agents, my workflow has settled into a reliable, repeatable loop. Here is the exact framework I use to go from a random spark of an idea to working software.

## 1. The Spark: Capture the Intent, Not the Syntax

Every project starts with an itch—a friction point in my daily workflow, an experiment I want to test, or a gap in existing tooling.

In the past, countless great ideas died on the backburner because the activation energy was too high. The thought of setting up a new repo, configuring bundlers, picking UI libraries, and writing boilerplate was enough to kill the momentum before it even started.

Vibe coding eliminates that friction entirely. The goal at this stage is purely conceptual: capture what the thing should actually *do*. What are the inputs? What are the expected outputs? What does success feel like? By keeping this phase unburdened by syntax, you let the creative energy flow without hitting technical roadblocks.

## 2. Deep Ideation & Architectural Planning with Heavyweight Models

Before touching a single file or running a build command, I enter **Plan Mode** paired with a top-tier frontier model (like Gemini 3.1 Pro or Claude in Thinking mode).

You don't need heavyweight dedicated PRD platforms like Fable here—in my experience, they are simply too expensive and overly cumbersome for agile vibe coding. A strong model inside a capable agentic environment gives you all the architectural firepower you need.

The goal here isn't to write code; it's to stress-test the concept:
- **Architectural Discovery:** What is the right stack for this? What data models make sense?
- **Trade-off Analysis:** What are the edge cases, security implications, or scalability traps?
- **Step-by-Step Milestones:** What is the minimal viable path to get a functioning prototype?

In Plan Mode, the agent researches the workspace, produces comprehensive design plans, and surfaces the hard questions before we lay a single brick. 

Crucially, **actually reading the plan and refining it is essential**. Blindly clicking "Approve" completely defeats the purpose of being an architectural director. This is where **Antigravity's plan comment UI** shines: you can review the generated plan, highlight sections, leave granular inline comments, and iterate on the approach before execution begins. Thinking and collaborating deeply upfront costs a few extra cents in API tokens, but it saves hours of debugging half-baked architectures down the road.

## 3. Scaffolding v1: Laying the Foundations

Once the plan is locked in, the heavy model takes the wheel to build **v1**.

This phase is all about laying down the core structures:
- Bootstrapping the scaffolding and configuration
- Writing foundational interfaces, data structures, and core logic
- Setting up the base testing and verification harness

Because the frontier model has full architectural context from the planning stage, it can generate clean, cohesive scaffolding without hallucinating conflicting patterns. By the end of this step, I have a working, albeit minimal, end-to-end prototype.

## 4. Rapid Iteration with Smaller, Nimble Models

Once v1 is up and running, I switch gears. Keeping a massive reasoning model on the line for small tweaks is overkill—it's slow, expensive, and unnecessary.

For day-to-day iteration, UI polish, copy tweaks, unit tests, and bug fixes, I drop down to smaller, faster models (such as Gemini 3.7 Flash or Claude Haiku).

At this stage, the task complexity changes:
- "Make this button pop with a subtle hover effect"
- "Add validation to prevent duplicate submissions"
- "Format this timestamp nicely"
- "Refactor this helper function into a reusable utility"

Fast models execute these instructions in milliseconds. The feedback loop becomes instantaneous, letting you enter a state of true flow. You test, provide prompt feedback, review the diff, and keep moving.

## 5. The Multi-Agent Ecosystem: Using the Right Tool for the Job

No single agent or tool dominates every workflow. The secret to productive vibe coding is treating agents like specialized team members rather than an all-in-one monolith:

* **Antigravity IDE:** Fantastic for end-to-end autonomous pair-programming, planning complex tasks, executing CLI workflows, and deep codebase customisations via workspace skills and rules.
* **Cursor / VS Code Agents:** Unbeatable for inline edits, autocomplete, rapid code navigation, and tight editor-centric micro-refactors.
* **Claude Code / CLI Agents:** Invaluable for terminal-first work, headless repository transformations, and raw git-driven batch workflows.

Knowing when to switch tools is half the battle. If I need a holistic overhaul or multi-step execution, I'll leverage Antigravity. If I'm tweaking CSS or stepping through breakpoints, I'll jump into my editor.

## Final Thoughts: The Art of Direction

Vibe coding doesn't mean switching off your critical thinking. If anything, it demands *better* taste, stronger architectural instincts, and sharper validation skills.

When you master the transition from **Heavy Model Planning $\rightarrow$ Foundation Building $\rightarrow$ Rapid Multi-Agent Iteration**, you stop wrestling with syntax and start operating at the speed of thought.

> ### 💡 An Honest Addendum on Cost
> 
> Let's talk about the elephant in the room: **this workflow is not free**.
> 
> I easily consume between **$500 to $1,000 worth of compute and API usage every month**. There is no getting around it—heavy model planning, agentic multi-turn loops, and rapid iteration burn through serious tokens.
> 
> In my day job, I'm fortunate to have access to a high-tier usage allowance that comfortably absorbs that volume. For home tinkering and personal projects, my setup is leaner: a **Google AI Pro (Antigravity)** subscription and **Cursor Pro** are more than enough to keep me moving. Because I build less outside of work hours, those flat-rate tiers keep personal costs predictable while maintaining high speed.
> 
> If you want to vibe code at a high level, compute is simply part of your developer toolchain now—just like hardware, internet, or cloud hosting. It costs real money, but the return on investment in pure velocity, momentum, and unblocked creativity is worth every penny.
