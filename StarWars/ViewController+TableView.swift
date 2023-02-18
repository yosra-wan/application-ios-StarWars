//
//  ViewController+TableView.swift
//  StarWars
//
//  Created by TekUp University 2 on 18/2/2023.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    //MARK: -UITV DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filmList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tablev.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! MovieViewCell

    
        cell.title.text = filmList[indexPath.row].title
        cell.date.text = filmList[indexPath.row].date
        cell.descr.text = filmList[indexPath.row].description
        cell.producer.text = filmList[indexPath.row].producer
        cell.director.text = filmList[indexPath.row].director
          
        return cell
    }
    
    //MARK: -UITV Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
             performSegue(withIdentifier: "detailsSg", sender: self)
    }
}
