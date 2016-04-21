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

    var movie = FavoriteMovie()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            movieTitle.text = movie.movieTitle
            movieImage.image = UIImage(data: movie.movieImage)
    }
}
