//
//  PhotoViewController.swift
//  ImageFilterDemo
//
//  Created by Victor  Adu on 8/5/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit
import Photos


protocol PhotoSelectedDelegate {
    
    func photoSelected(asset : PHAsset) -> Void
    
}


class PhotoViewController: UIViewController {
    
    
    var asset : PHAsset!
    var delegate : PhotoSelectedDelegate?

    @IBOutlet weak var imageView2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var targetSize = CGSize(width: CGRectGetWidth(self.imageView2.frame), height: CGRectGetHeight(self.imageView2.frame))
        //requesting the image for the asset
        PHImageManager.defaultManager().requestImageForAsset(self.asset, targetSize: targetSize, contentMode: PHImageContentMode.AspectFill, options: nil) { (result : UIImage!, [NSObject : AnyObject]!) -> Void in
            self.imageView2.image = result
        }
    }
    
    
    @IBAction func selectedHandlePhoto(sender: AnyObject) {
        println("Image Clicked")
        self.delegate!.photoSelected(self.asset)
            self.navigationController.popToRootViewControllerAnimated(true)
    
      }
    

    
        
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
