# Traffic-Light
An iOS application written in Swift to get car model and present traffic light animation to the user

# Technical Details
* Removed storyboard to develop a project easy-to-read.
* Implemented SnapKit via Swift Package Manager to pace up the development process.
* Developed with VIP architecture to increase scalability and testability.
* Did not add Presenter, Worker and BusinessLogic since not necessary.
* Switched between screens and moved required parameters via Router objects.
* The project was divided into two split domains namely Brand and Drive. 
  
# What To Improve
* Unit tests can be written by easily isolating any VIP element.
* One can choose to go without SnapKit and use NSLayoutConstraint instead.
* Parameters can be passed around wrapped in ViewModel objects to increase readability in case there are more parameters to pass.
