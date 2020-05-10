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
          
var Data = [ImageModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
       
       let url = URL (string: "https://api.thecatapi.com/v1/images/search")
        let Request = URLRequest (url: url!)
        let session = URLSession (configuration: URLSessionConfiguration.default)
        let task = 	session.dataTask(with: Request) {[weak self] (data, response, error) in
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String : Any]]
                    
                    else{
                        return
                }

            
                
                
                DispatchQueue.main.sync {
                    
                    for categ in json {
                    
                        self?.Data.append(ImageModel(url: categ ["url"] as! String ))
                        
                         }
                
                    self?.tableviewimage.reloadData()
                
            }
            }
                
            catch {
                print("Cannot Load from Server")
            }
            
            }
            
        task.resume()
        }
        
        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! MovieListCell
        cell.setimg(Url: Data[indexPath.row].url)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let MoviedetailsObj = storyboard?.instantiateViewController(withIdentifier: "MovieDetails") as? ImageDetails
        MoviedetailsObj?.setimg(Url: Data[indexPath.row].url)
        
        
        navigationController?.pushViewController(MoviedetailsObj!, animated: true)
        
        
        
    }
    
    
}
