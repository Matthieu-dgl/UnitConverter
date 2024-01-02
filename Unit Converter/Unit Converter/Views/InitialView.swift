//
//  InitialView.swift
//  Unit Converter
//
//  Created by Matthieu Déglon on 29/12/2023.
//

import SwiftUI

struct InitialView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        if horizontalSizeClass == .compact {
            CategorySelectionView()
        } else {
            CategorySelectionBarView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
