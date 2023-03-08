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
    
    @ViewBuilder
    var body: some View {
        HStack {
            VStack {
                Text(item.getTitle()).modifier(TitleTextModifier())
                if let subtitle = item.getSubtitle() {
                    Text(subtitle).modifier(SubtitleTextModifier())
                }
            }.padding(.leading, 16)
            HStack {
                Button {
                    print("Button -")
                } label: {
                    Text("-").modifier(AddRemoveButtonTextModifier())
                }.buttonStyle(BorderlessButtonStyle()).padding(.horizontal, 16).frame(width: 50, height: 50).background {
                    RoundedRectangle(cornerRadius: 12.0)
                        .fill(Color(.lightGray))
                }
                Text(item.getUnits()).modifier(UnitsTextModifier())
                Button {
                    print("Button +")
                } label: {
                    Text("+").modifier(AddRemoveButtonTextModifier())
                }.buttonStyle(BorderlessButtonStyle()).padding(.horizontal, 16).frame(width: 50, height: 50).background {
                    RoundedRectangle(cornerRadius: 12.0)
                        .fill(Color(.lightGray))
                }
            }.frame(maxWidth: .infinity, alignment: .trailing).padding(.trailing, 16)
        }.frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 70)
            .background {
                RoundedRectangle(cornerRadius: 12.0)
                    .fill(Color(.systemYellow))
            }
    }
}

struct ProductListCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductListCellView(item: ProductsListModelPreviewProvider.getProductListItem1())
    }
}
