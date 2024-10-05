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

AS a professional who needs automated AI appointment setting with my current customers
I NEED an agent that can effectively set up those customer appointments and give me clear visiblity into those interactions
SO THAT I can ensure my clients are utilizing our available products and services
## Acceptance Criteria - Milestone Features
- [ ] user has clear calendar and upcoming appointments synced with their microsoft calendar
- [ ] user can upload a list of current customers, and can queue up names that they want to have the AI agent call
- [ ] a user clicks a button from next.js frontend to call a list of names and numbers they have queued up
- [ ] this initiates a call to the ruby on rails backend which then initiates a call to the queued phone numbers
- [ ] as it calls, on our end is an LLM application that will actually be handling the phone call once someone answers.
- [ ] Calls have a customized, professional voice with a customized scripts
- [ ] If it goes to voicemail, we need to leave a message saying "calling from ___ office to set an appointment"
- [ ] If they answer, then the AI agent needs to be able to latency-free respond and set up an appointment into a microsoft calendar
- [ ] we use the freeswitch CDR and AI conversation transcript to create a record for each queued number, since these numbers will be long time customer profiles that records if they answered, when they last answered, how the history of calls have gone with them,  and if they have an active appointment or when they had their last one.

- [x] [[Containerized NextJS frontend]]
- [x] [[Client authorization and authentication into dashboard]]
- [x] [[Containerized Ruby on Rails backend]]
- [x] [[Docker Compose Full Stack]]
- [ ] [[Phonify - Simulated Telephony Environment]] \
- [ ] Integrate mini-omni to be on the outgoing calls
- [ ] set up calendar integration and give info for mini-omni to set up appointments
- [ ] set up function for calendar appointment andgive ini-omni access to the function
- [ ] refine a basic appointment setter script
- [ ] set up database schemas and instructions for managing calls and customer data
- [ ] set up monitoring and feedback for critical call status (duration, voicemail)
- [ ] set up tests - integration, unit, and regression
- [ ] clone repo to make a custom solution for AFI - microsoft only and scripts
- [ ] should be ready

[[possible next steps for the iss appointment setter]]

## Other links
[[ISS setter system prompt]]  
[[LLM Phone Caller System Architecture]]  
[[Implementing Google and Microsoft OAuth in Next.js with App Router]]  
[[ISS Profit Estimation and Stakeholder Proposal]]