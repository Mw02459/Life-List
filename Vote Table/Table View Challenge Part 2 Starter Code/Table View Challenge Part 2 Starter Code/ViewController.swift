//
//  ViewController.swift
//  Table View Challenge Part 2 Starter Code
//
//  Created by Jacqualyn Blizzard-Caron on 1/29/19.
//  Copyright © 2019 Jacqualyn Blizzard-Caron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var catVote: Int = 0
    var dogVote: Int = 0
    
    var voteCountArray:[String] = []
    
    func updateVoteArray(){
    
       voteCountArray = [
        "Cat Votes: \(catVote)",
        "Dog Votes: \(dogVote)"
        ]
    }
    
    @IBOutlet weak var myTableView: UITableView!
    // Write your code for Step 2 here
    
    
    // Write your code for Step 3 here - a function to update the vote array
    
    
    // Step 4
    @IBAction func catVoteButtonHandler(_ sender: Any) {
      
        // Write your code for Step 4 here
        catVote = catVote + 1
        updateVoteArray()
        myTableView.reloadData()
        
    }
    @IBAction func dogVoteButtonHandler(_ sender: Any) {
        // Write your code for Step 4 here
        dogVote = dogVote + 1
        updateVoteArray()
        myTableView.reloadData()
        
    }
    
    // Step 5
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Write your code for Step 5 here
        return voteCountArray.count
    }
    
    // Step 5
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = voteCountArray[indexPath.row]
        return cell
    }
    
    
    // Step 6
    override func viewDidLoad() {
        super.viewDidLoad()
        updateVoteArray()
        // Call your function to update your vote array
    }


}

