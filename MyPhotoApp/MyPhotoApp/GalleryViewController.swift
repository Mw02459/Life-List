//
//  GalleryViewController.swift
//  MyPhotoApp
//
//  Created by girlswhocode on 7/12/19.
//  Copyright © 2019 girlswhocode. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var MyGalleryImage: UIImageView!
    
    func getImage(imageName: String){
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]as NSString).appendingPathComponent(imageName)
        if fileManager.fileExists(atPath: imagePath){
           // MyGalleryImage.image = UIImage(contentsOfFile: imagePath)
            let image = UIImage(contentsOfFile: imagePath)
            let newImage = UIImage(cgImage: (image?.cgImage!)!, scale: (image?.scale)!,
                                   orientation: .right)
            MyGalleryImage.image = newImage
        
            
        }else{
            print("Oh No! No Image!")
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage(imageName: "image.png")

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
