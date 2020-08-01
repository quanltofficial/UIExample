//
//  ContentView.swift
//  UIExample
//
//  Created by Quan Le Trong on 2/16/20.
//  Copyright © 2020 Quan Le Trong. All rights reserved.
//

import SwiftUI
struct ItemRow: View {
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    var item: MenuItem
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(Color.red, lineWidth: 2))
            VStack(alignment: .leading, spacing: 1) {
                NavigationLink(destination: ItemDetail(item: item)) {
                    Text(item.name)
                }
                Text(String("VND \(item.price)"))
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) { res in
                Text(res)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(Self.colors[res, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}
struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name).font(.headline)){
                        ForEach(section.items) { item in
                            ItemRow(item: item)
                        }
                    }
                }
            }
            .navigationBarTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
