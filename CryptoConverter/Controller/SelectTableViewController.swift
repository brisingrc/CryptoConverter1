//
//  SelectTableViewController.swift
//  CryptoConverter
//
//  Created by Мак on 11/10/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import UIKit

protocol array {
    func dataTransfer(array:Quote)
}

enum QuotesSelected {
    case from
    case to
}
class SelectTableViewController: UITableViewController {
    
    var btnSetImageDelegate: ButtonImageDelegate?
    
    var quoteCurrency: QuotesSelected = .from
    var quoteProvider: QuoteProvider?
    var fromOne: [Quote] = []
    //var from: QuoteProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       quoteProvider = QuoteProvider()
              NotificationCenter.default.addObserver(self, selector: #selector(generateTableContent), name: .init("tableDataSource"), object: nil)
              generateTableContent()
             
    }
    
       @objc func generateTableContent() {
        if let quoteProvider = quoteProvider {
            fromOne = quoteProvider.generateQuotes()
          tableView.reloadData()
        }
        

        

    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fromOne.count
    }

  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 72.0
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! SelectTableViewCell

         let quote = fromOne[indexPath.row]
         
         cell.imageView?.image = quote.image
         
         
         return cell
     }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//           let selectedCurrency: Currency = Model.shared.currencies[indexPath.row]
        print("didSelectMethod was called")
        let selectedQuote: Quote = fromOne[indexPath.row]
        
        print(quoteCurrency)
                if quoteCurrency == .from {
                    btnSetImageDelegate?.setBtnImage(image: selectedQuote.image)
                    btnSetImageDelegate?.baseQuote = selectedQuote
            
        }
        if quoteCurrency == .to {
                  btnSetImageDelegate?.setSecondImage(image: selectedQuote.image)
            btnSetImageDelegate?.quote = selectedQuote
              }

           dismiss(animated: true, completion: nil)
       }
}
