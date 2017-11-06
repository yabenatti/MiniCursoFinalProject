//
//  DetailViewController.swift
//  MiniCursoParte1
//
//  Created by Yasmin Benatti on 2017-09-04.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import UIKit

protocol DetailViewControllerProtocol {
    func selectedTheAnimal(animal: Animal)
}

class DetailViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalDescriptionLabel: UILabel!
    
    //MARK: - Variables
    var delegate: DetailViewControllerProtocol?
    var selectedAnimal: Animal?
    
    //MARK: - UIView Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Title
        self.title = "Detail"
        
        //TabBar
        self.tabBarController?.tabBar.isHidden = true
        
        //Back Button
        self.navigationItem.setHidesBackButton(false, animated: false)
        
        self.fillScreen()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fillScreen() {
        if let animal = self.selectedAnimal {
            self.animalImageView.image = UIImage.init(named: animal.image)
            self.animalNameLabel.text = animal.name.uppercased()
        }
    }
    
    //MARK: - IBActions
    @IBAction func didTapCTAButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

        if let animal = self.selectedAnimal {
            self.delegate?.selectedTheAnimal(animal: animal)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
