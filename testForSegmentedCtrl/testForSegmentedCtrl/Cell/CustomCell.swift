//
//  CustomCell.swift
//  testForSegmentedCtrl
//
//  Created by WANKI KIM on 2020/01/21.
//  Copyright © 2020 김완기. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var accessoryLabel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func custominit(text: String, accessoryText:String){
//        self.titleLabel.text = text
//        self.accessoryLabel.image = UIImage(named: accessoryText)
//
//        self.titleLabel.textColor = UIColor.white
//
//        self.contentView.backgroundColor = UIColor.darkGray
//    }
}
