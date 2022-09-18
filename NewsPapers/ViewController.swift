//
//  ViewController.swift
//  NewsPapers
//
//  Created by İlayda Metin on 17.09.2022.
//

import UIKit
protocol DetayVCToViewControllerDelegate: AnyObject {
    func veriGonder(mesaj:String)
}

class ViewController: UIViewController {
    weak var delegate: DetayVCToViewControllerDelegate?
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var gazete = [Gazeteler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        let g1  = Gazeteler(gazeteId: 1, gazeteImage: "milliyet", gazeteLbl: "Milliyet Gazetesi", gazeteDetayLbl: "Bir dizi ziyaretlerde bulunmak üzere Edirne'ye gelen İçişleri Bakanı Süleyman Soylu, Kapıkule Sınır Kapısı'ndaki temaslarının ardından kentteki STK'ların desteği ile Pakistan'daki selzedeler için hazırlanan gıda malzemesi yüklü yardım TIR'ını uğurladı.",gazeteUrl: "https://www.milliyet.com.tr/",title: "HABER DETAY")
        
        let g2  = Gazeteler(gazeteId: 2, gazeteImage: "hurriyet", gazeteLbl: "Hürriyet Gazetesi", gazeteDetayLbl: "Rusya ile Ukrayna arasında devam eden savaş dolayısıyla büyüyen enerji krizi derinleşiyor. Avrupa ülkeleri kışın yaklaşması ile aldığı önlemleri artırırken Almanya'da vatandaşlar faturalarını ödeyememekten korkuyor.",gazeteUrl: "https://www.hurriyet.com.tr",title: "HABER DETAY")
        
        let g3  = Gazeteler(gazeteId: 3, gazeteImage: "aksam", gazeteLbl: "Akşam Gazetesi", gazeteDetayLbl: "Başkan Erdoğan'dan heyecanlandıran sosyal konut açıklaması! Arsa sorunumuz yok, yeni bir hamle daha yapabiliriz.",gazeteUrl: "https://www.aksam.com.tr",title: "HABER DETAY")
        
        let g4  = Gazeteler(gazeteId: 4, gazeteImage: "evrensel", gazeteLbl: "Evrensel Gazetesi", gazeteDetayLbl: "16. Karaburun Bilim Kongresi sürüyor. Öğleden sonraki oturumlarından biri olan “Akademinin Tarihsel-Siyasal Sorumluluğu” konusu tartışıldı.",gazeteUrl: "https://www.evrensel.net",title: "HABER DETAY")
        
        let g5  = Gazeteler(gazeteId: 5, gazeteImage: "haberturk", gazeteLbl: "Habertürk Gazetesi", gazeteDetayLbl: "Spor Toto Süper Lig ekibi Atakaş Hataysporun teknik direktörü Serkan Özbalta görevinden istifa etti.",gazeteUrl: "https://www.haberturk.com",title: "HABER DETAY")
        
        let g6  = Gazeteler(gazeteId: 6, gazeteImage: "posta", gazeteLbl: "Posta Gazetesi", gazeteDetayLbl: "Spor Toto Süper Lig ekibi Atakaş Hataysporun teknik direktörü Serkan Özbalta görevinden istifa etti.",gazeteUrl: "https://www.posta.com.tr",title: "HABER DETAY")
        
        
        let g7  = Gazeteler(gazeteId: 7, gazeteImage: "sabah", gazeteLbl: "Sabah Gazetesi", gazeteDetayLbl: "Eskişehir'in Han ilçesine bağlı Akhisar Mahallesi'ne yakın ormanda saat 13.00 sıralarında orman yangını çıktı.",gazeteUrl: "https://www.sabah.com.tr",title: "HABER DETAY")
        
        
        let g8  = Gazeteler(gazeteId: 8, gazeteImage: "star", gazeteLbl: "Star Gazetesi", gazeteDetayLbl: "Ülkesindeki petrol sahalarına dikkat çekti! Guveyl: Türkiye artık küresel dengeye sahip bir aşamaya geçti.",gazeteUrl: "https://www.star.com.tr",title: "HABER DETAY")
    
        gazete.append(g1)
        gazete.append(g2)
        gazete.append(g3)
        gazete.append(g4)
        gazete.append(g5)
        gazete.append(g6)
        gazete.append(g7)
        gazete.append(g8)
        
    }
 }

 extension ViewController: UITableViewDelegate,UITableViewDataSource {
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         let gazeteListe = gazete[indexPath.row]
         let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
         
         cell.gazeteResim?.image = UIImage(named: gazeteListe.gazeteImage!)
         cell.lbl?.text = gazeteListe.gazeteLbl!
         
         return cell
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return gazete.count
         
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        
         let vc = self.storyboard?.instantiateViewController(withIdentifier: "toDetay") as! DetayViewController
         vc.modalPresentationStyle = .fullScreen
         tableView.deselectRow(at: indexPath, animated: true)
         vc.gazete = gazete[indexPath.row]
         
         self.navigationController?.pushViewController(vc, animated: true)
         
         }
     }

 extension ViewController: UISearchBarDelegate {
     func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         print(searchText)
         
     }
 }

