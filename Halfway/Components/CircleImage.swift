//
//  CircleImage.swift
//  Halfway
//
//  Created by Johannes on 2020-10-08.
//  Copyright © 2020 Halfway. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image? = Image(systemName: "person")
    var width: CGFloat?
    var height: CGFloat?
    var strokeColor: Color?
    var strokeWidth: CGFloat? = 5
    
    var body: some View {
        image?
            .resizable()
            .aspectRatio(contentMode: .fill)
            .background(ColorManager.lightBlue)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(strokeColor ?? Color.orange, lineWidth: strokeWidth ?? 5))
            .frame(width: width, height: height, alignment: .center)
            
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("user"), width: 100, height: 100, strokeColor: Color.orange)
    }
}
