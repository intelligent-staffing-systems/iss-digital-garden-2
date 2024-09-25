---
title: ISS Appointment Setter
---
## Overview
The ISS Appointment Setter is an innovative AI-powered system designed to automate and streamline the process of scheduling appointments. It leverages advanced language models and speech recognition technology to conduct real-time phone conversations with clients, handling appointment bookings efficiently and naturally.

Key features of the ISS Appointment Setter include:

    AI-driven customer-management interface
    Real-time speech-to-speech capabilities
    Integration with existing calendar systems (Microsoft and Google)
    Custom scripts and action for AI Agents for professional workflows
    Continuous learning and improvement through feedback

This system aims to reduce the workload on human staff, improve appointment scheduling efficiency, and enhance the overall customer experience by providing a seamless booking service.
## Architecture
This project implements an AI-powered appointment setting system using Next.js, Ruby on Rails, and various LLM services.
-  [[iss appointment setter system architecture]]
- [[Containerizing the LLM API - Future Considerations]]
### External integrations
- OAuth Authentication - users sign in with Microsoft, which we utilize for authentication, authorization, and calendar integration (Outlook)
- Lightning.ai gpu hosting 
## User Story
AS an employee making calls to set appointments for licensed organizations
I WANT an AI assistant to make appointments for me while staying compliant
I WANT an easy way to see my customers, last contact date, how calls have went, and to call based on criteria
## Acceptance Criteria - Milestone Features
- [x] [[Containerized NextJS frontend]]
- [x] [[Client authorization and authentication into dashboard]]
- [x] [[Containerized Ruby on Rails backend]]
- [x] [[Docker Compose Full Stack]]
- [ ] [[Phonify - Simulated Telephony Environment]]

[[possible next steps for the iss appointment setter]]

## Other links
[[ISS setter system prompt]]  
[[LLM Phone Caller System Architecture]]  
[[Implementing Google and Microsoft OAuth in Next.js with App Router]]  