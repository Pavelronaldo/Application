//
//  ImageDetails.swift
//  CatAPI
//
//  Created by Pavel Ronaldo on 5/2/20.
//  Copyright © 2020 Pavel Ronaldo. All rights reserved.
//

import UIKit

class ImageDetails: UIViewController, UIScrollViewDelegate {
    
    var url = ""
    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var viewLoading3: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let minScale: Float = Float(scrollView.frame.size.width / Image.frame.size.width)
        scrollView.minimumZoomScale = CGFloat(minScale)
        scrollView.maximumZoomScale = 3.0
        scrollView.contentSize = Image.frame.size
        scrollView.delegate = self
        viewLoading3.startAnimating()
        Image.image = UIImage(named: url)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.Image
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
                    self?.viewLoading3.stopAnimating()
                }
                
            }
            
        }
        task.resume()
        
    }
    
}
