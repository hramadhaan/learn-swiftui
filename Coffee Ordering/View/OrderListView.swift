//
//  OrderListView.swift
//  Coffee Ordering
//
//  Created by Hanif Ramadhan Abdillah on 15/07/2021.
//

import SwiftUI

struct OrderListView: View {
    
    let orders: [OrderViewModel]
    
    init (orders: [OrderViewModel]) {
        self.orders = orders
    }
    
    var body: some View {
        List {
            ForEach(self.orders, id: \.id) {order in
                HStack(alignment: .center) {
                    Image(order.coffeeName)
                        .resizable().frame(width: 100, height: 100)
                        .cornerRadius(16)
                    VStack(alignment: .leading) {
                        Text(order.name)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .padding([.leading, .bottom], 10)
                        HStack {
                            Text(order.coffeeName)
                            Text(order.size)
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [OrderViewModel(order: Order(name: "Mary", size: "Medium", coffeeName: "Regular", total: 3.0))])
    }
}
#endif
