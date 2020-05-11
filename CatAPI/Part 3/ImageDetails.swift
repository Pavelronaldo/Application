//
//  ImageDetails.swift
//  CatAPI
//
//  Created by Pavel Ronaldo on 5/2/20.
//  Copyright © 2020 Pavel Ronaldo. All rights reserved.
//

import UIKit

class ImageDetails: UIViewController {
    
    var url = ""
    @IBOutlet weak var Image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Image.image = UIImage(named: url)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setimg(Url : String) {
        
        let url = URL (string : Url )
        let Request = URLRequest (url: url!)
        let session = URLSession (configuration: URLSessionConfiguration.default)
        let task = 	session.dataTask(with: Request) {[weak self] (data, response, error) in
            do {
                let data = try! Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self?.Image.image = UIImage(data:data)
                    
                }
                
            }
            
        }
        task.resume()
        
    }
    
}
