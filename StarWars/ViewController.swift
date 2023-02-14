//
//  ViewController.swift
//  StarWars
//
//  Created by TekUp University 2 on 14/2/2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    let nom = ["yosra","asma","ines"]
    
    let cellReuseIdentifier = "cellIdentifier"
    
    @IBOutlet weak var tablev: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nom.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablev.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = nom[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tablev.delegate = self
        // Do any additional setup after loading the view.
    }


}

