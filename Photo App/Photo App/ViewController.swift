//
//  ViewController.swift
//  Photo App
//
//  Created by girlswhocode on 7/12/19.
//  Copyright © 2019 girlswhocode. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UINavigationControllerDelegate,
UIImagePickerControllerDelegate {
    
    var imagePickerController: UIImagePickerController!

    @IBOutlet weak var myImageView: UIImageView!
    
    
    @IBAction func handleTakePhotoPressed(_ sender: Any) {
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
        //save
    }
    
    var currPic: Int32 = 0
    
    
    var pictureNumber: [Int] = []
    
    @IBAction func handleSavePhotoPressed(_ sender: Any) {
        saveImage(imageName: "\(currPic).png")
        pictureNumber.append(Int(currPic))
        currPic = currPic + 1
        print("\(pictureNumber)")

    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePickerController.dismiss(animated: true, completion: nil)
        myImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
    
    func saveImage(imageName: String) {
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        let image = myImageView.image!
        let imageData = image.pngData()
        fileManager.createFile(atPath: imagePath as String, contents: imageData, attributes: nil)
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        print(imageName)
        
        let context = (UIApplication.shared.delegate as!   AppDelegate).persistentContainer.viewContext
        let newCurrPic_var = CurrPic_var(context: context)
        newCurrPic_var.currPic = currPic
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            showAlertWith(title: "Save error", message: error.localizedDescription)
        } else {
            showAlertWith(title: "Saved!", message: "Your image has been saved to your photos.")
        }
    }
    func showAlertWith(title: String, message: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "gallerySegue") {
            let gvc = segue.destination as! GalleryViewController
            gvc.pictureNumbers = pictureNumber
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }


}

