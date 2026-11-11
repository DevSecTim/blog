---
draft: false
title: "The Economics of Specificity"
date: 2026-11-11
cover:
  image: "cover.png"
---

There is a particular kind of software project I used to dismiss before it began: anything too specific, too personal, or too tied to a strange collection of hardware and an awkward workflow that nobody else shared. Even when the problem annoyed me every week, I could not justify spending days building the solution, so the sensible choice was to work around it.

That calculation has changed because modern AI coding tools let me build software for an audience of one. I can create a widget for a device I own, a dashboard for a workflow only I have, or an entire scripting system around a collection of hardware that no commercial developer would target.

The change is economic: AI has made specificity affordable.

## The software nobody would build for me

My home cinema is a good example. It is not a standard setup: there is a projector, an AV receiver, a Blu-ray player, games consoles, HDMI-CEC equipment, older infrared-controlled devices, smart lighting, a Bluetooth remote, voice control, and a Raspberry Pi holding everything together.

Each component works well enough on its own, but making the collection feel like one system is difficult.

Commercial products solve parts of that problem. There are universal remotes, smart-home platforms, phone apps, voice assistants, and manufacturer-specific control systems. None of them knows the exact combination of devices in my room, the order in which they need to start, or the shortcuts I want to use.

I could have adapted my habits to the available products by accepting several remotes, a collection of manufacturer apps, and a ritual of pressing buttons in the right order. Instead, I built Cinema Pi.

## The architecture of a personal system

Cinema Pi uses a Raspberry Pi as a local control hub. At the centre is a Rust execution engine called `cinema-ctl`. It turns simple intentions into the sequence of actions required by the physical equipment.

The system has several layers:

- YAML configuration defines actions, macros, inputs, power states, lighting, and media controls.
- HDMI-CEC handles modern devices connected through the HDMI bus.
- A Broadlink RM4 sends infrared commands to older equipment.
- A small Python tool controls network-connected lighting.
- `triggerhappy` maps buttons from a physical remote to cinema actions.
- A web interface provides a phone-friendly remote control.
- The same interface can be packaged for mobile use.
- Background services monitor parts of the system and keep the devices in sync.

The useful part is the layer between the user and the protocols, because it hides the awkward details behind a small set of actions that make sense in the room.

I do not want to think about HDMI-CEC addresses, infrared codes, amplifier inputs, projector warm-up times, or which device needs to wake first. I want to select “PlayStation”, “Blu-ray”, or “Cinema off”. Cinema Pi translates that intention into the awkward sequence of operations required by my room.

Cinema Pi is not a general-purpose home-automation platform; it is a control system built for one particular cinema.

## The same thing is happening at work

I have started applying the same idea to my working day. I script a surprising amount of what I do, from small pieces of personal admin to the repetitive steps around larger engineering tasks. These scripts are often too specific to be useful outside my own workflow, which is exactly why I would never have found the time to build them before.

The same applies to tools I build for my teams. They are not general products or polished platforms. They solve repetitive tasks that only make sense for our particular processes, terminology, and constraints. A small command-line tool, dashboard, or automation can save the team enough friction to justify its existence even when nobody else could use it.

AI makes these projects practical because I can describe the outcome, generate a first version, and spend my time refining the parts that reflect how we actually work. The result is a growing layer of surprisingly bespoke software around the team, built because the cost of creating it is finally lower than the cost of tolerating the repetition.

## The old economics of software

Traditional software favoured generality and scale because a commercial application has to spread its development cost across a large enough audience. The developer pays for design, implementation, testing, support, documentation, distribution, compatibility, and maintenance.

That makes narrow edge cases difficult to justify. A company cannot spend months building a feature for a problem experienced by a few hundred people, especially when those people have dozens of different hardware combinations.

Internal software has the same problem. A small team might have an inefficient process, but the cost of a custom tool can exceed the cost of continuing to work around it.

We learn to accept “close enough” software: a spreadsheet because a proper application would take too long, a note because building a database would be excessive, or five button presses because automating them would take longer than pressing them.

That trade-off made sense when each bespoke solution required a large amount of specialist labour.

## Specificity has become affordable

AI reduces the cost of the parts of software development that create the most friction:

- creating the initial project;
- learning an unfamiliar API or SDK;
- writing boilerplate;
- translating between protocols;
- building a basic interface;
- generating configuration;
- debugging integration problems;
- iterating on small changes;
- documenting the result.

The result matters more than faster typing, because many ideas now cross the line between “not worth building” and “worth trying this evening”.

The hardware integration in Cinema Pi was always technically possible. AI changed the effort required to move from an idea to a working system. It helped me move between Rust, Python, shell scripts, YAML, React Native, systemd, HDMI-CEC, infrared control, and mobile packaging without turning each transition into a separate research project.

That makes a highly particular system economically rational. Cinema Pi does not need users, a subscription model, or a product roadmap; it only needs to make my life more convenient often enough to repay the time spent creating it.

## The app nobody would ship

Cinema Pi is one example of a wider change: software can now be created for narrow contexts, unusual hardware, and individual workflows. Claude Artifacts make this visible in a particularly accessible way. You can describe a tool, visualisation, or interactive app in a conversation, then ask Claude to refine it until it fits the problem. [Anthropic describes Artifacts](https://support.anthropic.com/en/articles/9487310-what-are-artifacts-and-how-do-i-use-them) as shareable apps and tools that can be created without writing the code by hand.

That makes it reasonable to build the app nobody would ship. It might be a control panel for a peculiar collection of devices, a calculator for a decision only your team makes, or a small dashboard that combines two systems no vendor would integrate. The first version can exist before you have decided whether it deserves to become a proper project.

An Artifact does not need millions of users; it needs to solve a problem well enough to earn a place in one person’s workflow.

This pattern is appearing in business software too. Microsoft Power Apps can generate applications and data models from natural-language descriptions. Its planning tools can create broader solutions involving tables, apps, workflows, sites, and agents. That makes it practical to build a tool for one warehouse, one reporting process, or one department that would previously have remained in a spreadsheet.

The same approach works when the software mainly connects other software:

- a daily view combining a calendar, task list, and local notes;
- a script that turns messages into structured records;
- a dashboard for a particular collection of sensors;
- an interface over a private API;
- a translator between two systems that vendors have no reason to integrate;
- a natural-language front end for a local command-line tool.

These are not necessarily startup ideas; they are useful when they fit one person or one team exactly.

## From economies of scale to economies of one

The old software model was built around economies of scale:

> Build one thing and distribute it to millions.

AI-assisted development introduces another model:

> Build exactly the right thing for one person at very low cost.

The value is in removing friction from an individual life as well as in distributing software widely. That might mean saving ten minutes each day, removing a repeated annoyance, making a hobby more enjoyable, or enabling a workflow that was too awkward to attempt.

This is the economics of specificity. A highly specific system may have little value in the general market, but if the cost of creating it falls far enough, a market of one can be sufficient.

## The end of “close enough”

The most interesting consequence of AI-assisted development may be the number of people who can create software shaped around the exact contours of their lives. A bespoke interactive tool, a Raspberry Pi cinema controller, a hobby dashboard, a workshop interface, or a small automation script can exist because the cost of being specific has fallen so far.

For years, software rewarded generality. The future may reward precision too, because AI has made specificity economically viable.
