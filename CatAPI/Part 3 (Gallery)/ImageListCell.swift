//
//  ImageListCell.swift
//  CatAPI
//
//  Created by Pavel Ronaldo on 5/2/20.
//  Copyright © 2020 Pavel Ronaldo. All rights reserved.
//

import UIKit

class ImageListCell: UITableViewCell {
    
    @IBOutlet weak var CatsImage: UIImageView!
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setimg(Url : String) {
        loadingView.startAnimating()
        let url = URL (string: Url)
        let Request = URLRequest (url: url!)
        let session = URLSession (configuration: URLSessionConfiguration.default)
        let task = 	session.dataTask(with: Request) {[weak self] (data, response, error) in
            do {
                let data = try! Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self?.CatsImage.image = UIImage(data: data)
                    self?.loadingView.stopAnimating()
                }
            }
            
            
        }
        task.resume()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        CatsImage.image = nil
    }
    
}
