//
//  AddMovieVC.swift
//  Favorite Movies
//
//  Created by Henrique Dourado on 20/04/16.
//  Copyright © 2016 Henrique Dourado. All rights reserved.
//

import UIKit

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieReason: UITextField!
    @IBOutlet weak var moviePlot: UITextField!
    @IBOutlet weak var movieURL: UITextField!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var websiteBtn: UIButton!
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            saveBtn.layer.cornerRadius = 25
            websiteBtn.layer.cornerRadius = 25
            movieImage.layer.cornerRadius = movieImage.frame.width / 2
            movieImage.clipsToBounds = true
    }
    
    @IBAction func addImageBtnPressed(sender: AnyObject) {
        picker.delegate = self
        picker.allowsEditing = true
        presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func websiteBtnPressed(sender: AnyObject) {
        if let url = NSURL(string: "http://www.imdb.com/"){
            UIApplication.sharedApplication().openURL(url)
        } else {
            let alert = UIAlertController(title: "Error", message: "For some unknown reason, it isn't possible to open this website now.", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func saveBtnPressed(sender: AnyObject) {
        if let title = movieTitle.text, let reason = movieReason.text, let plot = moviePlot.text, let url = movieURL.text, let image = movieImage.image {
            let imgData = UIImagePNGRepresentation(image)!
            DataService.instance.addMovie(FavoriteMovie(title: title, reason: reason, url: url, plot: plot, image: imgData))
            
            self.navigationController?.popViewControllerAnimated(true)
        } else {
            let alert = UIAlertController(title: "Error", message: "You must complete all the fields", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        movieImage.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}
