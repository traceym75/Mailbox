//
//  MailboxViewController.swift
//  Mailbox
//
//  Created by Tracey Ewart on 9/30/15.
//  Copyright © 2015 Tracey Ewart. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var messageView: UIImageView!
    
    @IBOutlet weak var laterImageView: UIImageView!
    
    @IBOutlet weak var listImageView: UIImageView!
    
    @IBOutlet weak var archiveImageView: UIImageView!
    
    @IBOutlet weak var messageContainer: UIView!

    @IBOutlet weak var rescheduleView: UIView!

    @IBOutlet weak var listView: UIView!

    @IBOutlet weak var feedImageView: UIImageView!
    
    var feedOriginalPosition: CGPoint!
    
    var messageOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 320, height: 1432)
        
        scrollView.delegate = self
        
        rescheduleView.alpha = 0
        
        listView.alpha = 0
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onListTap(sender: UITapGestureRecognizer) {
        var point = sender.locationInView(view)
        listView.alpha = 0
        
        UIView.animateWithDuration(0.5) {
            self.feedImageView.center.y = 745
            
        }
        messageView.center.x = messageOriginalCenter.x
    }
    
    @IBAction func onRescheduleTap(sender: UITapGestureRecognizer) {
        var point = sender.locationInView(view)
        rescheduleView.alpha = 0
        
        //UIView.animateWithDuration(0.5) {
        //    self.feedImageView.center.y = 745
        //
       // }
        
        
        //UIView.animateWithDuration(0.5) {
          //  self.feedImageView.center.y = 900
            
        //}
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.feedImageView.center.y = 745
            }) { (completed) -> Void in
                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.feedImageView.center.y = 830
                    self.messageView.alpha = 1
                    self.messageView.center.x = 160
                    }, completion: { (completed) -> Void in
                    })
        
            
    }
    }

    @IBAction func onMessagePan(sender: UIPanGestureRecognizer) {
        
        let point = sender.locationInView(view)
        let velocity = sender.velocityInView(view)
        let translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            print("Gesture began at: \(point)")
            
            messageOriginalCenter = messageView.center
       
            archiveImageView.alpha = 0
            laterImageView.alpha = 0
            listImageView.alpha = 0
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            print("Gesture changed at: \(point)")
            print("CENTER is \(messageView.center.x)")
            
            messageView.center.x = messageOriginalCenter.x + translation.x
 
            
            // *****  RESCHEDULE ****
                
                if messageView.center.x < -100 {
                    print("Brown")
                    //brown bkgd, show list options
                    // greater than 260 pt
                   
                    self.messageContainer.backgroundColor = UIColor(red: 199.0/255.0, green: 141.0/255.0, blue: 60.0/255.0, alpha: 1.0)
                    self.laterImageView.alpha = 0
                    self.listImageView.alpha = 1
                    self.archiveImageView.alpha = 0

                    }

                else if messageView.center.x < 99  {
                    print("Yellow")
        
                    // YELLOW bkgd, show schedule options
                    // greater than 60 pts
                    
                    self.messageContainer.backgroundColor = UIColor(red: 250.0/255.0, green: 218.0/255.0, blue: 12.0/255.0, alpha: 1.0)
                    self.laterImageView.alpha = 1
                    self.listImageView.alpha = 0
                    self.archiveImageView.alpha = 0
                  
                    }
            
                else if messageView.center.x > 100 && messageView.center.x < 160 {
                    print("Gray ")
                    // less than 60pts
                    //snap back upon release to orig / Gray already
                    
                    self.messageContainer.backgroundColor = UIColor(red: 220.0/255.0, green: 222.0/255.0, blue: 220.0/255.0, alpha: 1.0)
                    self.laterImageView.alpha = 1
                    self.listImageView.alpha = 0
                    self.archiveImageView.alpha = 0
                    
                }
      
        // *******  ARCHIVING ****


            else if messageView.center.x < 210 {
                print("Will return to Orig")
                //snap back upon release to orig / GRAY background
                self.messageContainer.backgroundColor = UIColor(red: 220.0/255.0, green: 222.0/255.0, blue: 220.0/255.0, alpha: 1.0)
                }
            else if messageView.center.x < 410 {
                print("Green")
                // green bkgd and hide message
                self.messageContainer.backgroundColor = UIColor(red: 116.0/255.0, green: 240.0/255.0, blue: 74.0/255.0, alpha: 1.0)
                }
            else if messageView.center.x > 410 {
                print("Red ")
                // red bkgd and hide message
                self.messageContainer.backgroundColor = UIColor(red: 227.0/255.0, green: 36.0/255.0, blue: 36.0/255.0, alpha: 1.0)
                }
 
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("Gesture ended at: \(point)")
            
            // ***  AT ENDED ***

                if messageView.center.x < -100 {
                    
                    // greater than 260 pt - BROW
                    
                    messageView.alpha = 0
                    UIView.animateWithDuration(0.5) {
                        self.listView.alpha = 1
                    }
                }
                
                else if messageView.center.x < 99  {
                    // greater than 60 pts - YELLOW
                    // bring up reschedule screen
                    
                    messageView.alpha = 0
                    UIView.animateWithDuration(0.5) {
                        self.rescheduleView.alpha = 1
                    }

                    
                }
                
                else if messageView.center.x > 100 && messageView.center.x < 160 {
                    
                    // gray
                    //snap back upon release to orig
                    
                    messageView.center.x = messageOriginalCenter.x

                
            }
            
            
            
        }

        
        
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