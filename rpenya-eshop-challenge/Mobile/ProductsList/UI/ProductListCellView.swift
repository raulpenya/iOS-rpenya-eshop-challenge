//
//  ProductListCellView.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 7/3/23.
//

import SwiftUI
import Domain

struct ProductCells: View {
    let item: ProductsListItem
    var body: some View {
        switch item.view {
        case .productsList:
            ProductListCellView(item: item).listRowSeparator(.hidden)
        case .shoppingBasket:
            BasketItemCellView(item: item).listRowSeparator(.hidden)
        }
    }
}

struct ProductListCellView: View {
    var item: ProductsListItem
    
    var body: some View {
        HStack {
            VStack {
                Text(item.getTitle()).modifier(TitleTextModifier()).padding(.bottom, 6)
                if let subtitle = item.getSubtitle() {
                    Text(subtitle).modifier(SubtitleTextModifier())
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading).padding([.top, .leading, .bottom], 16).padding(.trailing, 0)
            VStack {
                Text(item.getPrice()).modifier(PriceTextModifier()).padding(.bottom, 6)
                HStack {
                    Button {
                        if let action = item.action {
                            action(item, .remove)
                        }
                    } label: {
                        Text("-").modifier(AddRemoveButtonTextModifier())
                    }.buttonStyle(BorderlessButtonStyle()).frame(width: 50, height: 50).background {
                        RoundedRectangle(cornerRadius: 12.0)
                            .fill(Color(.lightGray))
                    }
                    Text(item.getUnits()).modifier(UnitsTextModifier())
                    Button {
                        if let action = item.action {
                            action(item, .add)
                        }
                    } label: {
                        Text("+").modifier(AddRemoveButtonTextModifier())
                    }.buttonStyle(BorderlessButtonStyle()).frame(width: 50, height: 50).background {
                        RoundedRectangle(cornerRadius: 12.0)
                            .fill(Color(.lightGray))
                    }
                }.frame(maxWidth: .infinity, alignment: .trailing)
            }.frame(width: 150).padding([.top, .bottom, .trailing], 16).padding(.leading, 0)
        }.frame(maxWidth: .infinity, maxHeight: 130)
            .background {
                RoundedRectangle(cornerRadius: 12.0)
                    .fill(Color(.systemYellow))
            }
    }
}

struct ProductListCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductListCellView(item: ProductsListModelPreviewProvider.getProductsListItem1())
    }
}
