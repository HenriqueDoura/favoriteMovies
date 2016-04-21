//
//  FavoriteMovieCell.swift
//  Favorite Movies
//
//  Created by Henrique Dourado on 20/04/16.
//  Copyright © 2016 Henrique Dourado. All rights reserved.
//

import UIKit

class FavoriteMovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
            movieImg.layer.cornerRadius = 10
            movieImg.clipsToBounds = true
            movieImg.contentMode = .ScaleAspectFill
    }
    
    func configureCell(movie: FavoriteMovie) {
        movieTitle.text = movie.movieTitle
        movieDescription.text = movie.moviePlot
        movieImg.image = imageFromData(movie)
    }
    
    func imageFromData(movie: FavoriteMovie) -> UIImage {
        return UIImage(data: movie.movieImage)!
    }
}
