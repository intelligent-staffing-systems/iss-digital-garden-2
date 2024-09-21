---
title: ISS Appointment Setter
description: 
aliases: []
tags: []
draft: true
date: 2024-08-25
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
- [ ] [[Set up mock phone call system]]
- [ ] [[Set up audio streaming from Next to Ruby to mini-omni]]
- [ ] [[Database Integration]]
   - [ ] Design schema for storing conversation logs and transcriptions
   - [ ] Implement data persistence layer in Ruby on Rails
- [ ] [[Rails API Integration]]
   - [ ] Create endpoints in Rails to interface with LLM services
   - [ ] Implement authentication and request validation
   - [ ] Use transcription for a huggingface model tuning pipeline
- [ ] [[Next.js Frontend Integration]]
   - [ ] Develop UI components for appointment setting
   - [ ] [[Reverse engineer Air Api]]
   - [ ] [[Build out my own version of Air, prioritizing scalability and security]]
   - [ ] Implement API calls to Rails backend
- [ ] [[Testing and Optimization]]
   - [ ] Write unit and integration tests for all components
   - [ ] Perform load testing and optimize for production use
- [ ] [[Deployment and Scaling]]
    - [ ] Set up Docker containers for each service
    - [ ] Implement load balancing and auto-scaling strategies

## Other links
[[ISS Appointment Setter - Initial Idea]]
[[ISS setter system prompt]]
[[LLM Phone Caller System Architecture]]