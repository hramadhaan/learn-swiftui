//
//  AddCoffeeOrderView.swift
//  Coffee Ordering
//
//  Created by Hanif Ramadhan Abdillah on 15/07/2021.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @Binding var isPresented: Bool
    
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()

    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Information")
                                .font(.body)) {
                        TextField("Enter Name",text: self.$addCoffeeOrderVM.name)
                    }
                    Section(header: Text("Select Coffee")
                                .font(.body)) {
                        ForEach(addCoffeeOrderVM.coffeeList, id: \.name) {coffee in
                            
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
                            
                        }
                    }
                    
                    Section(
                        header: Text("Select Coffee").font(.body),
                        footer: OrderTotalView(total: self.addCoffeeOrderVM.total)
                    ) {
                        Picker("", selection: self.$addCoffeeOrderVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                HStack {
                    Button("Place Order") {
                        self.addCoffeeOrderVM.placeOrder()
                        self.isPresented = false
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 100)
                    .foregroundColor(.white)
                    .background(Color.green)
                    
                }
                
            }
            .navigationBarTitle("Add Order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {
    var coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack(spacing: 5) {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            Text(coffee.name)
                .padding(.leading, 20)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark" : "").padding()
        }
        .onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
