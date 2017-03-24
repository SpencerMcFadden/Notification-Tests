//
//  ViewController.swift
//  NotificationTest
//
//  Created by Spencer McFadden on 3/25/16.
//  Copyright © 2016 Spencer McFadden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func registerLocal(sender: AnyObject) {
        let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
    }

    @IBAction func scheduleLocal(sender: AnyObject) {
        guard let settings = UIApplication.sharedApplication().currentUserNotificationSettings() else {return}
        
        if settings == .None {
            let er = UIAlertController(title: "Can't schedule", message: "Scheduling not possible", preferredStyle: .Alert)
            er.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(er, animated: true, completion: nil)
            return
        }
        
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
        notification.alertAction = "Testing"
        notification.alertBody = "Testing 2"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["test":"test2"]
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
}

