//
//  ConvertViewController.swift
//  CryptoConverter
//
//  Created by Мак on 11/9/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import UIKit

class ConvertViewController: UIViewController {
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    
    @IBAction func textActionOne(_ sender: Any) {
        let amount = Double(text1.text!)
      //  text1.text = Converter.convertQuote(amount: amount)
    }
    @IBAction func textActionTwo(_ sender: Any) {
    }
    
    @IBAction func pushOne(_ sender: Any) {
        let ns = storyboard?.instantiateViewController(withIdentifier: "selectedCurrencyNSID") as! SelectTableViewController
        ns.quoteCurrency = .from
        
                  present(ns, animated: true, completion: nil)

    }
    @IBAction func pushTwo(_ sender: Any) {
        let ns = storyboard?.instantiateViewController(withIdentifier: "selectedCurrencyNSID") as! SelectTableViewController
        ns.quoteCurrency = .to
        
                  present(ns, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
 
}
