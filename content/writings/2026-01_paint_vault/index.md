---
draft: false
title: "Vibe Coding: From Sofa to Paywall in One Evening"
date: 2026-01-18
cover:
  image: "cover.png"
---

Last night, I was sprawled on the sofa watching some low-quality UFO's-are-real show on Prime when an idea hit me: what if I built a simple app to experiment with paywalls and tiered subscriptions? Not because I had a grand business plan, but because I was curious how long it would take to spin up something functional from absolute zero. Three hours later, Paint Vault was live on Replit—a minimalist digital art gallery with Stripe-powered subscriptions and Clerk authentication.

This wasn't careful, spec-driven development. This was pure vibe coding: intuitive, experimental, and surprisingly effective.

## The Experiment: Speed Over Perfection

The goal was simple: build something that could validate a paywall concept while the TV droned in the background. I wanted to test how quickly modern tools could take me from idea to deployed app, and Paint Vault became the perfect guinea pig—a digital art showcase where users could upload paintings, browse galleries, and unlock premium features through subscriptions.

The tech stack practically (and in some cases literally) chose itself:
- **Replit** for hosting and development environment
- **Stripe** for payment processing and subscription management  
- **Clerk** for user authentication and session handling
- **React** with basic styling for the frontend
- **Node.js/Express** for the backend API

No complex architecture decisions, no lengthy planning sessions. Just pick the tools that work and start building.

## Replit: On Rails but Brilliant

Working in Replit felt like coding with training wheels—but the good kind. The platform handles deployment, environment setup, and hosting automatically. You literally just start typing code and it works. There's something liberating about not having to think about Docker containers, CI/CD pipelines, or server configuration when you're just trying to validate an idea.

Sure, you're somewhat locked into their ecosystem. The file structure is opinionated, the deployment process is abstracted away, and you don't have full control over the underlying infrastructure. But for rapid prototyping and experimentation? It's transformative. I went from empty project to live URL in minutes, not hours.

The "on rails" nature that might frustrate experienced developers becomes a superpower for vibe coding. Less decisions to make means more time spent on the actual problem you're trying to solve.

## Stripe Integration: Surprisingly Smooth

Getting Stripe working was easier than expected. Their new embedded checkout flow handled most of the complexity—I just needed to create products, define pricing tiers, and wire up a few webhooks. The subscription logic that I thought would take hours ended up being maybe 30 minutes of actual coding.

The real magic happened when I tested the first payment flow. Seeing a real credit card transaction (even in test mode) complete successfully felt like crossing some invisible threshold from "toy project" to "actual thing that could make money." That psychological shift is powerful when you're experimenting with business models.

## Clerk: Authentication Without the Headache

User authentication is usually where side projects go to die. The endless cycle of password hashing, session management, email verification, and password resets has killed more weekend experiments than I can count. Clerk eliminated all of that friction.

Drop in their React components, configure a few settings, and suddenly you have Google OAuth, email/password auth, user profiles, and session management. It just works. The integration with Stripe was seamless too—user IDs flow between systems without any manual mapping.

## The Vibe Coding Paradigm

This project crystallised something I've been thinking about: we're seeing three distinct approaches to software development emerge, each with their own strengths:

### 1. Assisted IDEs (Cursor/Kiro Style)
These tools augment traditional development with AI pair programming. You still write code, make architectural decisions, and manage complexity—but with an intelligent assistant helping with syntax, suggesting improvements, and catching errors. It's enhanced craftsmanship.

### 2. Spec-Driven Development (Kiro + Traycer)
This approach emphasises formal specifications, property-based testing, and systematic design before implementation. It's methodical, rigorous, and produces robust software—but requires upfront investment in planning and design.

### 3. Hands-Off Platforms (Replit Style)
These platforms flip the paradigm entirely. Instead of giving you better tools to write code, they abstract away the need to think about infrastructure, deployment, and configuration. You focus purely on business logic while the platform handles everything else.

## The Future is Pluralistic

What's interesting is that these approaches aren't competing—they're complementary. Different problems call for different tools:

- Building a mission-critical financial system? Use spec-driven development with formal verification.
- Refactoring a complex codebase? Lean on AI-assisted IDEs for intelligent suggestions.
- Validating a new business idea? Vibe code it on a platform like Replit.

The democratisation of software development means we can choose the right tool for the job rather than forcing every problem into the same methodological box. Sometimes you need the rigor of formal specifications. Sometimes you need the speed of vibe coding.

## Replit's Disruption

Platforms like Replit are genuinely disruptive because they change the economics of experimentation. When spinning up a new idea takes hours instead of days, you can afford to test more concepts, fail faster, and iterate more freely. The barrier to entry drops so low that "why not try it?" becomes the default response to new ideas.

This isn't just about individual developers—it's about changing how we think about software as a medium for exploration. When the cost of building something approaches zero, the bottleneck shifts from technical implementation to creative ideation.

## What's Next?

Paint Vault is live and functional, but it's really just a proof of concept. The real value was in the process: learning how quickly modern tools can take you from idea to reality, and experiencing firsthand how different development paradigms feel in practice.

Will I build the next unicorn startup using vibe coding? Probably not. But will I reach for this approach when I want to test an idea quickly? Absolutely. Sometimes the best way to understand a problem is to build a solution and see what breaks.

The future of software development isn't about choosing one approach over others—it's about having the right tool for each moment. Whether that's careful specification, AI-assisted craftsmanship, or pure vibe coding depends entirely on what you're trying to accomplish.

And sometimes, what you're trying to accomplish is just seeing how far you can get before the Netflix episode ends.

---

> Want to check out Paint Vault? Visit [paint-vault.replit.app](https://paint-vault.replit.app/) and see vibe coding in action. Or better yet, fire up Replit and see what you can build in your next TV break.
