//
//  CoinRowView.swift
//  crypto-portfolio-tracker-ios
//
//  Created by mukesh.gami on 12/09/25.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            if showHoldingColumn {
                centerColumn
            }
            rightColumn
            
        }
        .font(.subheadline)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinRowView(coin: CoinModelPreview.instance.coin, showHoldingColumn: true)
        .previewLayout(.sizeThatFits)
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(width: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .padding(.leading, 6)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith6DecimalPlaces())
                .bold()
            Text(coin.currentHoldings?.asNumberString() ?? "0.00")
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6DecimalPlaces())
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChange24H?.asPercentageString() ?? "0.00%")
                .foregroundColor(
                    coin.priceChange24H ?? 0 >= 0 ? Color.theme.green : Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width * 0.3, alignment: .trailing)
    }
}
