//
//  HeroViewController.swift
//  CatAPI
//
//  Created by Pavel Ronaldo on 5/2/20.
//  Copyright © 2020 Pavel Ronaldo. All rights reserved.
//

import UIKit

class HeroViewController: UIViewController {
    
    @IBOutlet weak var originLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var life_spanLbl: UILabel!
  @IBOutlet weak var temperamentLbl: UILabel!
    var cats:CatsStats?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        descriptionLbl.text = cats?.description
        originLbl.text = cats?.origin
        life_spanLbl.text = cats?.life_span
       temperamentLbl.text = cats?.temperament
        
    }
}


