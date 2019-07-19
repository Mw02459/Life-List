//
//  ViewController.swift
//  test
//
//  Created by girlswhocode on 7/18/19.
//  Copyright © 2019 girlswhocode. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {
    
    
    @IBAction func action(_ sender: Any) {
    let content = UNMutableNotificationContent()
        content.title = "Timer is Up!"
        content.subtitle = "Alarm"
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval:5, repeats: false)
        let request = UNNotificationRequest(identifier: "timerdone", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
    }
    
    
}

