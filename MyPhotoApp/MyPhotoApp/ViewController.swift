//
//  ViewController.swift
//  MyPhotoApp
//
//  Created by girlswhocode on 7/12/19.
//  Copyright © 2019 girlswhocode. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBAction func TakePhoto(_ sender: Any) {
        
        MyImagePickerController = UIImagePickerController()
        MyImagePickerController.delegate = self
        MyImagePickerController.sourceType = .camera
        present(MyImagePickerController,animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        MyImagePickerController.dismiss(animated: true, completion: nil)
        MyImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
    }
    
    @IBOutlet weak var MyImageView: UIImageView!
    var MyImagePickerController: UIImagePickerController!
    @IBAction func SavePhoto(_ sender: Any) {
         SaveImage(imageName:"image.png")
        
        
        
    }
        func SaveImage(imageName: String){
            
            let fileManager = FileManager.default
            let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]as NSString).appendingPathComponent(imageName)
            let image = MyImageView.image!
            let imageData = image.pngData()
            fileManager.createFile(atPath: imagePath as String, contents: imageData, attributes: nil)
    
        }
        

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
