//
//  MessageContainerViewController.swift
//  Mailbox
//
//  Created by Tracey Ewart on 9/30/15.
//  Copyright © 2015 Tracey Ewart. All rights reserved.
//

import UIKit

class MessageContainerViewController: UIViewController {

    @IBOutlet weak var messageImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func onMessagePan(sender: UIPanGestureRecognizer) {
        
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            print("Began the pan")
        }
        else if sender.state == UIGestureRecognizerState.Changed {
            messageImageView.center = location
            print("Pan changed")
            }
            else if sender.state == UIGestureRecognizerState.Ended {
                print("ENDED the pan")
                }
        
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
