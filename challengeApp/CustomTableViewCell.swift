//
//  CustomTableViewCell.swift
//  challengeApp
//
//  Created by etudiant1 on 1/23/18.
//  Copyright © 2018 etudiant1. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell{

    
    @IBOutlet weak var customCellView: UIView!
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
 
    
    @IBOutlet weak var textFieldNote: UITextField!
    public var isPresent = Bool() //= false
    
    @IBOutlet weak var cellSwitch: UISwitch!
    
    public var note:Int = 0
    
    @IBAction func textFieldChanged(_ sender: Any) {
        //note = Int(textFieldNote.text!)!
        //print(note)
    }
    
    var switchFlag: Bool = false {
        didSet{               //This will fire everytime the value for switchFlag is set
            print(switchFlag) //do something with the switchFlag variable
        }
    }
    
    @IBAction func cellSwitchValueChanged(_ sender: Any) {
        if self.cellSwitch.isOn{
            customCellView.backgroundColor = UIColor.init(red: 0.035, green: 0.529, blue: 0.6, alpha: 1)
            label1.textColor = UIColor.white
            label2.textColor = UIColor.white
            isPresent = true
            switchFlag = true
            
        }else{
            customCellView.backgroundColor = UIColor.init(red: 1, green: 0.271, blue: 0, alpha: 1)
            label1.textColor = UIColor.black
            label2.textColor = UIColor.black
            isPresent = false
            switchFlag = false
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        /*
         func switchChanged(mySwitch: UISwitch) {
         let value = mySwitch.isOn
         // Do something
            isPresent = value
         }
         cellSwitch.addTarget(self, action: Selector(("switchChanged")), for: UIControlEvents.valueChanged)*/
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
