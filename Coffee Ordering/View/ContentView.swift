//
//  ContentView.swift
//  Coffee Ordering
//
//  Created by Hanif Ramadhan Abdillah on 15/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    @State private var showModal: Bool = false
    
    private func reloadOrders() {
        self.orderListVM.fetchOrders()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModal = true
    }
    
    var body: some View {
        NavigationView {
            OrderListView(orders: self.orderListVM.orders)
                .navigationBarTitle("Coffee Orders")
                .navigationBarItems(leading: Button(action: reloadOrders) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.black)
                }, trailing: Button(action: showAddCoffeeOrderView) {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                })
                .sheet(isPresented: self.$showModal) {
                    AddCoffeeOrderView(isPresented: self.$showModal)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
