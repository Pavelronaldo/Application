//
//  ImageListVc.swift
//  CatAPI
//
//  Created by Pavel Ronaldo on 5/2/20.
//  Copyright © 2020 Pavel Ronaldo. All rights reserved.
//

import UIKit

class ImageListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableviewimage: UITableView!
    
    var images = [ImageModel]() {
        didSet {
            DispatchQueue.main.async {
                self.tableviewimage.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    fetchImages()
    }
    
    func fetchImages() {
        guard let url = URL (string: "https://api.thecatapi.com/v1/images/search?x-api-key=f2c7dc04-508b-43fc-80e4-f6bd85ed285d&size=med&limit=20") else { return }
        let request = URLRequest (url: url)
        let session = URLSession (configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) {[weak self] (data, response, error) in
            guard let data = data else { return }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]] else { return }
                
                for categ in json {
                    self?.images.append(ImageModel(url: categ ["url"] as! String ))
                }
            }
            catch {
                print("Cannot Load from Server")
            }
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageListCell
        cell.setimg(Url: images[indexPath.row].url)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let MoviedetailsObj = storyboard?.instantiateViewController(withIdentifier: "MovieDetails") as? ImageDetails
        MoviedetailsObj?.setimg(Url: images[indexPath.row].url)
        
        
        navigationController?.pushViewController(MoviedetailsObj!, animated: true)
    }
}
