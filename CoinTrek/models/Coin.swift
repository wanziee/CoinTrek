//
//  Coin.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 05/05/25.
//


// CoinGecko API
/*

 url:https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24hr'
 
 
 JSON Response:
 [
     {
         "id": "bitcoin",
         "symbol": "btc",
         "name": "Bitcoin",
         "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
         "current_price": 94091,
         "market_cap": 1868669927848,
         "market_cap_rank": 1,
         "fully_diluted_valuation": 1868669927848,
         "total_volume": 19305709915,
         "high_24h": 95742,
         "low_24h": 93806,
         "price_change_24h": -1337.6421618169843,
         "price_change_percentage_24h": -1.40173,
         "market_cap_change_24h": -26483495992.995605,
         "market_cap_change_percentage_24h": -1.39743,
         "circulating_supply": 19860396.0,
         "total_supply": 19860396.0,
         "max_supply": 21000000.0,
         "ath": 108786,
         "ath_change_percentage": -13.60585,
         "ath_date": "2025-01-20T09:11:54.494Z",
         "atl": 67.81,
         "atl_change_percentage": 138501.56512,
         "atl_date": "2013-07-06T00:00:00.000Z",
         "roi": null,
         "last_updated": "2025-05-05T11:57:37.371Z",
         "sparkline_in_7d": {
             "price": [
                 94337.99091792513,
                 94592.80364525352,
                 94719.80077278939,
                 94726.46121377338,
             ]
         }
     },
*/

import Foundation

struct Coin: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let currentHoldings: Double?
    
    func updateHoldings(amount: Double) -> Coin {
        return Coin(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double{
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int{
        return Int(marketCapRank ?? 0)
    }

}

struct SparklineIn7D: Codable {
    let price: [Double]
}
