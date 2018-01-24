//
//  ViewControllerMenu.swift
//  challengeApp
//
//  Created by dsi on 23/01/2018.
//  Copyright © 2018 etudiant1. All rights reserved.
//

import UIKit

class ViewControllerMenu: UIViewController {
    @IBOutlet weak var goToList: UIButton!
    @IBAction func goToListaction(_ sender: Any) {
        performSegue(withIdentifier: "go_to_list", sender: sender)
    }
    
    var button = DropDownButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        button = DropDownButton.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.setTitle("Mention", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.heightAnchor.constraint(lessThanOrEqualToConstant: 40).isActive = true
        
        button.DropView.DropDownOptions = ["Mathématiques" , "Informatique"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

protocol DropDownProtocol {
    func DropDownPressed(string : String)
}

class DropDownButton: UIButton , DropDownProtocol {
    
    func DropDownPressed(string : String){
        self.setTitle(string, for: .normal)
    }
    
    var DropView = DropDownView()
    var height = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
        
        DropView = DropDownView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        DropView.delegate = self
        DropView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(DropView)
        self.superview?.bringSubview(toFront: DropView)
        DropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        DropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        DropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = DropView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            
            isOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            
            if self.DropView.tableView.contentSize.height > 150 {
                self.height.constant = 150
            }else {
                self.height.constant = self.DropView.tableView.contentSize.height
            }
                
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.DropView.layoutIfNeeded()
            }, completion: nil)
            
        }else{
             isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.DropView.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class DropDownView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var DropDownOptions = [String]()
    var tableView = UITableView()
    var delegate : DropDownProtocol!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.backgroundColor = UIColor.darkGray
        self.backgroundColor = UIColor.darkGray
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DropDownOptions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        cell.textLabel?.text = DropDownOptions[indexPath.row]
        cell.backgroundColor = UIColor.darkGray
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.DropDownPressed(string: DropDownOptions[indexPath.row])
    }

}

