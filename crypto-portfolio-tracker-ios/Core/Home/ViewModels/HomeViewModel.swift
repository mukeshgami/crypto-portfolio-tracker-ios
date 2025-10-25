//
//  HomeViewModel.swift
//  crypto-portfolio-tracker-ios
//
//  Created by mukesh.gami on 13/09/25.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    var dataService = CoinDataService()
    var cancellables = Set<AnyCancellable>()
    
    init() {
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        //            self.allCoins.append(CoinModelPreview.instance.coin)
        //            self.portfolioCoins.append(CoinModelPreview.instance.coin)
        //        }
        addSubscriber()
    }
    
    func addSubscriber() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoin) in
                self?.allCoins = returnedCoin
            }
            .store(in: &cancellables)
    }
    
}
