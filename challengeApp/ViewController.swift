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
    @IBOutlet weak var anim_start: UIImageView!
    
    var isConnected: Bool = false
    var collec: [UIImage] = [UIImage].init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...45{
            let imageName = UIImage.init(named: "anim_challengecode0\(i).jpg")/*"anim_challengecode0\(i).jpg"*/
            collec.append(imageName!)
        }
        animation_screen()
       isConnected = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated. 
    }

    //bouton de connexion
    @IBAction func co_bouton(_ sender: Any) {
        if(indent_field.text == "admin" && mdp_field.text == "admin" && isConnected == false){
            indent_field.text = ""
            mdp_field.text = ""
            isConnected = true
            performSegue(withIdentifier: "goto_menu", sender: sender)
        }
    }
    
    // bouton pour afficher et retirer la pop_up
    @IBAction func pop_up_info(_ sender: Any) {
        view.addSubview(pop_up)
        pop_up.center = view.center
        
    }
    @IBAction func hide_popup(_ sender: UIButton) {
        pop_up.removeFromSuperview()
    }
    
    func animation_screen(){
        anim_start.animationImages = collec
        anim_start.animationDuration = 1
        anim_start.animationRepeatCount = 1
        anim_start.startAnimating()
        //anim_start.stopAnimating()
        
        if anim_start.isAnimating == false {
            anim_start.isHidden = true
        }
    }
    
}

