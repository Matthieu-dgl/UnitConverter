//
//  CategoryDetailsView.swift
//  Unit Converter
//
//  Created by Matthieu Déglon on 30/12/2023.
//

import SwiftUI

struct CategoryDetailsView: View {
    
    @StateObject var viewModel: CategoryDetailViewModel
    
    var body: some View {
        Form {
            Section {
                Text("Select units")
                    .font(.headline)
                Picker("Convert", selection: $viewModel.firstUnit) {
                    ForEach(0 ..< viewModel.units.count, id: \.self) { Text("\(viewModel.units[$0].symbol)") }
                }
                Picker("To", selection: $viewModel.secondUnit) {
                    ForEach(0 ..< viewModel.units.count, id: \.self) { Text("\(viewModel.units[$0].symbol)") }
                }
            }
            
            Section {
                Text("Value")
                    .font(.headline)
                TextField("Enter", text: $viewModel.firstUnitValue)
                    .keyboardType(.decimalPad)
            }
            Section {
                Text("Result")
                    .font(.headline)
                Text("\(viewModel.convert(value: viewModel.firstUnitValue, unit1: viewModel.units[viewModel.firstUnit], unit2: viewModel.units[viewModel.secondUnit]), specifier: "%g")")
            }
        }
        .sheet(isPresented: $viewModel.showingInfo, content: {
            CategoryInfoView(category: viewModel.category)
        })
        .navigationTitle(viewModel.category.rawValue)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    hideKeyboard()
                }, label: {
                    Image(systemName: "keyboard.chevron.compact.down")
                })
                Button(action: {
                    viewModel.showingInfo = true
                }, label: {
                    Image(systemName: "info.circle")
                })
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailsView(viewModel: CategoryDetailViewModel(category: .mass))
    }
}
