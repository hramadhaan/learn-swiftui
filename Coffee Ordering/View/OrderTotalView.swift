//
//  OrderTotalView.swift
//  Coffee Ordering
//
//  Created by Hanif Ramadhan Abdillah on 16/07/2021.
//

import SwiftUI

struct OrderTotalView: View {
    
    let total: Double
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(String(format: "$%.2f", self.total))
                .font(.title)
                .foregroundColor(.green)
            Spacer()
        }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 12.2)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
