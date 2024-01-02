//
//  CategoryInfoView.swift
//  Unit Converter
//
//  Created by Matthieu Déglon on 31/12/2023.
//

import SwiftUI

struct CategoryInfoView: View {
    
    @Environment(\.dismiss) var dismiss
    var category: Category
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: CategoryManager.getIcon(category: category))
                    .foregroundColor(.blue)
                Text(category.rawValue)
                    .font(.title2)
                    .bold()
            }
            .padding(.top, 75)

            Text(CategoryManager.getInfo(categoty: category))
                .padding(20)
            Spacer()
            
            Button(action: {
                dismiss()
            }, label: {
                Text("OK")
                    .font(.headline)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 280, height: 44)
                    .background(Color.blue)
                    .cornerRadius(12)
            })
                .padding(.bottom, 55)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryInfoView(category: .mass)
    }
}
