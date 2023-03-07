//
//  ProductListCell.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 7/3/23.
//

import SwiftUI
import Domain

struct ProductListCell: View {
    
    var item: Product
    
    @ViewBuilder
    var body: some View {
        HStack {
            VStack {
                if let promo = item.promotion {
                    Text(item.name)
                        .font(.system(.title3, weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading)
                    Text(promo.name)
                        .font(.system(.subheadline, weight: .regular)).frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 6)
                    
                } else {
                    Text(item.name)
                        .font(.system(.title3, weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading)
                }
            }.padding(.horizontal, 16)
            HStack {
                Button {
                    print("Button -")
                } label: {
                    Text("-")
                }.buttonStyle(BorderlessButtonStyle()).padding(.horizontal, 16).frame(width: 50, height: 70).background {
                    RoundedRectangle(cornerRadius: 12.0)
                        .fill(Color(.lightGray))
                }
                Text("0")
                    .font(.system(.title3, weight: .semibold)).padding(.horizontal, 16)
                Button {
                    print("Button +")
                } label: {
                    Text("+")
                }.buttonStyle(BorderlessButtonStyle()).padding(.horizontal, 16).frame(width: 50, height: 70).background {
                    RoundedRectangle(cornerRadius: 12.0)
                        .fill(Color(.lightGray))
                }
            }.frame(maxWidth: .infinity, alignment: .trailing)
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
        let promotion = Promotion(productCode: "TSHIRT", name: "Pay 1 get 2", type: .percentage, unitsNeeded: 2, discount: 0.5)
        let product = Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 20, promotion: promotion)
        ProductListCell(item: product)
    }
}
