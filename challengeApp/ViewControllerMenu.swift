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
    
    var titre: String = "bonbon"
    
    @IBOutlet var cityButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.title =  titre
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleSelection(_ sender: UIButton) {
        cityButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    enum Citys: String {
        case boston = "Boston"
        case sanFranscisco = "San Francisco"
    }
    
    @IBAction func cityTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let city = Citys(rawValue: title) else {
            return
        }
        
        switch city {
        case .boston:
            print("Boston")
        default:
            print("San fran")
        }
        
    }
}

 
