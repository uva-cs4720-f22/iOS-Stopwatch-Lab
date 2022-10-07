# iOS Stopwatch In-Class Lab

## Getting Started

1. Fork this repository to one of your own so that you can more easily reference it later using the `Fork` button in the upper right part of the screen.
2. Clone your forked repository and open the project in Xcode.
3. Once you have done that, follow the instructions in the code to fill out the functionality of this stopwatch app.

## Edit the Bundle Identifier

You may have issues signing the the project or problems with the provisioning profile.  The easiest thing to do is to edit your Bundle Identifier on the project information page under Settings (click on the root of your project in the left project explorer - the blue icon at the top).  Just add a dot and your computing ID to the end, so it looks like `edu.virginia.cs4720.Stopwatch.compid` and it should work.

## Steps to Follow

1. You should start by reading through the HomeViewController code, paying close attention to the comments. Then you should take a look at the Main.storyboard file.
2. Get the stopwatch working in HomeViewController (Checkpoint 1)
3. You will need to create a new View Controller called AddTimeViewController. (Checkpoint 2)
3. Connect the two scenes together, following the instructions below. (Checkpoint 3)
5. Build out the AddTimeViewController (Checkpoint 4)
6. Code snippits are provided below for particular functionality to minimize Googling.

## Get the stopwatch working (Checkpoint 1)

1. Hook up the IBOutlet for the 'elapsedTimeLabel' of the 'HomeViewController' 
	- One way to do this is by dragging from the circle beside the elapsedTimeLabel on line 24 onto the UI element in the storyboard using the Assistant Editor viewing mode
2. Hook up the IBActions for starting and stopping the timer to the 'Start' and 'Stop' buttons.
	- Same as above
3. You should be able to get the stopwatch functionality working in the 'HomeViewController' by adding the provided code at the bottom of this page to the appropriate functions in 'HomeViewController'

CHECK: At this point, you should be able to run the app and the stopwatch functionality should work. (The label updates as time passes and start/stop buttons work as expected.)

## Creating a new View Controller (Checkpoint 2)

1. Right click on the Stopwatch folder
2. Choose New File... -> Cocoa Touch Class
3. Give it the name AddTimeViewController
4. Make it a subclass of UIViewController
5. Once the file is created, go to the Storyboard and add this AddTimeViewController by dragging in a new view controller from the 'Object Library' (lower right panel, third icon which is round).  If you are using Xcode 10, you can find the Object Library by clicking View -> Libraries or hit Shift+Cmd+L.
6. Then select this new view controller (by clicking the little yellow circle on the top) and change its class to AddTimeViewController in the identity inspector (top right panel, id card icon).

## Connecting the Two Scenes Together (Checkpoint 3)

1. Now we wish to launch our AddTimeViewController in response to a button click in the HomeViewController. In the Storyboard, drag a Bar Button Item from the Object Library onto the top right corner of the navigation bar in the HomeViewController that was created for you. 
2. Initially, the bar button item will be a simple button that says 'item'. Cick on it, and in the Attribute Inspector (top-right panel), select 'Add' from the System Item dropdown. The button should change to a plus.
3. Finally, control-drag from the plus-sign bar button item to the AddTimeViewController, and select 'Show' from the drop down box that appears.

CHECK: At this point, you should be able to run the app, and clicking the '+' button should launch the 'AddTimeViewController'

## Build out the AddTimeViewController (Checkpoint 4)

Finally, it's up to you to build out the 'AddTimeViewController' to exhibit the following functionality:

1. It should have a label in the middle that it prepopulated with the current value of the elapsedTimeLabel in the 'HomeViewController' when the 'AddTimeViewController is launched' (note: this label's value will be static, it won't update like the elapsedTimeLabel)
2. It should already have a '< Back' bar button item in top left that dismisses the 'AddTimeViewController'.
3. It should have a 'Save' button somewhere on the screen, which, when pressed, presents an alert saying that you just 'fake' saved the time. In the alert message, you should mention the value in the label.  See the code at the bottom of this README.
4. To pass the time from the 'HomeViewController' to the 'AddTimeViewController', you will need to edit the code found in the 'prepare()' function in 'HomeViewController'.  First, click on the segue in the interface builder (the arrow thing between the 'HomeViewController' and the 'AddTimeViewController'.  In the Attributes Inspector, give it the Identifier 'AddTime'.
5. In 'HomeViewController', find the 'prepare()' method.  Look at the example provided in the 'LectureTest' example code for how to write this method.  You will also need to add code to the 'viewDidLoad()' method in 'AddTimeViewController' based on the 'NewMessageViewController' from the 'LectureTest' example as well.  The code you write in 'prepare()' will "pre-set" the values in the destination ViewController before it launches.  Then, in the 'AddTimeViewController', you can grab the data and set the label's value.

## Code Snippits

__Code that will start the stopwatch - add this to startTimer:__

```swift
print("Starting stopwatch...")
Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(HomeViewController.updateElapsedTimeLabel(_:)), userInfo: nil, repeats: true)
stopwatch.start()
```

__Code to stop the stopwatch - add to stopTimer:__
```swift
print(stopwatch.elapsedTime)
stopwatch.stop()
```

__Code to show a popup when you "save" the time on the AddTimeViewController:__
```swift
let alertController = UIAlertController(title: "Time Saved!", message: "You just fake saved the time " + timeLabel.text! + "!", preferredStyle: .alert)
        
let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
alertController.addAction(defaultAction)
        
present(alertController, animated: true, completion: nil)
```



### License

This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-nc-sa/4.0/), by Yong Bakos.

Adapted from https://swifteducation.github.io/teaching_app_development_with_swift/stopwatch.html
