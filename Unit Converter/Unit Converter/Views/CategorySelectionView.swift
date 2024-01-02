//
//  CategorySelectionView.swift
//  Unit Converter
//
//  Created by Matthieu Déglon on 30/12/2023.
//

import SwiftUI

struct CategorySelectionView: View {
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Category.allCases, id: \.self) { category in
                    NavigationLink {
                        CategoryDetailsView(viewModel: CategoryDetailViewModel(category: category))
                    } label: {
                        Label(category.rawValue, systemImage: CategoryManager.getIcon(category: category))
                    }
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelectionView()
    }
}
