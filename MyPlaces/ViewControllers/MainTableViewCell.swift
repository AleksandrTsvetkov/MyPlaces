//
//  MainTableViewCell.swift
//  MyPlaces
//
//  Created by Александр Цветков on 10.01.2020.
//  Copyright © 2020 Александр Цветков. All rights reserved.
//

import UIKit
import Cosmos

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var imageOfPlace: UIImageView! {
        didSet {
            imageOfPlace?.layer.cornerRadius = imageOfPlace.frame.size.height / 2
            imageOfPlace?.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView! {
        didSet {
            cosmosView.settings.updateOnTouch = false
        }
    }
    @IBOutlet weak var typeLabel: UILabel!

}
