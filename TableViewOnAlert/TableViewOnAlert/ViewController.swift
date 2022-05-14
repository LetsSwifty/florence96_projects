//
//  ViewController.swift
//  TableViewOnAlert
//
//  Created by Yejin Hong on 2022/05/09.
//

import UIKit

class ViewController: UIViewController {

    var dic: NSDictionary?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        if let path = Bundle.main.path(forResource: "CountryCodeList", ofType: "plist")  {
            print("path = \(path)")
            print("dic = \(NSDictionary(contentsOfFile: path))")
        }
    }

    @IBAction func button(_ sender: Any) {
        let alert = UIAlertController(title: "제목", message: nil, preferredStyle: .alert)
        let view = TableView()
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.setValue(view, forKey: "contentViewController")
        view.delegate = self
        self.present(alert, animated: true)
    }
    
}
