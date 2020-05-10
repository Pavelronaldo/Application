//
//  MovieListCell.swift
//  CatAPI
//
//  Created by Pavel Ronaldo on 5/2/20.
//  Copyright © 2020 Pavel Ronaldo. All rights reserved.
//

import UIKit

class MovieListCell: UITableViewCell {
    
        
    @IBOutlet weak var CatsImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setimg(Url : String) {
        
        let url = URL (string: Url)
        let Request = URLRequest (url: url!)
        let session = URLSession (configuration: URLSessionConfiguration.default)
        let task = 	session.dataTask(with: Request) {[weak self] (data, response, error) in
        do {
            let data = try! Data(contentsOf: url!)
               self?.CatsImage.image = UIImage(data: data)
                
            }

        
        }
        task.resume()
}

}
