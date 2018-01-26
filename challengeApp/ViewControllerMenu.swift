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
    
    @IBOutlet weak var Cours1: UIButton!
    @IBOutlet weak var Cours2: UIButton!
    
    
    
    
    // des variables pour gérer les niveau et mentions
    var nivL1Select: Bool = false
    var nivL2Select: Bool = false
    var mentMatSelect: Bool = false
    var mentInfSelect: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.title = titre
        douille2()
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
        CoursButtons.forEach{ (button) in
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
        /*case Cours1 = "Cours1"
        case Cours2 = "Cours2"*/
        
    }
    
    @IBAction func nivTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let items = Items(rawValue: title) else {
            return
        }
        
        switch items {
        case .L1:
            nivL1Select = true
            print("L1")
        case .L2:
            nivL2Select = true
            print("L2")
        default :
            print("rien")
        }
    }
    
    @IBAction func menTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let items = Items(rawValue: title) else {
            return
        }
        
        switch items {
        case .Mathématique:
            mentMatSelect = true
            print("Mathématique")
        
        case .Informatique:
            mentInfSelect = true
            print("Informatique")
       
        default :
            print("pas de mention")
        }
    }
    
    func douille2(){
        if(self.mentMatSelect == true && self.nivL1Select == true){
            Cours1.setTitle("computervocabulary", for: .normal)
            Cours2.setTitle("suite", for: .normal)
        } else if(self.nivL1Select == true && self.mentInfSelect == true){
            Cours1.setTitle("algo", for: .normal)
            Cours2.setTitle("mecanique", for: .normal)
        } else if(self.nivL2Select == true && self.mentMatSelect == true){
            Cours1.setTitle("geometrie", for: .normal)
            Cours2.setTitle("protocole", for: .normal)
        } else if (self.nivL2Select == true && self.mentInfSelect == true){
            Cours1.setTitle("java", for: .normal)
            Cours2.setTitle("c", for: .normal)
        } else {
                Cours1.setTitle("inconnu", for: .normal)
                Cours2.setTitle("inconnu", for: .normal)
        }
        
        
    }
    
    @IBAction func couTapped(_ sender: UIButton) {
            guard let title = sender.currentTitle, let items = Items(rawValue: title) else {
                return
            }
        
        
       
        
       /* switch items {
        case .Cours1:
            print("Cours1")
        case .Cours2:
            print("Cours2")
        default :
            print("pas de cours")
        }*/
    }
}

 
