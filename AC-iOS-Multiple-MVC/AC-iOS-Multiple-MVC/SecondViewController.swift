//
//  SecondViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Kelby Mittan on 11/19/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tableViewTwo: UITableView!
    
    var zooAnimals = [[ZooAnimal]]() {
        didSet {
            tableViewTwo.reloadData()
        }
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
        zooAnimals = ZooAnimal.classificationSections()
        tableViewTwo.dataSource = self
            
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            
        guard let animalVCTwo = segue.destination as? DetailViewController, let indexPathTwo = tableViewTwo.indexPathForSelectedRow else {
            fatalError()
        }
        animalVCTwo.animal = zooAnimals[indexPathTwo.section][indexPathTwo.row]
        }
}

extension SecondViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return zooAnimals[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableViewTwo.dequeueReusableCell(withIdentifier: "zooAnimalCell", for: indexPath) as? AnimalCell else {
            fatalError()
        }
        
        let animal = zooAnimals[indexPath.section][indexPath.row]
        
        cell.configureCell(for: animal)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return zooAnimals.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        zooAnimals[section].first?.classification
    }
    
    
}
