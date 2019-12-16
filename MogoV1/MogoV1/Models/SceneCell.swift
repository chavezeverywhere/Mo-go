//
//  MovieCell.swift
//  MogoV1
//
//  Created by Fernando Chavez Rivera on 6/25/19.
//  Copyright © 2019 Fernando Chavez Rivera. All rights reserved.
//

import Foundation
import Firebase

struct SceneCell{
    let SceneDescription: String
    let SceneCity: String
    let SceneMovie: String
    let ScenePlace: String
    let SceneVideo: String
    let SceneAddress:String
    let SceneKey: String
    let ref: DatabaseReference?
    
    
    init(SceneDescription: String, SceneCity: String, SceneMovie: String, ScenePlace: String,SceneAddress: String, SceneVideo: String, SceneKey: String = "") {
        self.SceneDescription = SceneDescription
        self.SceneCity = SceneCity
        self.SceneMovie = SceneMovie
        self.ScenePlace = ScenePlace
        self.SceneVideo = SceneVideo
        self.SceneAddress = SceneAddress
        self.SceneKey = SceneKey
        self.ref = nil
    }
    
    
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        SceneDescription = snapshotValue["SDesc"] as! String
        SceneCity = snapshotValue["SDesc"] as! String
        SceneMovie = snapshotValue["SMovie"] as! String
        ScenePlace = snapshotValue["SPlace"] as! String
        SceneVideo = snapshotValue["SVideo"] as! String
        SceneAddress = snapshotValue["SPAddress"] as! String
        SceneKey = snapshot.key
        ref = snapshot.ref
        

    }
}
