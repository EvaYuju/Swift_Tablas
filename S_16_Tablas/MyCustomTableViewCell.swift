//
//  MyCustomTableViewCell.swift
//  S_16_Tablas
//
//  Created by Eva Lopez Marquez on 20/4/23.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {
    
    // Variables
    
    let myColorYellow = "PastelYellow"
    let myColorGreen = "PastelGreen"
    
    // Outlets
    
    @IBOutlet weak var myFirstLabel: UILabel!
    @IBOutlet weak var mySecondLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    // Nib = vista - celda
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Retocar estilo
        
        myFirstLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myFirstLabel.textColor = .blue
        backgroundColor = UIColor(named: myColorGreen)
        mySecondLabel.numberOfLines = 0 // Líneas infinitas label
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
