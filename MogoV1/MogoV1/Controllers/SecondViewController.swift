//
//  SecondViewController.swift
//  MogoV1
//
//  Created by Fernando Chavez Rivera on 6/25/19.
//  Copyright © 2019 Fernando Chavez Rivera. All rights reserved.
//

import UIKit
import FirebaseDatabase


class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UINavigationControllerDelegate {
    
    
    @IBOutlet var PlacesVisited: UITableView!
    var plcsVisited: [SceneCell] = []
    var placeIndex = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Corrió la segunda")
        PlacesVisited.delegate = self
        PlacesVisited.dataSource = self
        let ref = Database.database().reference(withPath: "scenes/")
        
        ref.observe(.value, with: { snapshot in
            self.plcsVisited = []
            
            for item in snapshot.children {
                let scene = SceneCell(snapshot: item as! DataSnapshot)
                self.plcsVisited.append(scene)
            }
            self.PlacesVisited?.reloadData()
        })
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plcsVisited.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("recentActTableViewCell", owner: self, options: nil)?.first as! recentActTableViewCell
        
        
        cell.ScenePreview.image = UIImage(named: "\(plcsVisited[indexPath.row].SceneVideo)")
        cell.ScenePlace.text = plcsVisited[indexPath.row].ScenePlace
        cell.SceneMovie.text = plcsVisited[indexPath.row].SceneMovie
        cell.SceneDescription.text = plcsVisited[indexPath.row].SceneDescription
        cell.SceneAddress.text = plcsVisited[indexPath.row].SceneAddress
        
        
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 1.0)
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mySceneIndex = indexPath.row
        performSegue(withIdentifier: "moreInfoScene", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! sceneController
        vc.scene = plcsVisited[mySceneIndex]
    }



}

