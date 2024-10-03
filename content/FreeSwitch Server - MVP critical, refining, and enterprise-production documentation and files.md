---
title: FreeSwitch Server - MVP critical, refining, and enterprise-production documentation
---

### MVP Critical files and documentation
- select files and directories from [docs/FreeSWITCH-Explained/Client-and-Developer-Interfaces](https://github.com/signalwire/freeswitch-docs/tree/main/docs/FreeSWITCH-Explained/Client-and-Developer-Interfaces)
	- it is likely within this realm that i may choose Lua over Ruby.   I will likely use XML and Lua for the server configuration and setting up api endpoints, which may mean I only end up using Ruby for communicating with the available inbound server endpoints i set up!  
	- - likely related to [docs/FreeSWITCH-Explained/Configuration/Configuring-FreeSWITCH/index.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Configuration/Configuring-FreeSWITCH/index.mdx), which is also critical
- [docs/FreeSWITCH-Explained/Dialplan](https://github.com/signalwire/freeswitch-docs/tree/main/docs/FreeSWITCH-Explained/Dialplan) - likely related to the lua vs ruby choice - which dirs and files are relevant?
	- [docs/FreeSWITCH-Explained/Dialplan/Channel-Variables_16352493.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Dialplan/Channel-Variables_16352493.mdx)


- [docs/FreeSWITCH-Explained/Modules/mod_commands_1966741.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Modules/mod_commands_1966741.mdx)
- [docs/FreeSWITCH-Explained/Modules/mod_event_socket_1048924.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Modules/mod_event_socket_1048924.mdx#21-inbound-mode)  
- [docs/FreeSWITCH-Explained/Modules/mod_esl_6587340.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Modules/mod_esl_6587340.mdx#about)
- [docs/FreeSWITCH-Explained/Client-and-Developer-Interfaces/Event-Socket-Library/index.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Client-and-Developer-Interfaces/Event-Socket-Library/index.mdx)  

- [docs/FreeSWITCH-Explained/Examples/Originate-Example_10682745.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Examples/Originate-Example_10682745.mdx) 
- probably everything in [docs/FreeSWITCH-Explained/Introduction/Event-System](https://github.com/signalwire/freeswitch-docs/tree/main/docs/FreeSWITCH-Explained/Introduction/Event-System) 
	- for sure [docs/FreeSWITCH-Explained/Introduction/Event-System/Events_32178330.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Introduction/Event-System/Events_32178330.mdx#0-about)  
- [docs/FreeSWITCH-Explained/Introduction/Event-System/Event-List_7143557.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Introduction/Event-System/Event-List_7143557.mdx#nat) - i am pretty sure is critical
- [docs/FreeSWITCH-Explained/Configuration/CDR](https://github.com/signalwire/freeswitch-docs/tree/main/docs/FreeSWITCH-Explained/Configuration/CDR)
- [docs/FreeSWITCH-Explained/Examples/Example-Hangup-hook_13174165.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Examples/Example-Hangup-hook_13174165.mdx#about)
- [docs/FreeSWITCH-Explained/Configuration/TTS_9634273.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Configuration/TTS_9634273.mdx#about) - for deciding whether to use TTS or my own mini-omni (utilizing TTS may be best for MVP)
	- this may also have influence on being able to have everything on a single server or needing to use Lightning.AI -- cause some smaller models are free and can be self-hosted!
- [docs/FreeSWITCH-Explained/Interoperability/Providers-ITSPs/20709712.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Interoperability/Providers-ITSPs/20709712.mdx) - to actually make phone calls
- [docs/FreeSWITCH-Explained/Interoperability/Caller-ID-Privacy_6587537.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Interoperability/Caller-ID-Privacy_6587537.mdx) 

### other important files
- modules.conf vs modules.conf.in in vanilla vs modules.xml in ______
-  [commands to start the server](://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Miscellaneous/FAQ/index.mdx#freeswitch--nc) - whether this changes once I know how Lua works IDK
-[libs/esl](https://github.com/signalwire/freeswitch/tree/master/libs/esl) - likely need to decide lua vs ruby, see docs for client and developer interfacces as well

### maybe critical
- getting the AI voice into the call - [docs/FreeSWITCH-Explained/Examples/Playing-recording-external-media_13173508.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Examples/Playing-recording-external-media_13173508.mdx)
	- utlizes the module [docs/FreeSWITCH-Explained/Modules/mod_shout_3965531.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Modules/mod_shout_3965531.mdx#21-play)
- Using

### useful FAQ
- [local dir rather than /usr/src/freeswitch](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Miscellaneous/FAQ/index.mdx#q-how-do-i-use-my-local-dir-instead-of-usrlocalfreeswitch)
- [running as a service](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Miscellaneous/FAQ/index.mdx#q-how-do-i-use-my-local-dir-instead-of-usrlocalfreeswitch)

## Refining - V2
- we will likely want to use [docs/FreeSWITCH-Explained/Modules/mod_conference_3965534.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Modules/mod_conference_3965534.mdx#list) for things like:
	- forcing the end of a call if things are getting out of hand
	- turning up the volume of our agent if they ask us to speak up
	- making turn-based interactions more clear (e.g. handling interruptions gracefully)
- Consider whether the TTS or mini-omni are truly more performant
- Consider[ IVR](docs/FreeSWITCH-Explained/IVR.mdx) and if/how we want to transfer calls to a real person if requested; and this may end up involving things like PBX
	- [docs/FreeSWITCH-Explained/Examples/Force-transfer-context-example_13173594.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Examples/Force-transfer-context-example_13173594.mdx#about) for transfer example
	- [docs/FreeSWITCH-Explained/Examples/Multi-line-rollover_9634397.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Examples/Multi-line-rollover_9634397.mdx#goal)
	- [park and retrieve](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Examples/13173503.mdx#about) for queue of incoming calls?
	- like will involve [mod_dptools](https://developer.signalwire.com/freeswitch/FreeSWITCH-Explained/Modules/mod_dptools_1970333/#Applications)
- [live session intercept](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Examples/Multi-line-rollover_9634397.mdx#goal) - which may be useful for intercepting rogue calls


## Enterprise-production
### Security
- [docs/FreeSWITCH-Explained/Modules/mod_abstraction_1966663.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Modules/mod_abstraction_1966663.mdx#about) -- for per-user api restrictions

### QA
- [docs/FreeSWITCH-Explained/Configuration](https://github.com/signalwire/freeswitch-docs/tree/main/docs/FreeSWITCH-Explained/Configuration)
- [docs/FreeSWITCH-Explained/Auxiliary-Knowledge-and-Utilities](https://github.com/signalwire/freeswitch-docs/tree/main/docs/FreeSWITCH-Explained/Auxiliary-Knowledge-and-Utilities) 

### observability
- [docs/FreeSWITCH-Explained/Examples/Detect-Active-Channels_10289411.mdx](https://github.com/signalwire/freeswitch-docs/blob/main/docs/FreeSWITCH-Explained/Examples/Detect-Active-Channels_10289411.mdx#about)
