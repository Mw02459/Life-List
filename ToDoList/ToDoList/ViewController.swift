//
//  ViewController.swift
//  ToDoList
//
//  Created by girlswhocode on 7/11/19.
//  Copyright © 2019 girlswhocode. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var TextField: UITextField!
    
    @IBAction func Submit(_ sender: Any) {
        AddNewTask()
    }
    
    func AddNewTask(){
        
        if (TextField.text != ""){
        let context = (UIApplication.shared.delegate as!
        AppDelegate).persistentContainer.viewContext
            let newTask = Task(context: context)
            newTask.taskName = TextField?.text
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            TextField.resignFirstResponder()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


