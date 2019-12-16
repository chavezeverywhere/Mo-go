//
//  yourMoviesController.swift
//  MogoV1
//
//  Created by Fernando Chavez Rivera on 7/1/19.
//  Copyright © 2019 Fernando Chavez Rivera. All rights reserved.
//

import UIKit
import FirebaseDatabase

class yourMoviesController: UIViewController , UITableViewDelegate,UITableViewDataSource, UINavigationControllerDelegate {
    
    @IBOutlet var yourMoviesList: UITableView!
    var moviesRegistered: [MovieCell] = []
    var movieListIndex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Llego a las peliculas")
        yourMoviesList.delegate = self
        yourMoviesList.dataSource = self
        
        let ref = Database.database().reference(withPath: "movies/")
        
        ref.observe(.value, with: { snapshot in
            self.moviesRegistered = []
            
            for item in snapshot.children {
                let movie = MovieCell(snapshot: item as! DataSnapshot)
                self.moviesRegistered.append(movie)
            }
            self.yourMoviesList?.reloadData()
        })
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesRegistered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("SearchMovieViewCell", owner: self, options: nil)?.first as! SearchMovieViewCell
        cell.posterImage.image = UIImage(named: "\(moviesRegistered[indexPath.row].MoviePoster)")
        cell.movieTitle.text = moviesRegistered[indexPath.row].MovieName
        //cell.movieCity.text = moviesRegistered[indexPath.row].MovieCities["movieCity"]
        cell.movieDescription.text = moviesRegistered[indexPath.row].MovieDescription
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 1.0)
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myMovieIndex = indexPath.row
        performSegue(withIdentifier: "moreInfoMovie", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! movieController
        vc.movie = moviesRegistered[myMovieIndex]
        
    }
    
    
    
    
    
    
    
}
