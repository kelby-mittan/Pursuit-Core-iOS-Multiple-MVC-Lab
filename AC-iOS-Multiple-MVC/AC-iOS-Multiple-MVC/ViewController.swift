//
//  ViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tom Seymour on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewOne: UITableView!
    
    private var animals = [ZooAnimal]() { // empty array
        didSet {
            tableViewOne.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animals = ZooAnimal.zooAnimals
        tableViewOne.dataSource = self
        tableViewOne.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let animalVC = segue.destination as? DetailViewController, let indexPath = tableViewOne.indexPathForSelectedRow else {
            fatalError()
        }

        animalVC.animal = animals[indexPath.row]
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableViewOne.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalCell else {
            fatalError()
        }

        
        let animal = animals[indexPath.row]
        
        if tableView == tableViewOne {
            cell.configureCell(for: animal)
        }
        
        return cell
    }
    
    
}

// change height of a cell

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}

