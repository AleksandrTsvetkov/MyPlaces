//
//  ViewController.swift
//  MyPlaces
//
//  Created by Александр Цветков on 08.01.2020.
//  Copyright © 2020 Александр Цветков. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var places: Results<Place>!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.isEmpty ? 0 : places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainTableViewCell
        let place = places[indexPath.row]
        cell.nameLabel?.text = place.name
        cell.locationLabel?.text = place.location
        cell.typeLabel?.text = place.type
        cell.imageOfPlace.image = UIImage(data: place.imageData!)
        cell.imageOfPlace?.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace?.clipsToBounds = true
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        places = realm.objects(Place.self)
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newPlaceVC = segue.source as? NewPlaceTableViewController else { return }
        newPlaceVC.saveNewPlace()
        tableView.reloadData()
    }
    
}

