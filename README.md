### StrategicControllers
'Strategic Controllers' contains a subclass of UIViewController (StrategicController) and a ControllerStrategy object to aid in configuring UIViewControllers.

#### Installation
Using [Carthage](https://github.com/Carthage/Carthage) add

```shell
github "bromas/StrategicControllers"
```

to your Cartfile

#### Using Strategic Controller

- Subclass from StrategicController in the controller you want to configure.
- Create a subclass of ControllerStrategy\<YourControllerClass>
- Override the lifecycle methods in the ControllerStrategy subclass you want to add customization to (they mimick the UIViewController lifecycle methods e.g. viewDidLoad()).
- Configure the subclass of StrategicController with a subclass of ControllerStrategy\<YourControllerClass> using the method setStrategy(strat: ControllerStrategy)

#### Subclassing ControllerStrategy\<T\>

Due to the state of generics in swift, subclassing a generic class requires that the subclass also be generic. When subclassing ControllerStrategy\<T> it will be helpful to create a typealias to simplify allocating the strategy later on (and refactoring if this requirement is later removed).

Example subclass:

```swift
typealias AnimatingStrategy = animatingStrategy<Int>
class animatingStrategy<T> : ControllerStrategy<StrategicController> { 
	let startingColor: UIColor
	init(color: UIColor) {
    	startingColor = color
    	super.init()
  	}
  	override func viewDidLoad() { 
    	controller.view.backgroundColor = startingColor 
    }
}
```

#### What I'm trying to solve...

Basically, I'm really unsatisfied with the implementations I've seen for adding contextual logic to a UIViewController. For example:

```swift
self.navigationController.pushViewController(...)
```

inside of a UIViewController, (which isn't even necessarily inside of a UINavigationController) seems insane to me. However, a controller or it's container have to share something in order to have a cooperative action (e.g. a UINavigationController pushing a new controller based on the tapping of a UITableViewCell). If possible, this 'cooperative glue' should exist outside of the controller and the controller should be written to express what interactions it wants to share with the objects bringing it into the controller heirarchy by exposing them.

Strategies wrap up this kind of configuration as a stand alone object that can be shared across any controller that shares the same interface/subclass. Adding a set of lifecycles and UIViewController methods to the configurations allow you to jack into methods like 'preparForSegue(...)' and select the strategies for controllers brought in deeper in the controller heirarchy.

I haven't used this framework/pattern long enough to know it's a 'good solution', but I once read the best way to get constructive criticism was to speak errors authoritatively.
 
That being said... storyboards don't solve this. 

This is the best solution to this configuration problem that has ever been coded in swift.
 
You should use it in every project.


#### Examples

Look at the included sample project, or my FrameworksPlayground github repo

(From included sample):

```swift
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let controller = segue.destinationViewController as! StrategicController
    if segue.identifier == "Animating" {
      let animatingStrat = AnimatingStrategy(color: UIColor.redColor())
      controller.setStrategy(animatingStrat)
    } else if segue.identifier == "Moveable" {
      controller.setStrategy(MovableStrategy())
    }
}
