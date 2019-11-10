//
//  QuoteProvider.swift
//  CryptoConverter
//
//  Created by Мак on 11/2/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import Foundation
import UIKit


class QuoteProvider {
    var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 300, target: self, selector: #selector(updateTimer), userInfo: self, repeats: true)
    }
    func generateQuotes() -> [Quote] {
      
        let symbols = ["BTC","ETH","LTC","BNB","XLM","XMR"]
        let names = ["Bitcoin","Etherium","Litecoin","Binance Coin","Stellar","Monero"]
        var images = [UIImage]()
        images = [UIImage(named: "btc.png")!,UIImage(named: "ETH.png")!, UIImage(named: "LTC.png")!,
        UIImage(named: "BNB.png")!, UIImage(named: "XLM.png")!, UIImage(named: "XMR.png")!
        ]
        var result: [Quote] = []
        for i in 1...5 {
            let quote = Quote(id: "Quote#\(i)", name: names[i], symbol: symbols[i], rank: "\(i + 1)", price_usd: Double.random(in: 0...10000), price_btc: Double.random(in: 0...10000), h_volume_usd: Double.random(in: 0...10000), market_cap_usd: Double.random(in: 0...10000), available_supply: Double.random(in: 0...10000), total_supply: Double.random(in: 0...10000), max_supply: Int.random(in: 10000...100000), percent_change_1h: Double.random(in: 0...10000), percent_change_24h: Double.random(in: 0...10000), percent_change_7d: Double.random(in: 0...10000), last_updated: NSDate(timeIntervalSince1970: 1572686856), image: images[i])
            result.append(quote)
           
            
        }
        result.insert(Quote(id: "bitcoin", name: "Bitcoin", symbol: "BTC", rank: "1", price_usd: 10201.0994019, price_btc: 1.0, h_volume_usd: 15754522367.5, market_cap_usd: 182598781597, available_supply: 17899912.0, total_supply: 18026187.0, max_supply: Int(21000000.0), percent_change_1h: -0.12, percent_change_24h: -1.33, percent_change_7d: 1.65, last_updated: NSDate(timeIntervalSince1970: 1566924809), image: UIImage(named: "btc.png")!), at: 0)
        print(result)
        
        return result
    }
    
    @objc func updateTimer() {
        NotificationCenter.default.post(name: .init("tableDataSource") , object: nil)
    }
}

