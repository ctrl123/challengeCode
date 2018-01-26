//
//  CustomData.swift
//  challengeApp
//
//  Created by etudiant1 on 1/24/18.
//  Copyright © 2018 etudiant1. All rights reserved.
//

import Foundation
import UIKit


open class CustomData{
    var note = Int()
    var nom = String()
    var prenom = String()
    //var pres = Bool()
    var presence = Bool()
    
    
    init(nom:String, prenom:String, pres:Bool, note:Int) {
        self.note = note
        self.nom = nom
        self.prenom = prenom
        self.presence = pres
        
    }
    
    
}

