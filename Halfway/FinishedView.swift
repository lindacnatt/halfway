//
//  FinishedView.swift
//  Halfway
//
//  Created by Linda Cnattingius on 2020-10-09.
//  Copyright © 2020 Halfway. All rights reserved.
//

import SwiftUI

struct FinishedView: View {
    @Binding var showModal: Bool
    var body: some View {
        VStack() {
            Spacer()
            Text("Huzzah!")
                .font(.largeTitle)
            Text("Looks like you've met...")
                .padding()
            Spacer()
            Spacer()
            Button(action: {}) {
                Text("Yes! End session")
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(.infinity)
            .padding()
            Button(action: {self.showModal.toggle()}) {
                Text("No, we haven't met yet")
            }
            Spacer()
        }.foregroundColor(.orange)
            .font(.headline)
    }
}

struct FinishedView_Previews: PreviewProvider {
    static var previews: some View {
        FinishedView(showModal: .constant(true))
    }
}
