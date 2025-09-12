//
//  PreviewProvider.swift
//  crypto-portfolio-tracker-ios
//
//  Created by mukesh.gami on 12/09/25.
//

import Foundation
import SwiftUI

//extension PreviewProvider {
//    
//    static var dev = CoinModelPreview {
//        return CoinModelPreview.instance
//    }
//    
//}

class CoinModelPreview {
    
    static let instance = CoinModelPreview()
    init() { }
    
    let coin = CoinModel(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "<https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400>",
        currentPrice: 70187,
        marketCap: 1381651251183,
        marketCapRank: 1,
        fullyDilutedValuation: 1381651251183,
        totalVolume: 123456789,
        high24H: 70187,
        low24H: 69999,
        priceChange24H: 1234.56,
        priceChangePercentage24H: 0.1234,
        marketCapChange24H: 123456.789,
        marketCapChangePercentage24H: 0.1234,
        circulatingSupply: 19711.11,
        totalSupply: 19711.11,
        maxSupply: 21000000,
        ath: 70187,
        athChangePercentage: 0.1234,
        athDate: "2021-09-25T00:00:00Z",
        atl: 69999,
        atlChangePercentage: -0.1234,
        atlDate: "2021-09-25T00:00:00Z",
        lastUpdated: "2021-09-25T00:00:00Z",
        currentHoldings: 5)
}
