//
//  CheckoutButtonView.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 7/3/23.
//

import SwiftUI

struct CheckoutButtonView: View {
    
    var action: (() -> Void)
    
    var body: some View {
        HStack {
            Button("Proceed checkout") {
                print("Button -")
                action()
            }.frame(height: 70).frame(minWidth: 0, maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 12.0)
                        .fill(Color(.systemOrange))
                }
        }
        .padding(.all, 20).frame(maxWidth: .infinity, alignment: .center).background(Color.white // any non-transparent background
            
//            .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: -5)//.mask(Rectangle().padding(.top, -20))
          )
    }
}

struct CheckoutButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutButtonView(action: {
            print("CheckoutButtonView")
        })
    }
}
