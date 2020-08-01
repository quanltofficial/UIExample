//
//  ItemDetail.swift
//  UIExample
//
//  Created by Quan Le Trong on 2/16/20.
//  Copyright © 2020 Quan Le Trong. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    var item: MenuItem
    @EnvironmentObject var order: Order
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                .padding(4)
                .background(Color.black)
                .font(.caption)
                .foregroundColor(.white)
                .offset(x: -30, y: -5)
            }
            Text(item.description)
            .padding()
            Spacer()
            Button("Order This") {
                self.order.add(item: self.item)
            }.font(.headline)
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}
struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()

    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
