//
//  BasketItemCellView.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 10/3/23.
//

import SwiftUI

struct BasketItemCellView: View {
    var item: ProductsListItem
    
    var body: some View {
        VStack {
            HStack {
                Text(item.getTitle()).modifier(TitleTextModifier())
                Text(item.getUnits()).modifier(UnitsTextModifier())
                Text(item.getPrice()).modifier(PriceTextModifier())
            }.frame(width: .infinity).background {
                RoundedRectangle(cornerRadius: 12.0)
                    .fill(Color(.red))
            }.frame(maxWidth: .infinity, maxHeight: 80)
            if let subtitle = item.getSubtitle() {
                HStack {
                    Text(subtitle).modifier(SubtitleTextModifier())
                    Text(item.getDiscountAmount()).modifier(SubtitleTextModifier()).frame(alignment: .trailing).frame(width: .infinity).background {
                        RoundedRectangle(cornerRadius: 12.0)
                            .fill(Color(.red))
                    }
                }.frame(width: .infinity).background {
                    RoundedRectangle(cornerRadius: 12.0)
                        .fill(Color(.systemYellow))
                }
            }
        }
    }
}

struct BasketItemCellView_Previews: PreviewProvider {
    static var previews: some View {
        BasketItemCellView(item: ProductsListModelPreviewProvider.getProductsListItem1())
    }
}
