//
//  ViewController.swift
//  What to do in Summer?
//
//  Created by girlswhocode on 7/9/19.
//  Copyright © 2019 girlswhocode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activities = ["read a book", "go swimming", "have a waterballoon fight", "make s'mores", "write a story", "go for a walk", "try a new food", "make lemonade", "go camping", "call friends"]
    
    @IBOutlet weak var randomactivities: UILabel!
    let backroundImageView = UIImageView()


    @IBAction func randomgenerator(_ sender: Any) {
        getRandomActivity()
    }

    @IBOutlet weak var RecommendationImageView: UIImageView!
    
    func getRandomActivity() {
       
        
        let randomNumber = Int.random(in: 0 ..< activities.count)
       randomactivities.text = activities[randomNumber]
        RecommendationImageView.image = UIImage(named:activities[randomNumber])
    }
 


func setBackround() {
    view.addSubview(backroundImageView)
    backroundImageView.translatesAutoresizingMaskIntoConstraints = false
    backroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    backroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    backroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    backroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    backroundImageView.image = UIImage(named: "summer backround")
    view.sendSubviewToBack(backroundImageView)
}


override func viewDidLoad(){
    super.viewDidLoad()
    setBackround()
    // Do any additional setup after loading the view.
}
}
