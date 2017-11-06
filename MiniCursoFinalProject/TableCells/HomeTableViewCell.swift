//
//  HomeTableViewCell.swift
//  MiniCursoParte1
//
//  Created by Yasmin Benatti on 2017-09-05.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import UIKit

let homeCellIndentifier : String! = "homeCellIndentifier"

class HomeTableViewCell: UITableViewCell {

    //MARK : - Outlet
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var homeTitleLabel: UILabel!
    @IBOutlet weak var arrowRightImageView: UIImageView!
    
    //MARK : - Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = UIColor.clear
        
        self.circleView.layer.cornerRadius = self.circleView.frame.size.width/2
        self.circleView.layer.masksToBounds = true
        
        self.arrowRightImageView.tintColor = Colors.darkGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initWithAnimal(animal: Animal) {
        self.homeTitleLabel.text = animal.name
    }
    
}
