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
    
    var isConnected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated. 
    }

    @IBAction func co_bouton(_ sender: Any) {
        if(indent_field.text == "admin" && mdp_field.text == "admin" && isConnected == false){
            indent_field.text = ""
            mdp_field.text = ""
            isConnected = true
            performSegue(withIdentifier: "goto_menu", sender: sender)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goto_menu"{
            let reception = segue.destination as? ViewControllerMenu
            reception?.isConnected = isConnected
        }
    }
    
}

