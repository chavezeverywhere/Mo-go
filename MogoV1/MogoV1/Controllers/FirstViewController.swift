//
//  FirstViewController.swift
//  MogoV1
//
//  Created by Fernando Chavez Rivera on 6/25/19.
//  Copyright © 2019 Fernando Chavez Rivera. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FirstViewController: UIViewController {
    
    
    
    @IBOutlet var learnMoreBut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        learnMoreBut.backgroundColor = .clear
        learnMoreBut.layer.cornerRadius = 5
        learnMoreBut.layer.borderWidth = 1
        learnMoreBut.layer.borderColor = UIColor.white.cgColor
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}

