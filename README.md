# recipe_app
recipe_app

Flutter-TDD-Clean-Football
In clean code architecture, there are three main layers

Data
Domain
Presentation along with common (can also be called as core) Domain This is innermost layer and will contain the core business logic i.e. usecases and business object also called as entities, the usecase depends on the contract of repository (not implementation)
Data The data layers contains the repository implementation and this layer is closest to actual data sources and is responsible for communication with data sources.

The data layer returns the models and not entities and the model also contains the fromJson and toJson mapper.

Note: We don’t have an extra mapper class, we are just going to leverage the named constructor by dart to map our data set from one form to our models. toJson and fromJson.

Presentation This layer contains all the information about the UI and everything to show to the end user customer. The presentation layer also contains the bloc which is the state management and often termed as brain of UI.

The presentation layer interact via domain layer, i.e entities and use cases.


![Simulator Screenshot - iPhone 15 Pro - 2024-10-13 at 06.34.00.png](../../../Desktop/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-10-13%20at%2006.34.00.png)

![Simulator Screenshot - iPhone 15 Pro - 2024-10-13 at 06.34.07.png](../../../Desktop/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-10-13%20at%2006.34.07.png)![Simulator Screenshot - iPhone 15 Pro - 2024-10-13 at 06.34.10.png](../../../Desktop/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-10-13%20at%2006.34.10.png)![Simulator Screenshot - iPhone 15 Pro - 2024-10-13 at 06.34.13.png](../../../Desktop/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-10-13%20at%2006.34.13.png)![Simulator Screenshot - iPhone 15 Pro - 2024-10-13 at 06.34.19.png](../../../Desktop/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-10-13%20at%2006.34.19.png)![Simulator Screenshot - iPhone 15 Pro - 2024-10-13 at 06.34.38.png](../../../Desktop/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-10-13%20at%2006.34.38.png)![Simulator Screenshot - iPhone 15 Pro - 2024-10-13 at 06.34.44.png](../../../Desktop/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-10-13%20at%2006.34.44.png)![Simulator Screenshot - iPhone 15 Pro - 2024-10-13 at 06.34.46.png](../../../Desktop/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-10-13%20at%2006.34.46.png)![Simulator Screenshot - iPhone 15 Pro - 2024-10-13 at 06.34.50.png](../../../Desktop/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-10-13%20at%2006.34.50.png)![Simulator Screenshot - iPhone 15 Pro - 2024-10-13 at 06.34.44.png](../../../Desktop/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-10-13%20at%2006.34.44.png)![Simulator Screenshot - iPhone 15 Pro - 2024-10-13 at 06.34.55.png](../../../Desktop/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-10-13%20at%2006.34.55.png)![Simulator Screenshot - iPhone 15 Pro - 2024-10-13 at 06.35.04.png](../../../Desktop/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-10-13%20at%2006.35.04.png)![Simulator Screenshot - iPhone 15 Pro - 2024-10-13 at 06.35.07.png](../../../Desktop/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-10-13%20at%2006.35.07.png)