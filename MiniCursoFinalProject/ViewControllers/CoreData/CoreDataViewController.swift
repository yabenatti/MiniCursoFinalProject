//
//  CoreDataViewController.swift
//  MiniCursoFinalProject
//
//  Created by Yasmin Benatti on 2017-12-10.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var animalsCoreData: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        //Bar Button Item
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemToList)), animated: true)
        
        //TableView
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func addItemToList(_ sender: UIBarButtonItem) {
        let alert  = UIAlertController(title: "New Animal", message: "Add a new animal", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in
            
            guard let textField = alert.textFields?.first,
                let animalToSave = textField.text else {
                    return
            }
            
            self.save(animal: animalToSave)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func save(animal: String) {
        
    }
}

// MARK: - TableView Methods

extension CoreDataViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalsCoreData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let animalCoreData = self.animalsCoreData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        cell.textLabel?.text = animalCoreData.value(forKeyPath: "name") as? String
        
        return cell
    }
}
