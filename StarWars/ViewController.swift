//
//  ViewController.swift
//  StarWars
//
//  Created by TekUp University 2 on 14/2/2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    // Specify date components
//    var dateCmp = DateComponents()
//    dateCmp.year = 1980
//    dateCmp.month = 7
//    dateCmp.day = 11
    
    
    var films: [Film] = []
    
    
    struct Film :Codable{
        let title : String?
        let director : String?
        let producer : String?
        let release_date : String?
        let opening_crawl : String?
        
    
    }
    
    struct Movie{
        let title : String?
        let directorName : String?
        let producerName : String?
        let releasedate : String?
        let description : String?
        
    
    }
    
//    var movies = [Movie]()
    
//    let movie1 = Movie(title: "A new Hope",directorName: "George lucas",producerName: "Gary Kurtz, Rick McCallum",releasedate: "1977/05/25",description: "It is a period of civil war. Rebel spaceships, striking  nfrom a hidden base, have won ntheir first victory against...")
//
//
//    let movie2 = Movie(title: "The Empire Strikes Back",directorName: "Irvin Kershner",producerName: "Gary Kurtz, Rick McCallum",releasedate: "1977/05/25",description: "It is a dark time for the nRebellion. Although the Death  nStar has been destroyed.....")

    
    
    
    var movies = [Movie(title: "A new Hope",directorName: "George lucas",producerName: "Gary Kurtz, Rick McCallum",releasedate: "1977/05/25",description: "It is a period of civil war. Rebel spaceships, striking  nfrom a hidden base, have won ntheir first victory against..."),Movie(title: "The Empire Strikes Back",directorName: "Irvin Kershner",producerName: "Gary Kurtz, Rick McCallum",releasedate: "1977/05/25",description: "It is a dark time for the nRebellion. Although the Death  nStar has been destroyed.....")]
    
    

    let cellSpacingHeight: CGFloat = 5
    let cellReuseIdentifier = "cellIdentifier"
    
    @IBOutlet weak var tablev: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablev.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! MovieViewCell
//        cell.title.text = movies[indexPath.row].title
//        cell.date.text = movies[indexPath.row].releasedate
//        cell.descr.text = movies[indexPath.row].description
//        cell.producer.text = movies[indexPath.row].producerName
//        cell.director.text = movies[indexPath.row].directorName

        cell.title.text = films[indexPath.row].title
        cell.date.text = films[indexPath.row].release_date
        cell.descr.text = films[indexPath.row].opening_crawl
        cell.producer.text = films[indexPath.row].producer
        cell.director.text = films[indexPath.row].director
        
        //padding
        let verticalPadding: CGFloat = 6

            let maskLayer = CALayer()
        
            maskLayer.backgroundColor = UIColor.black.cgColor
            maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
            cell.layer.mask = maskLayer
        
        
        return cell
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        tablev.delegate = self
        tablev.dataSource = self
        
        
        
        let url = URL(string: "https://swapi.dev/api/films/")!
               URLSession.shared.dataTask(with: url) { data, response, error in
                   if let data = data {
                       let decoder = JSONDecoder()
                       decoder.keyDecodingStrategy = .convertFromSnakeCase
                       print("test",try? decoder.decode([Film].self, from: data))
                       if let films = try? decoder.decode([Film].self, from: data) {
                           self.films = films
                           DispatchQueue.main.async {
                               self.tablev.reloadData()
                           }
                       }
                   }
               }.resume()

        // Do any additional setup after loading the view.
    }
    
    
 



}

