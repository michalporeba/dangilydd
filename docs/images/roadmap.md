# Roadmap

This is a very rough outline of what is important and what is not, in the first stages of the development. What we don't want to do is probably more important than what we need to do. 

&nbsp;
## Context 

The purpose of the project is to build the solution, not to host it. While it might change in the future, hosting applications that necessarily contain some personally identifiable information comes with legal responsibilities. Those responsibilities are beyond the initial scope of this project. Instead, we should focus on easy way to self host by any organisation that wishes to try the software. 

The primary purpose is to improve volunteering experience. Software architecture needs to be reasonable, but it does not need to scale up massively. The likely deployment instances will have a few tens of thousands of registered users and hundreds of users accesing the system at the same time. And so we need to favour simplicity over scalability. 

Not everybody who potentially can benefit from this application has or is comfortable using a smart phone, perhaps they don't have an access to the latest mobile technology and virtually unlimited mobile internet. This has to be a digitally enhanced service. It must be possible to work offline. It must be possible to use all the functionality if only one person has a smart phone or a tablet in a group during an event or a training session. 

&nbsp;
## Important user journey currently out of scope

**Sign-up**, **log-in**, **log-out**, **password resets**. We need to be ablet o demonstrate how useful the application can be. To do that all we need is a few fixed users for demos. There is no point in effort into the formalities before we have buying form potential users. 

**Configuration of organisations**. Each organisation might need to customise the training paths, roles and so on. While the mechanism of roles and training will have to be implemented the configuration for the first demo peurpose can easily be done with some code, config file or something similar. 

&nbsp;
## Possible first user journeys

First implemented user journeys should be easy to show and test side by side with any existing systems. The participation should be possible on an opt-in basis. 

Training and continuous professional development might be good starting point. 

Event peraparation, advertisement, sign-up might be more difficult to start with. 