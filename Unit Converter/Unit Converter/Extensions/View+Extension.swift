//
//  View+Extension.swift
//  Unit Converter
//
//  Created by Matthieu Déglon on 30/12/2023.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
