//
//  ProductListCellView.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 7/3/23.
//

import SwiftUI
import Domain

struct ProductListCellView: View {
    var item: ProductListItem
    var body: some View {
        if let item = item as? ProductsListItem {
            HStack {
                VStack {
                    Text(item.getTitle()).modifier(TitleTextModifier())
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding(.bottom, 6)
                    if let subtitle = item.getSubtitle() {
                        Text(subtitle).modifier(SubtitleTextModifier())
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding([.top, .leading, .bottom], 16).padding(.trailing, 0)
                VStack {
                    Text(item.getPrice()).modifier(PriceTextModifier())
                        .padding(.bottom, 6)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    HStack {
                        AddRemoveButton(title: "-") {
                            item.action(item, .remove)
                        }
                        Text(item.getUnits()).modifier(UnitsTextModifier()).frame(width: 30, height: 30)
                        AddRemoveButton(title: "+") {
                            item.action(item, .add)
                        }
                    }.frame(maxWidth: .infinity, alignment: .trailing)
                }.frame(width: 150).padding([.top, .bottom, .trailing], 16).padding(.leading, 0)
            }.frame(maxWidth: .infinity, maxHeight: 130)
                .background {
                    RoundedRectangle(cornerRadius: 12.0)
                        .fill(Colors.cellsBackgroundColor)
                }
        }
    }
}

struct ProductListCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductListCellView(item: ProductsListModelPreviewProvider.getProductsListItem1())
    }
}
