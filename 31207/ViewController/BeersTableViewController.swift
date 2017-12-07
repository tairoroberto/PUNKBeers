//
//  BeersTableViewController.swift
//  31207
//
//  Created by Tairo Roberto on 12/07/17.
//  Copyright © 2017 Tairo Roberto. All rights reserved.
//

import UIKit
import Kingfisher

class BeersTableViewController: UITableViewController {
    
    fileprivate var listBeers = [Beer]()
    fileprivate var selectedBeer: Beer?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadBeers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadBeers() {
        
        Service.getBeers(onComplete: { beersList in
            
            if let beers = beersList {
                DispatchQueue.main.async {
                    self.listBeers = beers
                    
                    if self.listBeers.count < 1 {
                        let message = "Nenhuma cerveja encontrada."
                        let messageLabel = UILabel(frame: CGRect(x: 0,y: 0,width: self.view.bounds.size.width, height:  self.view.bounds.size.height))
                        messageLabel.text = message
                        messageLabel.textColor = UIColor.black
                        messageLabel.numberOfLines = 0;
                        messageLabel.textAlignment = .center;
                        messageLabel.sizeToFit()
                        
                        self.tableView.backgroundView = messageLabel;
                        self.tableView.separatorStyle = .none;
                    } else {
                        self.tableView.separatorStyle = .singleLine;
                        self.tableView.reloadData()

                    }
                }
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detalhes" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.beer = self.selectedBeer
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listBeers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeerTableViewCell
        
        let url = URL(string: listBeers[indexPath.row].image_url!)!
        cell.beerImageIV.kf.setImage(with: url)
        cell.beerNameLbl.text = listBeers[indexPath.row].name
        let abv = listBeers[indexPath.row].abv
        cell.beerABVLbl.text = String(format: "%.1f", abv!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBeer = listBeers[indexPath.row]
        performSegue(withIdentifier: "detalhes", sender: self)
    }
}
