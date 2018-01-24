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
    @IBOutlet var pop_up: UIView!
    
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
    
    
    @IBAction func pop_up_info(_ sender: Any) {
        view.addSubview(pop_up)
        pop_up.center = view.center
    }
    @IBAction func hide_popup(_ sender: UIButton) {
        pop_up.removeFromSuperview()
    }
    
}

