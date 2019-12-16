//
//  recentActTableViewCell.swift
//  MogoV1
//
//  Created by Fernando Chavez Rivera on 6/28/19.
//  Copyright © 2019 Fernando Chavez Rivera. All rights reserved.
//

import UIKit

class recentActTableViewCell: UITableViewCell {
    
    
    @IBOutlet var ScenePreview: UIImageView!
    @IBOutlet var ScenePlace: UILabel!
    @IBOutlet var SceneMovie: UILabel!
    @IBOutlet var SceneDescription: UILabel!
    @IBOutlet var SceneAddress: UILabel!
    @IBAction func SceneAccept(_ sender: Any) {
        print("Add it")
    }
    
    @IBAction func SceneDecline(_ sender: Any) {
        print("Deled it")
    }
    
    
    /*
     
     let SceneDescription: String
     let SceneCity: String
     let SceneMovie: String
     let ScenePlace: String
     let SceneVideo: String
     let SceneAddress:String
     let SceneKey: String
     let ref: DatabaseReference?
     
     */
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
