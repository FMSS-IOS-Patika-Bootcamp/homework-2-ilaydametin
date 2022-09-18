//
//  GazeteViewController.swift
//  NewsPapers
//
//  Created by İlayda Metin on 17.09.2022.
//

import UIKit
import WebKit

class GazeteViewController: UIViewController {
    
    @IBOutlet weak var gazeteView: WKWebView!
    
    
    var detayUrl : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Url Requested: \(detayUrl!)")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let url = URL(string: detayUrl!)
        let request = URLRequest(url: url!)
        
        gazeteView.load(request)
    }
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
