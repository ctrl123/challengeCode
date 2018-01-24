//
//  VClisteEleve.swift
//  challengeApp
//
//  Created by etudiant1 on 1/23/18.
//  Copyright © 2018 etudiant1. All rights reserved.
//

import UIKit

class VClisteEleve: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func connexion(url: URL){
        do{
            //recupere le contenu du JSON
            let data:NSData = try NSData(contentsOf: url as URL)
            
            //permet de stocker les infos du JSON dans un tableau a 2 dimensions
            let json = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as! [String: [String: String]]
            
            //print(json as Any) //pour debugger
            //parcours le tableau, remplit les labels, et affiche/masque les boutons de l'interface
            /*for (key, _) in json{
                listEleve = [json[key]!["nom"]!:json[key]!["prenom"]!]
                /*
                if champID.text == json[key]!["login"] && champMDP.text == json[key]!["pwd"]{
                    titreLabel.text = "Bienvenue"
                    labelNOM.text = json[key]!["nom"]
                    labelPRENOM.text = json[key]!["prenom"]
                    imageBtn.isHidden = false
                    btnCo.isHidden = true
                    btnDeco.isHidden = false
                    champID.isHidden = true
                    champMDP.isHidden = true
                */}*/
               listEleve = json
            }catch{
            //pour debugger
            print(error)
            print("\n\n\n")
            }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listEleve.count
    }
    
    
    //fonction qui ajoute les données dans chaque cellule
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! CustomTableViewCell
        
        //indexPath.row renvoie le numero de la cellule
        //let text = listEleve["\(indexPath.row)"]
        
        cell.label1?.text = listEleve["\(indexPath.row)"]?["nom"]
        //cell.label2?.text = listEleve[indexPath.row]?["nom"]!["prenom"]
        cell.label2?.text = listEleve["\(indexPath.row)"]?["prenom"]
        //cell.label2?.text = listEleve.index(forKey: indexPath.row)?["nom"]
        
        
        return cell
    }
    
    //indique le nombre de section dans la tableView, il y en a qu'1
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let url: NSURL = NSURL(string: "http://194.199.74.245/challengeCode/JSONeleve.php")!
        connexion(url: url as URL)
        
        tableEleve.dataSource = self
        tableEleve.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var pageBackground: UIImageView!
    @IBOutlet weak var tableEleve: UITableView!
    
    private var listEleve = [String:[String: String]]()
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
