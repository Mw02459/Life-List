//
//  ViewController.swift
//  TableViewChallenge
//
//  Created by girlswhocode on 7/11/19.
//  Copyright © 2019 girlswhocode. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
       @IBOutlet weak var MyTableView: UITableView!
    
    var colors = ["blue", "green", "yellow", "orange"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =
            MyTableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
            cell.textLabel?.text = colors[indexPath.row]
        return cell
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

