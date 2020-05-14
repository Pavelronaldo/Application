//
//  ViewController.swift
//  CatAPI
//
//  Created by Pavel Ronaldo on 5/2/20.
//  Copyright © 2020 Pavel Ronaldo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    var allcats = [CatsStats]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        tableView.delegate = self
        tableView.dataSource = self
        downloadJson()
        
    }
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allcats.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell{
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.text = allcats[indexPath.row].name.capitalized
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CatsViewController{
            destination.cats = allcats[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    func downloadJson() {
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                guard let data = data else { return }
                do {
                    self.allcats = try JSONDecoder().decode([CatsStats].self, from: data)
                }catch {
                    print("JSON Eror")
                }
            }
        }.resume()
    }
}


