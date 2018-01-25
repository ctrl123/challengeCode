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
    
    //collection d'image pour l'animation de demarrage
    var collec: [UIImage] = [UIImage].init()
    
    //variables qui recupère le nom et prénoms des profs
    var nom_prof: String = ""
    var pren_prof: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //chargement des images dans l' ImageView
        for i in 0...45{
            let imageName = UIImage.init(named: "anim_challengecode0\(i).jpg")/*"anim_challengecode0\(i).jpg"*/
            collec.append(imageName!)
        }
        //lancement de l'aniamtion
        animation_screen()
        
        /////////////////////////////
        indent_field.text = nil
        mdp_field.text = nil
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated. 
    }

    //bouton de connexion
    @IBAction func co_bouton(_ sender: Any?) {
        do {
            let url = NSURL(string: "http://194.199.74.7/Challengecode/JSONprof1.php")
            
            let data = NSData(contentsOf: url! as URL)
            
            let object = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments) as! [String: [String: String]]
           for (key,_) in object {
            if (indent_field.text == object[key]!["login"]) && (mdp_field.text == object[key]!["pwd"]){
                nom_prof = object[key]!["nom"]!
                pren_prof = object[key]!["prenom"]!
                indent_field.text = ""
                mdp_field.text = ""
                performSegue(withIdentifier: "goto_menu", sender: sender)
               
                }
           
            }
            
        } catch {
            // Script si le json n'est pas reconnu
            print("\n\n")
            print(error)
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
    
    
    // animation de lancement
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
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goto_menu"{
            let destination = segue.destination as? ViewControllerMenu
            destination?.titre = "Bienvenue \(nom_prof) \(pren_prof)"
            
        }
    }
    
}

