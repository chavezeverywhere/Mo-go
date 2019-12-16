//
//  SceneSearchController.swift
//  MogoV1
//
//  Created by Fernando Chavez Rivera on 6/25/19.
//  Copyright © 2019 Fernando Chavez Rivera. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseUI
import FirebaseStorage

var mySceneIndex = 0


class SceneSearchController: UITableViewController {
    


    @IBOutlet var searchSceneTable: UITableView!
    
    var newScenes: [SceneCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image: UIImage = #imageLiteral(resourceName: "TabSearchBarScenes")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
        
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        
        
        
        let ref = Database.database().reference(withPath: "scenes/")
        
        ref.observe(.value, with: { snapshot in
            self.newScenes = []
            
            for item in snapshot.children {
                let scene = SceneCell(snapshot: item as! DataSnapshot)
                self.newScenes.append(scene)
            }
            self.searchSceneTable?.reloadData()
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newScenes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("SearchSceneViewCell", owner: self, options: nil)?.first as! SearchSceneViewCell
        
        cell.SPhoto.image = UIImage(named: "\(newScenes[indexPath.row].SceneVideo)")
        
        
        cell.SDescription.text = newScenes[indexPath.row].SceneDescription
        cell.SMovie.text = newScenes[indexPath.row].SceneMovie
        cell.SPlace.text = newScenes[indexPath.row].ScenePlace
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 1.0)
        cell.selectedBackgroundView = backgroundView
        
        return cell
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mySceneIndex = indexPath.row
        performSegue(withIdentifier: "moreInfoScene", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! sceneController
        vc.scene = newScenes[mySceneIndex]
    }
    
    
}
