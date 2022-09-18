//
//  DetayViewController.swift
//  NewsPapers
//
//  Created by İlayda Metin on 17.09.2022.
//

import UIKit
import WebKit

class DetayViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var gazeteDetayLbl: UILabel!
    
    
    var gazete : Gazeteler?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        navigationItem.title = gazete?.title

    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let destination = segue.destination as? GazeteViewController else {
            return
        }
        
        destination.detayUrl = gazete?.gazeteUrl
   
    }
    
    func setUI() {
        imageView.image = UIImage(named: (gazete?.gazeteImage)!)
        lbl.text = gazete?.gazeteLbl
        gazeteDetayLbl.text = gazete?.gazeteDetayLbl
        
    }
}

    

