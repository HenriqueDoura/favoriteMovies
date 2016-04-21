//
//  MovieInfoVC.swift
//  Favorite Movies
//
//  Created by Henrique Dourado on 20/04/16.
//  Copyright © 2016 Henrique Dourado. All rights reserved.
//

import UIKit

class MovieInfoVC: UIViewController {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviePlot: UILabel!
    @IBOutlet weak var movieURLBtn: UIButton!
    
    var movie = FavoriteMovie()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            movieTitle.text = movie.movieTitle
            movieImage.image = UIImage(data: movie.movieImage)
            moviePlot.text = movie.moviePlot
        
            movieURLBtn.layer.cornerRadius = 25
            movieImage.layer.cornerRadius = 10
            movieImage.clipsToBounds = true
    }
    
    @IBAction func movieURLBtnPressed(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: movie.movieUrl)!)
    }
}
