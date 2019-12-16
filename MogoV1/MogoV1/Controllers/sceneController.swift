//
//  sceneController.swift
//  MogoV1
//
//  Created by Fernando Chavez Rivera on 6/28/19.
//  Copyright © 2019 Fernando Chavez Rivera. All rights reserved.
//

import UIKit

class sceneController: UIViewController{
    
    @IBOutlet var sceneDescription: UILabel!
    @IBOutlet var sceneImagePlace: UIImageView!
    
    @IBOutlet var infoPlaceHolder: UIImageView!
    
    @IBOutlet var infoBut: UIButton!
    @IBOutlet var photoBut: UIButton!
    @IBOutlet var triviaBut: UIButton!
    
    @IBAction func getSceneInfo(_ sender: Any) {
        photoBut.backgroundColor = UIColor(white: 0, alpha: 0)
        infoBut.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 1.0)
        infoPlaceHolder.image = #imageLiteral(resourceName: "Info")
        
    }
    @IBAction func getScenePhotos(_ sender: Any) {
        photoBut.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 1.0)
        infoBut.backgroundColor = UIColor(white: 0, alpha: 0)
        infoPlaceHolder.image = #imageLiteral(resourceName: "Photos")
        
    }
    
    
    
    var scene: SceneCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Scene description"
        photoBut.backgroundColor = UIColor(white: 0, alpha: 0)
        infoBut.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 1.0)
        sceneDescription.text = scene.SceneDescription
        sceneImagePlace.image = UIImage(named: "\(scene.SceneVideo)")
        
        
    }
    
    
}

