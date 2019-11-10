//
//  FirstTableViewController.swift
//  CryptoConverter
//
//  Created by Мак on 11/2/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import UIKit
import NotificationCenter

class FirstTableViewController: UITableViewController {
    var quoteProvider: QuoteProvider?
    
    @IBAction func refAction(_ sender: Any) {
        generateTableContent()
    }
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
    var quotes: [Quote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteProvider = QuoteProvider()
        NotificationCenter.default.addObserver(self, selector: #selector(generateTableContent), name: .init("tableDataSource"), object: nil)
        generateTableContent()
       
    }
    
    @objc func generateTableContent() {
        if let quoteProvider = quoteProvider {
            quotes = quoteProvider.generateQuotes()
            tableView.reloadData()
        }
        
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCellIdentifier", for: indexPath) as! QuoteCell

        let quote = quotes[indexPath.row]
        cell.nameLabel.text = quote.name
        //cell.priceLabel.text = "\(quote.price_usd) $"
        cell.priceLabel.text = String(format: "%.3f", quote.price_usd)
        cell.symbolLabel.text = quote.symbol
        
        cell.imageView?.image = quote.image
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
           guard segue.identifier == "toDetail" else {
               return
           }
           if let quoteDetail = segue.destination as? DetailViewController {
               if let cell = sender as? QuoteCell {
                   if let indexPath = tableView.indexPath(for: cell) {
                       let quote = quotes[indexPath.row]
                       quoteDetail.quote = quote
                   }
                    //вытаскиваем конкретную котировку (модель) для ячейки
               }
           }
       }
    

    
}
