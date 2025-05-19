//
//  XMarkButton.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 18/05/25.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }, label: {Image(systemName: "xmark")
                .foregroundStyle(Color.theme.text)
                .font(.headline)
            
        })
    }
}

#Preview {
    XMarkButton()
}
