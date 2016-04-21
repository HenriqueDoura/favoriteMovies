//
//  DataService.swift
//  Favorite Movies
//
//  Created by Henrique Dourado on 20/04/16.
//  Copyright © 2016 Henrique Dourado. All rights reserved.
//

import Foundation

class DataService {
    
    static let instance = DataService()
    
    let dft = NSUserDefaults.standardUserDefaults()
    
    private var _loadedMovies = [FavoriteMovie]()
    
    var loadedMovies: [FavoriteMovie] {
        return _loadedMovies
    }
    
    func loadMovies() {
        if let moviesData = dft.objectForKey("movies") as? NSData {
            if let movies = NSKeyedUnarchiver.unarchiveObjectWithData(moviesData) as? [FavoriteMovie] {
                _loadedMovies = movies
            }
        }
    }
    
    func saveMovies() {
        let movieData = NSKeyedArchiver.archivedDataWithRootObject(_loadedMovies)
        dft.setObject(movieData, forKey: "movies")
    }
    
    func addMovie(movie: FavoriteMovie) {
        _loadedMovies.append(movie)
        
        saveMovies()
    }
    
    func deleteMovie(index: NSIndexPath) {
        _loadedMovies.removeAtIndex(index.row)
        saveMovies()
    }
}