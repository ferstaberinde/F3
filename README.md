F2 
==

ArmA2 mission development framework

Version 2.6.1

The problem with mission-making

A problem with mission-making, and multi-player missions in particular, is that the 'learning curve' is steep. The mission designer has to learn about many issues, and ensure that several key components (such as briefing files, gear selection snippets, automatic removal of dead bodies etc.) are created, correctly configured and tested in order to build a quality mission with high levels of re-playability and performance.
Often the overall quality of a designer's early missions suffers because s/he is having to 'reinvent the wheel', writing and testing his/her own library of personally developed scripts, and finding and learning how to use scripts and code snippets written by other designers.
The objective of F2

F2 (like BAS f on which it is based) is an attempt to help the new mission designer take advantage of a library of pre-tested components that will increase the quality, re-playability and performance of his/her missions, whilst allowing him/her to focus on making his/her own unique ideas come to life.
Framework vs. template

F2 is a framework: an MP mission folder containing a library of scripts, functions and template files, plus a manual (this document). The framework is designed to provide the mission designer, after minimal additional configuration, with a selection of pre-tested features and functionality intended to improve the overall quality and re-playability of his/her mission.
Since F2 is a framework, and not a template, the design of the actual mission is completely open; the framework is intended only to save time for the designer by providing components such as weather selections that work with join-in-progress (JIP), or pre-configured gear selections for re-equipping soldiers during the mission briefing. For many components care has also been taken to localise messages and texts (where used) into several languages.
Importantly, all components of the framework are fully explained in this online manual, feature extensive commenting within script files, and each can be disabled if desired. This manual is designed to guide the mission designer through the full configuration process, as well as provide instructions for optional components.
Who is the framework for?

F2 is aimed at the new ArmA2 mission designer, although it is not intended for complete beginners. To use F2 the mission designer should have a basic understanding of:
How to open the MP mission editor
How to place and edit units, triggers, waypoints and markers in the editor
The ArmA2 scripting syntax (for .sqf files)
The roles of key files: description.ext and init.sqf
The role of script files (.sqf files)
If a mission designer has already created his/her first few missions, everything in F2 should be relatively straightforward. In addition, mission designers with intermediate experience may also find F2 useful as a time-saver, or as the basis for their own personal base framework(s).
Get the right build for you

To support both ArmA2 and ArmA2: Operation Arrowhead, as well as several different groups and mods (such as ACE2), each version of F2 is available as a number of different builds. All builds contain the same Foundation components (both core and optional), but have been pre-optimised with additional components for a specific group or mod.
For links to the most recent version of each F2 build please see the Downloads page.
What's next?

The best way to use F2 is to begin by reading through all manual pages for the Core Components. This will give you a solid understanding of the default options available, and help you plan your mission. If you have time, it is also useful to read through the manual pages for Optional Components too. Manual pages are also available for build-specific components. Once you have selected the build you wish to use, have a read of all these pages as well.
Can I discuss F2 with other mission makers?

Yes, there are F2 threads in several popular forums. These threads are also where new versions of F2 are announced, so it is useful to subscribe to them. Here are some links:
Bohemia Interactive Official Forums (English)
OFPEC The editing center (English)
