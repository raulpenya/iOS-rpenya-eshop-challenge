//
//  ErrorView.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 11/3/23.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    let action: (() -> Void)
    
    var body: some View {
        VStack {
            Text("Oops!").modifier(TitleTextModifier()).padding(.top, 16)
            Text("an error ocurred:").modifier(UnitsTextModifier())
            Text(errorMessage).multilineTextAlignment(.center)
                .frame(width: 300)
            Line().stroke(style: StrokeStyle(lineWidth: 1, dash: [1])) .frame(height: 1)
            Button(action: action) {
                Text("Refresh").font(.system(.title2, weight: .semibold))
            }.padding([.top, .bottom], 10)
        }.frame(width: 320).background {
            RoundedRectangle(cornerRadius: 12.0)
                .fill(Colors.cellsBackgroundColor)
                .shadow(color: Colors.shadowColor, radius: 5)
        }
    }
}

struct ErrorAlert_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorMessage: "fdsafhidsfldsahfdlsaf fdksaf dslasfhdsajkfhdsajkfdsafh") {
            print("refresh")
        }
    }
}
