//
//  CategorySelectionView.swift
//  Unit Converter
//
//  Created by Matthieu Déglon on 02/01/2024.
//

import SwiftUI

struct CategorySelectionBarView: View {
        
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
            .listStyle(SidebarListStyle())
            .navigationTitle("Category")
            CategoryDetailsView(viewModel: CategoryDetailViewModel(category: .mass))
        }
    }
}

struct CategorySelectionSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelectionBarView()
    }
}
