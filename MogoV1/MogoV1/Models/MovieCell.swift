//
//  MovieCell.swift
//  MogoV1
//
//  Created by Fernando Chavez Rivera on 6/25/19.
//  Copyright © 2019 Fernando Chavez Rivera. All rights reserved.
//

import Foundation
import Firebase

struct MovieCell{
    let MovieDescription: String
    let MovieName: String
    let MoviePoster: String
    //var MovieCities: [[Int]] = []
    var MovieCities = [Int:[Int]]()
    var MovieActors: [Int] = []
    let MovieKey: String
    let ref: DatabaseReference?
    
    
    
    init(MovieDescription: String, MovieName: String,MoviePoster: String,MovieKey: String = "",MovieActors :[Int],MovieCities: [Int:[Int]]){
        self.MovieDescription = MovieDescription
        self.MovieName = MovieName
        self.MoviePoster = MoviePoster
        self.MovieCities = MovieCities
        self.MovieActors = MovieActors
        self.MovieKey = MovieKey
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        //Get the ammount of cities that has
        let citySnap = snapshot.childSnapshot(forPath: "MCity")
        print("How many cities: \(citySnap.childrenCount)")
        //print("How many cities: \(citySnap.childSnapshot(forPath: "CityID").value as! Int)")
        //Get the ammount of actors that has
        //print("How many actors: \(snapshot.childSnapshot(forPath: "MActors").childrenCount)")
        MovieKey = snapshot.key
        MovieDescription = snapshotValue["MDesc"] as! String
        MovieName = snapshotValue["MName"] as! String
        MoviePoster = snapshotValue["MPoster"] as! String
        ref = snapshot.ref
        for Actor in snapshot.childSnapshot(forPath: "MActors").children {
            let ActID = Actor as! DataSnapshot
            MovieActors.append(ActID.childSnapshot(forPath: "ActID").value as! Int)
        }
        //Get all the cities
        for City in snapshot.childSnapshot(forPath: "MCity").children {
            let CityID = City as! DataSnapshot
            var SceneContainer:[Int] = []
            let CityValue = CityID.childSnapshot(forPath: "CityID").value as! Int
            //Get all the scenes that took place in that city
            for Scene in CityID.children{
                let SceneID = Scene as! DataSnapshot
                //If the Scene has a city it added to the array
                if SceneID.hasChildren(){
                    let SceneValue = SceneID.childSnapshot(forPath: "SceneID").value as! Int
                    SceneContainer.append(SceneValue)
                    //MovieCities.append([CityValue,SceneValue])
                }
                else{
                }
            }
            MovieCities[CityValue] = SceneContainer
            
        }
        print(MovieCities)
    }
}
