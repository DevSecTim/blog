---
draft: false
title: "Microsoft Certified: AI Certs Critically Reviewed"
date: 2025-04-01
---

Earlier this year I passed both the **AI-900: Microsoft Azure AI Fundamentals** and the more advanced **AI-102: Microsoft Azure AI Engineer Associate** exams.  This track was compelling due to both the topical nature of the subject matter and as stepping stones toward my longer term plan of attaining **AZ-305: Azure Solutions Architect Expert**.

I found them to be quite different in scope, depth, and the type of preparation required.  This short blog goes through some of these aspects and is intended as a primer to anyone else considering the certifications themselves.

## AI-900: Easy Introduction

AI-900 was relatively straightforward. It offered a broad overview of AI concepts—like machine learning, natural language processing, and computer vision—without requiring any coding or architectural deep-dives. Coming from a technical background with some previous machine learning experience, I found most of it intuitive, and the questions leaned heavily on comprehension of high-level concepts rather than hands-on implementation. 

This exam required only light study, mainly brushing up on Microsoft’s terminology and service offerings like Azure Cognitive Services.

**Easy bits:**

* Conceptual questions about AI use cases.
* General understanding of services like Language and Vision.
* No need to know how to deploy or build anything.

**Challenging bits:**

* Minimal, though I had to adjust to how Microsoft frames certain scenarios in their own language.

## AI-102: A Step Up in Complexity

AI-102, on the other hand, required much deeper understanding, especially around *building, securing, and optimising* AI solutions on Azure. This included working with the SDKs, REST APIs, and designing real-life solutions involving many of the services that come under the *Azure AI Services* umbrella. 

My background as a PhD and data scientist helped with grasping architecture patterns and integration scenarios, but the coding-level detail—especially around authoring LUIS models, using the Form Recognizer, or configuring QnA Maker—demanded a more focused, technical preparation that instead drew from my software engineering experience.

**Easy bits (due to experience):**

* Designing end-to-end solutions and securing APIs.
* Understanding architectural patterns for deploying AI workloads.
* Aligning AI services with enterprise use-cases.

**Challenging bits:**

* Low-level configuration, SDK and REST API details.
* Precise syntax or steps for integrating services like Speech or Language Understanding.
* Edge cases in deploying and optimizing AI models.

## Summary of Study Effort

* **AI-900**: \~1 week of light review, ideal for non-technical or semi-technical professionals.
* **AI-102**: 3–4 weeks of deeper study, especially if you’re not hands-on with Azure AI services daily. Hands-on labs and practice tests were essential.

### Bonus: Simulate Exam Questions with AI
The irony of practices for AI exams using AI itself is not lost on me, however, I would say it works very well and saves on the need to track down (and purchase in many cases) exam questions.  Instead I use the following prompt to have ChatGPT continually test me for my chosen exam:

 > *I am an IT Consultant working as a Solution Architect in financial services institutions.  I am looking for factual and punchy study assistance towards relevant Azure certifications.  My background is in resaarch, development, cloud and R&D.*
 >
 > *I require question simulations for AI-102; I would like hard questions that are representative of the requested certification, one question at a time, with the result presented right away as correct or incorrect with a tick or a cross; along with an explanation of the answers.  Keep the questions coming automatically (don’t ask) with checkpoints every 10 questions to show progress and if I am tracking as exam ready.  Make sure the questions are a cross-section of all the subjects in the given exam.*

— Tim 🏅