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
    @IBOutlet var scroll_View: UIScrollView!
    @IBOutlet var MainMenu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll_View.maximumZoomScale = 4.0
        scroll_View.minimumZoomScale = 1.0
        scroll_View.delegate = self
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

extension ImageDetails {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return Image
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scroll_View.zoomScale > 1{
            if let image = Image.image{
                let rationWidth = Image.frame.width/image.size.width
                let rationHight = Image.frame.height / image.size.height
                let ration = rationWidth < rationHight ? rationWidth : rationHight
                let newWidth = image.size.width * ration
                let newHight = image.size.height * ration
                let conditionLeft = newWidth * scrollView.zoomScale > Image.frame.width
                let left = 0.5 * (conditionLeft ? newWidth - Image.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
                let conditionTop = newHight*scrollView.zoomScale > Image.frame.height
                let top = 0.5 * (conditionTop ? newHight - Image.frame.height : (scrollView.frame.height - scrollView.contentSize.height))
                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
            }
        }else{
            scrollView.contentInset = .zero
        }
    }
}

