//
//  BasketItemCellView.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 10/3/23.
//

import SwiftUI

struct BasketItemCellView: View {
    var item: ProductListItem
    
    var body: some View {
        if let item = item as? ShoppingBasketListItem {
            VStack(spacing: 0) {
                HStack {
                    Text(item.getTitle()).font(.system(.title, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .lineLimit(2)
                        .padding([.top, .leading, .bottom], 10.0)
                        .minimumScaleFactor(0.01)
                    Text(item.getPrice()).font(.system(.title3, weight: .semibold))
                        .minimumScaleFactor(0.01)
                    Text("x").font(.system(.title3, weight: .semibold))
                        .minimumScaleFactor(0.01)
                    Text(item.getUnits()).font(.system(.title3, weight: .semibold))
                        .minimumScaleFactor(0.01)
                    Text(item.getAmount()).padding([.top, .bottom, .trailing], 10.0).font(.system(.title, weight: .bold))
                        .frame(alignment: .trailing)
                        .minimumScaleFactor(0.01)
                }
                .frame(maxWidth: .infinity)
                if let subtitle = item.getSubtitle() {
                    HStack {
                        Text(subtitle).modifier(SubtitleTextModifier()).padding([.top, .leading, .bottom], 10.0)
                        Text(item.getDiscountAmount()).font(.system(.title3, weight: .semibold)).padding([.top, .bottom, .trailing], 10.0)
                    }
                }
            }.background {
                RoundedRectangle(cornerRadius: 12.0)
                    .fill(Colors.cellsBackgroundColor)
            }
        }
    }
}

struct BasketItemCellView_Previews: PreviewProvider {
    static var previews: some View {
        BasketItemCellView(item: ProductsListModelPreviewProvider.getProductsListItem1())
    }
}
