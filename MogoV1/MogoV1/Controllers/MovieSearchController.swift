//
//  MovieSearchController.swift
//  MogoV1
//
//  Created by Fernando Chavez Rivera on 6/25/19.
//  Copyright © 2019 Fernando Chavez Rivera. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseUI

var myMovieIndex = 0

class MovieSearchController: UITableViewController {
    
    @IBOutlet var searchMovieTable: UITableView!
    var newMovies: [MovieCell] = []
    var imageDownloaded: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image: UIImage = #imageLiteral(resourceName: "TabSearchBarMovies")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
    
        let ref = Database.database().reference(withPath: "movies/")
        
        ref.observe(.value, with: { snapshot in
            self.newMovies = []
            
            for item in snapshot.children {
                let movie = MovieCell(snapshot: item as! DataSnapshot)
                self.newMovies.append(movie)
            }
            self.searchMovieTable?.reloadData()
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newMovies.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("SearchMovieViewCell", owner: self, options: nil)?.first as! SearchMovieViewCell
        

        cell.posterImage.image = UIImage(named: "\(newMovies[indexPath.row].MoviePoster)")
        
        
        
        cell.movieTitle.text = newMovies[indexPath.row].MovieName
        cell.movieDescription.text = newMovies[indexPath.row].MovieDescription
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 1.0)
        cell.selectedBackgroundView = backgroundView
        
        return cell
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myMovieIndex = indexPath.row
        performSegue(withIdentifier: "moreInfoMovie", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! movieController
        vc.movie = newMovies[myMovieIndex]
        
    }
    

}
