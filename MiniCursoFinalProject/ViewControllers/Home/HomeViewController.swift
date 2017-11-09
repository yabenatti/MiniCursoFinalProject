//
//  HomeViewController.swift
//  MiniCursoParte1
//
//  Created by Yasmin Benatti on 2017-09-04.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var customView: CustomView!
    
    //MARK: - Variables
    var animalsArray: [Animal] = []
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Title
        self.title = "Home"
        
        //TableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView.register(HomeTableViewCell.classForCoder(), forCellReuseIdentifier: homeCellIndentifier)
        self.tableView.register(UINib(nibName:"HomeTableViewCell", bundle: nil), forCellReuseIdentifier: homeCellIndentifier)
        
        //Back Button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        //Animals Factory
        self.animalsArray = AnimalsFactory.createAnimals()
        
        //Custom View
        self.customView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Tab Bar
        self.tabBarController?.tabBar.isHidden = false

        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HomeToDetailSegue" {
            if let vc = segue.destination as? DetailViewController {
                vc.delegate = self
                if let animal = sender as? Animal {
                    vc.selectedAnimal = animal
                }
            }
        }
    }
    
    // MARK: - Segmented Control

    @IBAction func didChangeSegmentedControl(_ sender: Any) {
        if (self.segmentedControl.selectedSegmentIndex == 0) {
            self.tableView.isHidden = false
            self.customView.isHidden = true
        } else {
            self.tableView.isHidden = true
            self.customView.isHidden = false
        }
    }
}

extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let animal = self.animalsArray[indexPath.row]
//        self.performSegue(withIdentifier: "HomeToDetailSegue", sender: animal)
        
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewControllerID") as? DetailViewController {
            vc.selectedAnimal = animal
            vc.delegate = self;
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomeViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animalsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: homeCellIndentifier, for: indexPath) as? HomeTableViewCell else {
            fatalError("Cannot create Home Table View Cell")
        }
    
        cell.initWithAnimal(animal: self.animalsArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}

extension HomeViewController: DetailViewControllerProtocol {
    func selectedTheAnimal(animal: Animal) {
        let alert = UIAlertController(title: animal.name.uppercased(), message: "Selected the: \(animal.name)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil);
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

