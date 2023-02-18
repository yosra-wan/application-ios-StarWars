//
//  MovieViewCell.swift
//  StarWars
//
//  Created by TekUp University 2 on 15/2/2023.
//

import UIKit

class MovieViewCell: UITableViewCell {
    
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    
    @IBOutlet weak var director: UILabel!
    
    @IBOutlet weak var producer: UILabel!
    
    @IBOutlet weak var descr: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
