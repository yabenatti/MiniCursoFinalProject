//
//  CoreDataViewController.swift
//  MiniCursoFinalProject
//
//  Created by Yasmin Benatti on 2017-12-10.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import UIKit

class CoreDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemToList)), animated: true)

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
        print("add item")
    }

}
