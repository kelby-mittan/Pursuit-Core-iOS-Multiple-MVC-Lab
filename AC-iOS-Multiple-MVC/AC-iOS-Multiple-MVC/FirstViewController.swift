//
//  FirstViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Kelby Mittan on 11/20/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var firstTableView: UITableView!
        
        private var animals = [ZooAnimal]() { // empty array
            didSet {
                firstTableView.reloadData()
            }
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            animals = ZooAnimal.zooAnimals
            firstTableView.dataSource = self
            firstTableView.delegate = self
            
        }
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            guard let animalVC = segue.destination as? DetailViewController, let indexPath = firstTableView.indexPathForSelectedRow else {
                fatalError()
            }

            animalVC.animal = animals[indexPath.row]
        }
        
        
    }

    extension FirstViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return animals.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = firstTableView.dequeueReusableCell(withIdentifier: "firstAnimalCell", for: indexPath)

            
            let animal = animals[indexPath.row]
            
            cell.textLabel?.text = animal.name
            cell.detailTextLabel?.text = animal.origin
            cell.imageView?.image = UIImage(named: animal.imageNumber.description)
            
            
            return cell
        }
        
        
    }

    // change height of a cell

    extension FirstViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
        
    }

