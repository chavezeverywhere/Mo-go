//
//  SearchSceneViewCell.swift
//  MogoV1
//
//  Created by Fernando Chavez Rivera on 6/27/19.
//  Copyright © 2019 Fernando Chavez Rivera. All rights reserved.
//

import UIKit

class SearchSceneViewCell: UITableViewCell {

    @IBOutlet var SDescription: UILabel!
    @IBOutlet var SMovie: UILabel!
    @IBOutlet var SPlace: UILabel!
    @IBOutlet var SPhoto: UIImageView!
    
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
