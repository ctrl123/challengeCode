//
//  ViewController.swift
//  challengeApp
//
//  Created by etudiant1 on 1/23/18.
//  Copyright © 2018 etudiant1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var indent_field: UITextField!
    @IBOutlet weak var mdp_field: UITextField!
    @IBOutlet weak var co_bouton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated. 
    }

    @IBAction func co_bouton(_ sender: Any) {
        if(indent_field.text == "admin" && mdp_field.text == "admin"){
            performSegue(withIdentifier: "goto", sender: sender)
        }
    }
    
}

