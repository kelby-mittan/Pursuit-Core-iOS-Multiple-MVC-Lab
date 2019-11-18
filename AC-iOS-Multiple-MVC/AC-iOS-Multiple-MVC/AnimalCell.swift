//
//  AnimalCell.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Kelby Mittan on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class AnimalCell: UITableViewCell {

    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
    func configureCell(for animal: ZooAnimal) {
        animalImage.image = UIImage(named: animal.imageNumber.description)
        animalLabel?.text = animal.name
        fromLabel?.text = animal.origin
    }
    

}
