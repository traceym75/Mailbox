//
//  testSwipeViewController.swift
//  Mailbox
//
//  Created by Tracey Ewart on 9/30/15.
//  Copyright © 2015 Tracey Ewart. All rights reserved.
//

import UIKit

class testSwipeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onSwipeMessage(sender: UISwipeGestureRecognizer) {
        
        var location = sender.locationInView(view)
       
        if sender.state == UIGestureRecognizerState.Changed {
        location.x -= 100
        }
        //else if messageImageView.center = location
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
