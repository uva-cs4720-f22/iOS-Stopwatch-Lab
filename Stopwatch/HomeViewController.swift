/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

/* 
 
 Sherriff's Notes:
 
 There's a lot to do in this particular file, in conjuction with the Main.storyboard file.  See the notes throughout this file.
 
 In addition, you need to embed this scene in a Navigation Controller and add a + Bar Button Item to the upper left.
 
*/

import UIKit

class HomeViewController: UIViewController {
    
    // ACTION REQUIRED: You need to hook up this IBOutlet to the label in the storyboard for HomeViewController
    // Note: the 'open' circle in the left margin will be filled in once the connection is made
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    
    let stopwatch = Stopwatch()
    
    // ACTION REQUIRED: You need to hook up the start & stop buttons in 'HomeViewController' to these functions
    @IBAction func startTimer(sender: UIButton) {
        print("start called")
    }
    
    @IBAction func stopTimer(sender: UIButton) {
        print("stop called")
    }
    
    
    // This function gets data ready to be sent over to another scene.  Notice how we get the navigation controller first, then get the view controller embedded inside it.
    // Setup the time to be sent over to the next view controller here.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        // NOTE: You'll need to click on the seque you create and give it the name "AddTime" for this to work!
        if (segue.identifier == "AddTime") {
            // ADD CODE: Get the data ready to send over to the next controller by setting the fields over in the AddTimeViewController
            

            
        }

    }
    
    // No edits beyond this point!
    
    // This function is called by the start stopwatch function - you should not edit it.
    func updateElapsedTimeLabel(_ timer: Timer) {
        print("Updating...")
        if stopwatch.isRunning {
            let minutes = Int(stopwatch.elapsedTime / 60)
            let seconds = Int(stopwatch.elapsedTime.truncatingRemainder(dividingBy: 60))
            let tenthsOfSecond = Int((stopwatch.elapsedTime * 10).truncatingRemainder(dividingBy: 10))
            elapsedTimeLabel.text = String(format: "%02d:%02d.%d",
                                           minutes, seconds, tenthsOfSecond)
        } else {
            timer.invalidate()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sherriff's Notes: Nothing needs to be added here
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Sherriff's Notes: Nothing needs to be added here
    }

    
}

