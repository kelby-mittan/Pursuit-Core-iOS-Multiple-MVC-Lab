//
//  DetailViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Kelby Mittan on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var animalDescription: UITextView!
    
    var animal: ZooAnimal?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        guard let theAnimal = animal else {
            fatalError()
        }
        animalImage.image = UIImage(named: theAnimal.imageNumber.description)
        animalLabel.text = theAnimal.name
        animalDescription.text = theAnimal.info
    }
}
