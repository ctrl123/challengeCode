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
    var titre: String?
    @IBOutlet var NiveauButtons: [UIButton]!
    @IBOutlet var MentionButtons: [UIButton]!
    @IBOutlet var CoursButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.title = titre
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleSelection1(_ sender: UIButton) {
        NiveauButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func handleSelection2(_ sender: UIButton) {
        MentionButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func handleSelection3(_ sender: UIButton) {
        CoursButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    enum Items: String {
        case L1 = "L1"
        case L2 = "L2"
        case Mathématique = "Mathématique"
        case Informatique = "Informatique"
        case Cours1 = "Cours1"
        case Cours2 = "Cours2"
        case Cours3 = "Cours3"
        case Cours4 = "Cours4"
        case Cours5 = "Cours5"
        case Cours6 = "Cours6"
        case Cours7 = "Cours7"
        case Cours8 = "Cours8"
    }
    
    @IBAction func nivTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let items = Items(rawValue: title) else {
            return
        }
        
        switch items {
        case .L1:
            print("L1")
        default :
            print("L2")
        }
    }
    
    @IBAction func menTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let items = Items(rawValue: title) else {
            return
        }
        
        switch items {
        case .Mathématique:
            print("Mathématique")
        default :
            print("Informatique")
        }
    }
    
    @IBAction func couTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let items = Items(rawValue: title) else {
            return
        }
        
        switch items {
        case .Cours1:
            print("Cours1")
        case .Cours2:
            print("Cours2")
        case .Cours3:
            print("Cours3")
        case .Cours4:
            print("Cours4")
        case .Cours5:
            print("Cours5")
        case .Cours6:
            print("Cours6")
        case .Cours7:
            print("Cours7")
        default :
            print("Cours8")
        }
    }
    
}

 
