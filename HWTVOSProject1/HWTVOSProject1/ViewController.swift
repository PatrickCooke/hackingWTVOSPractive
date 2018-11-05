//
//  ViewController.swift
//  HWTVOSProject1
//
//  Created by Patrick Cooke on 11/4/18.
//  Copyright © 2018 Patrick Cooke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var categories = ["Airplanes", "Beaches", "Bridges", "Cats", "Cities", "Dogs", "Earth", "Forests", "Galaxies", "Landmarks", "Mountains", "People", "Roads", "Sports", "Sunsets"]
    var appID = "72ee628d37fc81396e1eb4dda2a3fbe2d3fd7b9c5f418868fb467939710d63fc"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Images") as? ImagesViewController else { return }
        vc.category = categories[indexPath.row]
        present(vc, animated: true)
    }
}

