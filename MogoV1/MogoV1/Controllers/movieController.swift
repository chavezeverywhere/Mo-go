//
//  movieController.swift
//  MogoV1
//
//  Created by Fernando Chavez Rivera on 6/27/19.
//  Copyright © 2019 Fernando Chavez Rivera. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseUI

class movieController: UIViewController, UITableViewDelegate,UITableViewDataSource, UINavigationControllerDelegate{
    
    
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    
    @IBOutlet var movieCity: UILabel!
    @IBOutlet var movieDesc: UILabel!
    @IBOutlet var moviePoster: UIImageView!
    @IBOutlet var movieData: UITableView!
   
    
    var cityScenes: [SceneCell] = []
    var mySceneIndex = 0
    
    @IBAction func thirdBut(_ sender: Any) {
        print("Third")
        thirdButton.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 1.0)
        secondButton.backgroundColor = UIColor(white: 0, alpha: 0)
        firstButton.backgroundColor = UIColor(white: 0, alpha: 0)
        loadTable(addres: "scenes2/")
    }
    
    @IBAction func seconBut(_ sender: Any) {
        loadTable(addres: "scenes1/")
        thirdButton.backgroundColor = UIColor(white: 0, alpha: 0)
        secondButton.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 1.0)
        firstButton.backgroundColor = UIColor(white: 0, alpha: 0)
        print("Second")
    }
    
    @IBAction func firstBut(_ sender: Any) {
        print("First")
        thirdButton.backgroundColor = UIColor(white: 0, alpha: 0)
        secondButton.backgroundColor = UIColor(white: 0, alpha: 0)
        firstButton.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 1.0)
        loadTable(addres: "scenes/")
        
    }
    
    var movie: MovieCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = movie.MovieName
        
        movieData.delegate = self
        movieData.dataSource = self
        movieCity.text = "Vancouver / Tokyo / Mexico"
        movieDesc.text = movie.MovieDescription
        print("El poster es...\(movie.MoviePoster)")
        
    
        moviePoster.image = UIImage(named: "\(movie.MoviePoster)")
        //moviePoster.image = #imageLiteral(resourceName: "Rectangle")
        firstButton.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 1.0)
        loadTable(addres: "scenes/")
    }
    
    func loadTable(addres: String){
        let ref = Database.database().reference(withPath: addres)
        
        ref.observe(.value, with: { snapshot in
            self.cityScenes = []
            
            for item in snapshot.children {
                let scene = SceneCell(snapshot: item as! DataSnapshot)
                self.cityScenes.append(scene)
            }
            self.movieData?.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityScenes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("SearchSceneViewCell", owner: self, options: nil)?.first as! SearchSceneViewCell
        
        cell.SPhoto.image = UIImage(named: "\(cityScenes[indexPath.row].SceneVideo)")
        //cell.SPhoto.image = #imageLiteral(resourceName: "Rectangle")
        cell.SDescription.text = cityScenes[indexPath.row].SceneDescription
        cell.SMovie.text = cityScenes[indexPath.row].SceneMovie
        cell.SPlace.text = cityScenes[indexPath.row].ScenePlace
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 1.0)
        cell.selectedBackgroundView = backgroundView
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Paso paso")
        mySceneIndex = indexPath.row
        performSegue(withIdentifier: "moreInfoScene", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue,  sender: Any?) {
        print("Entre tu y yo")
        let vc = segue.destination as! sceneController
        vc.scene = cityScenes[mySceneIndex]
    }
    
}
