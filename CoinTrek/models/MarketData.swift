//
//  MarketData.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 17/05/25.
//

import Foundation


//JSON Data
/*
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
 "date": {
     "active_cryptocurrencies": 13690,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 1046,
     "total_market_cap": {
       "btc": 39003738.0847159,
       "eth": 803832137.207531,
       "ltc": 26721173267.5358,
       "bch": 3981159931.51342,
       "bnb": 4670513150.58714,
       "eos": 2641998753398.41,
       "xrp": 4567762968374.06,
       "xlm": 21049307801356.5,
       "link": 153517938957.199,
       "dot": 315120726481.166,
       "yfi": 324671967.610845,
       "usd": 2721226850772.63,
       "aed": 9993705609462.48,
       "ars": 2341775032921960,
       "aud": 4135040261091.56,
       "bdt": 298245137607204,
       "bhd": 1024582727718.66,
       "bmd": 2721226850772.63,
       "brl": 13785980136430.7,
       "cad": 3698283351542.55,
       "chf": 2454228235855.38,
       "clp": 2557393918759370,
       "cny": 19681001075528,
       "czk": 63568675602103.7,
       "dkk": 18728571677757.6,
       "eur": 2508293570926.52,
       "gbp": 2153208842849.76,
       "gel": 7292887960070.66,
       "hkd": 21307070180207.2,
       "huf": 979811947048335,
       "idr": 43234171898362830,
       "ils": 10201683535213.3,
       "inr": 226670207147326,
       "jpy": 412551596711386,
       "krw": 3677112086909555,
       "kwd": 836219405108.176,
       "lkr": 812593109477406,
       "mmk": 5706555839881336,
       "mxn": 44773978111872.4,
       "myr": 12919024474043.1,
       "ngn": 3522998071018357,
       "nok": 29197131372679.9,
       "nzd": 4524820631515.69,
       "php": 153994230206450,
       "pkr": 755251422720381,
       "pln": 10747177948492.4,
       "rub": 251732363568359,
       "sar": 10207395390373.1,
       "sek": 29054498267296.6,
       "sgd": 3672056167154.8,
       "thb": 99649147572586.4,
       "try": 87273829665781.3,
       "twd": 87422678053291.6,
       "uah": 105534042826572,
       "vef": 272476444567.864,
       "vnd": 67937284004880150,
       "zar": 50878778428896,
       "xdr": 2052425485204.54,
       "xag": 99002369095.9216,
       "xau": 1167950564.35161,
       "bits": 39003738084715.9,
       "sats": 3900373808471590
     },
 }
 */

struct GlobalData: Codable {
    let data: MarketData?
}

struct MarketData: Codable {
    let totalMarketCap,totalVolume,marketCapPercentage: [String: Double]
    let marketCapChangePercentage24hUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24hUsd = "market_cap_change_percentage_24h_usd"
    }

    
    var marketCap: String{
        if let item = totalMarketCap.first(where: {$0.key == "usd"}){
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String{
        if let item = totalVolume.first(where: {$0.key == "usd"}){
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: {$0.key == "btc"}){
            return item.value.asPercentString()
        }
        return ""
    }
}
