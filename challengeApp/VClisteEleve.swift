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
            //parcours le tableau, remplit les listEleve
            for (key, _) in json{
                listEleve[key] = CustomData(nom: json[key]!["nom"]!,prenom: json[key]!["prenom"]!,pres: false, note: 0)
                print(key)
                }
            
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
        //Charge le contenu du JSON dans chaque cellule
        cell.label1?.text = listEleve["\(indexPath.row)"]?.nom
        cell.label2?.text = listEleve["\(indexPath.row)"]?.prenom
        listEleve["\(indexPath.row)"]?.presence = cell.switchIsOn()
        
        index[indexPath.row] = indexPath
        
        
        return cell
    }
    
    //func tableview
    
    //indique le nombre de section dans la tableView, il y en a qu'1
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let url: NSURL = NSURL(string: "http://194.199.74.245/challengeCode/JSONeleve.php")!
        connexion(url: url as URL)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "yyyy-MM-dd"// HH:mm"
        
        let date = Date(timeIntervalSinceNow: 0)
        
        // French Locale (fr_FR)
        dateFormatter.locale = Locale(identifier: "fr_FR")
        dateToolBar.title = dateFormatter.string(from: date)
        
        tableEleve.dataSource = self
        tableEleve.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBOutlet weak var pageBackground: UIImageView!
    @IBOutlet weak var tableEleve: UITableView!
    @IBOutlet weak var dateToolBar: UIBarButtonItem!
    
   
    @IBOutlet weak var VerouillerOutlet: UIBarButtonItem!
    private var isLocked: Bool = false
    
    @IBAction func VerouillerBtn(_ sender: Any) {
        if isLocked{
            VerouillerOutlet.title = "Vérouiller"
            tableEleve.isUserInteractionEnabled = true
            isLocked = false
        }else{
            VerouillerOutlet.title = "Dévérouiller"
            tableEleve.isUserInteractionEnabled = false
            isLocked = true
        }
    }
    
    @IBAction func Savebtn(_ sender: Any) {
       
        tableEleve.reloadData()
    }
    
    
    public var listEleve = [String:CustomData]()
    public var index = [Int:IndexPath]()
  
    @IBAction func Valider(_ sender: Any) {
        
        
      
        //Ici on envoie quelques informations à un script php qui va ajouter la connexion dans la BDD
        let url2: NSURL = NSURL(string: "http://194.199.74.245/challengeCode/ajoutBDD.php")!
        let request:NSMutableURLRequest = NSMutableURLRequest(url:url2 as URL)
        var texte = "["
        for (key, _) in listEleve{
            //print(listEleve[key]?.presence)
            texte += "key=\(key)&matiere=''&nom=\(listEleve[key]?.nom ?? "")&prenom=\(listEleve[key]?.prenom ?? "")&presAbs=\(listEleve[key]?.presence ?? false)&note=\(listEleve[key]?.note ?? 0)&date=\(dateToolBar.title ?? "")"
            if key == "\(listEleve.count - 1)" {
                texte += "]"
                break;
            }else{
                texte += "&"
            }
        }
        print(texte)
        let bodyData = texte
        request.httpMethod = "POST"
        request.httpBody = bodyData.data(using: String.Encoding.utf8);
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main)
        {
            (response, data, error) in
            print(response as Any)
            
        }
        
        //retour au ViewController précédent
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
