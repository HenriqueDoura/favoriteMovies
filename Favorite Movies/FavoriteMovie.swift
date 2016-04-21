//
//  FavoriteMovie.swift
//  Favorite Movies
//
//  Created by Henrique Dourado on 20/04/16.
//  Copyright © 2016 Henrique Dourado. All rights reserved.
//

import Foundation
import UIKit

class FavoriteMovie: NSObject, NSCoding {
    
    private var _movieTitle: String = ""
    private var _movieReason: String = ""
    private var _movieURL: String = ""
    private var _moviePlot: String = ""
    private var _movieImage: NSData = UIImagePNGRepresentation(UIImage(named: "noImg")!)!
    
    var movieTitle: String { return _movieTitle }
    var movieReason: String { return _movieReason }
    var movieUrl: String { return _movieURL }
    var moviePlot: String { return _moviePlot }
    var movieImage: NSData { return _movieImage }
    
    init(title: String, reason: String, url: String, plot: String, image: NSData) {
        self._movieTitle = title
        self._movieReason = reason
        self._movieURL = url
        self._moviePlot = plot
        self._movieImage = image
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        
        self._movieTitle = aDecoder.decodeObjectForKey("movieTitle") as! String
        self._movieReason = aDecoder.decodeObjectForKey("movieReason") as! String
        self._movieURL = aDecoder.decodeObjectForKey("movieURL") as! String
        self._moviePlot = aDecoder.decodeObjectForKey("moviePlot") as! String
        self._movieImage = aDecoder.decodeObjectForKey("movieImage") as! NSData
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._movieTitle, forKey: "movieTitle")
        aCoder.encodeObject(self._movieReason, forKey: "movieReason")
        aCoder.encodeObject(self._movieURL, forKey: "movieURL")
        aCoder.encodeObject(self._moviePlot, forKey: "moviePlot")
        aCoder.encodeObject(self._movieImage, forKey: "movieImage")
    }
    
}