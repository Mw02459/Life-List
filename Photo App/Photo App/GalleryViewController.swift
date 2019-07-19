//
//  GalleryViewController.swift
//  Photo App
//
//  Created by girlswhocode on 7/12/19.
//  Copyright © 2019 girlswhocode. All rights reserved.
//

import UIKit
import CoreData

class GalleryViewController: UIViewController {
    
    var pictureNumbers: [Int] = []


    @IBOutlet weak var galleryImageView: UIImageView!
    

   

    
    func getImage(imageName: String) {
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,
                                                             true)[0] as NSString).appendingPathComponent(imageName)

        if fileManager.fileExists(atPath: imagePath) {
            let image = UIImage(contentsOfFile: imagePath)
            let newImage = UIImage(cgImage: (image?.cgImage!)!, scale: (image?.scale)!, orientation: .right)
            galleryImageView.image = newImage
        
            

        } else {
            print("Oh no! No Image!")
        }
        print(imagePath)
    }
    
    var add: Int = 0
    
    override func viewDidLoad() {
        if !pictureNumbers.isEmpty {
        getImage(imageName: "\(pictureNumbers[add]).png")
        print("if statement works")
        }

        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func rightButton(_ sender: Any) {
        add = add+1
        if add >= pictureNumbers.count {
            add = pictureNumbers.count - 1
            print(add)
        }
        if !pictureNumbers.isEmpty {
        getImage(imageName: "\(pictureNumbers[add]).png")
        }
        
    
    }
    
    @IBAction func leftButton(_ sender: Any) {
        add = add-1
        if add < 0 {
            add = 0
        }
        
        if !pictureNumbers.isEmpty {
            getImage(imageName: "\(pictureNumbers[add]).png")
    }
    
    }
}
