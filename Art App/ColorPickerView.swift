//
//  ColorPickerView.swift
//  Art App
//
//  Created by Quint DeNiro Fain on 9/11/22.
//

import SwiftUI

struct ColorPickerView: View {
    
    let colors = [Color.red, Color.orange, Color.green, Color.blue, Color.purple]
    @Binding var selectedColor: Color
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Image(systemName: selectedColor == color ?
                      Constants.Icons.recordCircleFill : Constants.Icons.circleFill)
                      .foregroundColor(color)
                      .font(.system(size:16)).clipShape(Circle()).onTapGesture {
                          selectedColor = color
                      }
            }
        }
    }
}
