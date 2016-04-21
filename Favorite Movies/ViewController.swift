//
//  ViewController.swift
//  Favorite Movies
//
//  Created by Henrique Dourado on 20/04/16.
//  Copyright © 2016 Henrique Dourado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let shared = DataService.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
            shared.loadMovies()
            tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shared.loadedMovies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("FavoriteMovieCell") as? FavoriteMovieCell {
            
            let movie = shared.loadedMovies[indexPath.row]
            cell.configureCell(movie)
            
            return cell
        } else {
            return FavoriteMovieCell()
        }
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .Normal, title: "Delete") { action, index in
            
            let alert = UIAlertController(title: "Are you sure?", message: "This movie will be deleted permanently", preferredStyle: .ActionSheet)
            alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Delete movie", style: .Destructive, handler: { action in
                
                self.shared.deleteMovie(indexPath)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                self.shared.loadMovies()
                
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        delete.backgroundColor = UIColor.redColor()
        
        return [delete]
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("goToMovieInfoVC", sender: shared.loadedMovies[indexPath.row])
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToMovieInfoVC" {
            if let vc = segue.destinationViewController as? MovieInfoVC {
                if let movie = sender as? FavoriteMovie {
                    vc.movie = movie
                }
            }
        }
    }
}

