//
//  TableViewCell.swift
//  NewsPapers
//
//  Created by İlayda Metin on 17.09.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var gazeteResim: UIImageView!
    
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
