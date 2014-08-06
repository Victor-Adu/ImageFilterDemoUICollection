//
//  ViewController.swift
//  ImageFilterDemo
//
//  Created by Victor  Adu on 8/4/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let photoPicker = UIImagePickerController()
    
       var imageViewSize : CGSize!
    
    //Setup ActionController
    let actionController = UIAlertController(title: "Source Type", message: "Choose a source type", preferredStyle: UIAlertControllerStyle.ActionSheet)
    //Create AlertView
    let alertView = UIAlertController(title: "Alert!", message: "Requesting permission to access your Photos", preferredStyle: UIAlertControllerStyle.Alert)
    
    //Placed a button over my UIImageView to allow user to add photo by clicking the image.
    @IBAction func getPhotoImage(sender: AnyObject) {
        
        self.presentViewController(self.actionController, animated: true, completion: nil)
    }
    
    @IBAction func photoHandleBtnPressed(sender: AnyObject) {
    // The NSUserDefaults checks whether it's the first time user is using the app feature and presents 'ActionController' or 'AlertView' afterwards.
      if NSUserDefaults.standardUserDefaults().boolForKey("Requesting Initial Permission") {
            self.presentViewController(actionController, animated: true, completion: nil)

        } else {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "Requesting Initial Permission")
            self.presentViewController(alertView, animated: true, completion: nil)
        }

    }

    //Setting and adding the 'Okay' button to 'UIAlertView'
   func setupAlertView() {
        let ActionOkay = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction!) -> Void in
            
            self.presentViewController(self.actionController, animated: true, completion: nil)
            
            })
        
        self.alertView.addAction(ActionOkay)
    }
    
    //Setting up a function to add 'UIActionSheet' to present 'Camera' or 'PhotoLibrary' to user
    func setupAlertController() {
        let optionForCamera = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction!) -> Void in
            
            self.photoPicker.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(self.photoPicker, animated: true, completion: nil)
            
            })
        
        let optionForPhotoLib = UIAlertAction(title: "Photo Library", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction!) -> Void in
            
            self.photoPicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
            self.presentViewController(self.photoPicker, animated: true, completion: nil)
            
            })
        
        let optionToCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: {(action: UIAlertAction!) -> Void in
            
               //Cancel
            
            })
        
        self.actionController.addAction(optionForCamera)
        self.actionController.addAction(optionForPhotoLib)
        self.actionController.addAction(optionToCancel)
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.photoPicker.allowsEditing = true
        self.photoPicker.delegate = self
        
        self.setupAlertController()
        self.setupAlertView()
    
    }
    
    //MARK: -UIImagePickerControllerDelegate Method
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        
        var editedImage = info[UIImagePickerControllerEditedImage] as UIImage  //Specifies an image edited by user.
        self.imageView.image = editedImage
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

