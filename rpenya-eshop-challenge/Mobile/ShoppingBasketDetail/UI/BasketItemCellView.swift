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
                    Text(item.getTitle()).modifier(TitleTextModifier())
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding([.top, .leading, .bottom], 10.0)
                    Text(item.getPrice()+" x"+item.getUnits()).modifier(UnitsTextModifier())
                    Text(item.getAmount()).modifier(PriceTextModifier())
                        .padding([.top, .bottom, .trailing], 10.0)
                        .frame(alignment: .trailing)
                }
                .frame(maxWidth: .infinity)
                if let subtitle = item.getSubtitle(), let amount =  item.getDiscountAmount() {
                    Line().stroke(style: StrokeStyle(lineWidth: 1, dash: [5])) .frame(height: 1)
                    HStack {
                        Text(subtitle).modifier(SubtitleTextModifier())
                            .padding([.top, .leading, .bottom], 10.0)
                        Text(amount).modifier(UnitsTextModifier())
                            .padding([.top, .bottom, .trailing], 10.0)
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

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
