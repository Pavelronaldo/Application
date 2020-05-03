//
//  HeroViewController.swift
//  CatAPI
//
//  Created by Pavel Ronaldo on 5/2/20.
//  Copyright © 2020 Pavel Ronaldo. All rights reserved.
//

import UIKit

class HeroViewController: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var originLbl: UILabel!
    
    
    var cats:CatsStats?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        nameLbl.text = cats?.name
        originLbl.text = cats?.origin
        
    }
}


