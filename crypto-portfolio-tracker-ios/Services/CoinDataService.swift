//
//  CoinDataService.swift
//  crypto-portfolio-tracker-ios
//
//  Created by mukesh.gami on 14/09/25.
//

import Foundation
import Combine

/*
 curl --request GET \
   --url 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin&names=Bitcoin&symbols=btc&category=layer-1&price_change_percentage=24h&order=market_cap_desc&per_page=10&page=1' \
   --header 'x-cg-demo-api-key: CG-zVY21LC71aYQh2Wx3PrcJhxK'
 
 */

class CoinDataService {
    @Published var allCoins: [CoinModel] = []
    
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoin()
    }
    
    private func getCoin() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin&names=Bitcoin&symbols=btc&category=layer-1&price_change_percentage=24h&order=market_cap_desc&per_page=10&page=1") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("CG-zVY21LC71aYQh2Wx3PrcJhxK", forHTTPHeaderField: "x-cg-demo-api-key")
        
        coinSubscription = URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse,
                      200..<300 ~= response.statusCode else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                case .finished:
                    break
                }
            } receiveValue: { [weak self] (returnedConins) in
                self?.allCoins = returnedConins
            }
    }
}

