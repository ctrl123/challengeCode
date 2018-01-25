//
//  CustomTableViewCell.swift
//  challengeApp
//
//  Created by etudiant1 on 1/23/18.
//  Copyright © 2018 etudiant1. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var customCellView: UIView!
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var textFieldNote: UITextField!
    public var isPresent:Bool = false
    
    @IBAction func cellSitchAction(_ sender: Any) {
        if cellSwitch.isOn{
            customCellView.backgroundColor = UIColor.init(red: 0.035, green: 0.529, blue: 0.6, alpha: 1)
            label1.textColor = UIColor.white
            label2.textColor = UIColor.white
            isPresent = true
        }else{
            customCellView.backgroundColor = UIColor.init(red: 1, green: 0.271, blue: 0, alpha: 1)
            label1.textColor = UIColor.black
            label2.textColor = UIColor.black
            isPresent = false
        }
    }
    
    @IBOutlet weak var cellSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
