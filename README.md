# MVVM+R MovieDB
Welcome to MVVM-MovieDB with [Clean Architecture](https://8thlight.com/blog/uncle-bob/2012/08/13/the-clean-architecture.html) + (Router & [Adapter Pattern](https://www.tutorialspoint.com/design_pattern/adapter_pattern.htm)). To obtain the movie data, just access into [MovieSDK](https://github.com/wliam06/MovieFreeAPI).

## Summary

### MVVM Architecture
<p align = "center">
 <img src = "https://user-images.githubusercontent.com/25744906/71777738-bab2ac80-2fd6-11ea-8ae8-20a1c465ba40.png">
</p>

MVVM is a structural design pattern that separates objects into three groups:
 - `Model` represent as data Layer of application
 - `View` represent as visual and controls on the screen.
 - `View Models` represent as operations of information into a values which it will be displayed in `View`.
 
### Clean Architecture
<p align = "center">
  <img src = "https://user-images.githubusercontent.com/25744906/71777608-d61cb800-2fd4-11ea-8a99-eb07bcc994a0.jpg">
</p>

In short, `Clean architecture` helps us for an effective testing strategy because it isolated in individual modules. Besides that, easily in multiple works of stories and has a good structure to tell readers about the system (it's called [Scream](https://blog.cleancoder.com/uncle-bob/2011/09/30/Screaming-Architecture.html)). 


### Router Pattern
<p align = "center">
  <img src = "https://user-images.githubusercontent.com/25744906/71777984-4843cb80-2fda-11ea-8ff5-385cb02ae1e3.png">
</p>

Router is used to managed the coupled and dependent of each other controllers when using a navigation.

### Adapter Pattern
Adapter is a structural design pattern that allows object to connect and work together. In short, it transforms the interface of an object to adapt.

## Folder Structure
To organize groups, files and code into more specifically. I use this structure as below:
 - [Application](https://github.com/wliam06/MVVM-MovieDB/tree/master/MovieDB/Application) - contain based of application launched.
 - [DI](https://github.com/wliam06/MVVM-MovieDB/tree/master/MovieDB/DI) - contains `Dependency Injection` as central units.
 - [Data](https://github.com/wliam06/MVVM-MovieDB/tree/master/MovieDB/Data/Repository) - contains `Repository` as coordinate data layer.
 - [Domain](https://github.com/wliam06/MVVM-MovieDB/tree/master/MovieDB/Domain) - contains of `Entities`, `Use Cases`,  and `Interfaces`.
 - [Presentation](https://github.com/wliam06/MVVM-MovieDB/tree/master/MovieDB/Presentation) - contains of `View` and `ViewModel`.
 - [Wireframe](https://github.com/wliam06/MVVM-MovieDB/tree/master/MovieDB/Wireframe) - contains of application routing management.
 
 ## Built with
 Using `Xcode 10.3` and written in `Swift 5`

