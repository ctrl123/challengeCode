//
//  CustomData.swift
//  challengeApp
//
//  Created by etudiant1 on 1/24/18.
//  Copyright © 2018 etudiant1. All rights reserved.
//

import Foundation

open class CustomData{
    //var id = Int()
    var nom = String()
    var prenom = String()
    var presence = Bool()
    
    init(nom:String, prenom:String, pres:Bool) {
        //self.id = id
        self.nom = nom
        self.prenom = prenom
        self.presence = pres
        
    }
}

