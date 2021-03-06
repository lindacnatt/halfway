//
//  SplashView.swift
//  Halfway
//
//  Created by Johannes Loor on 2020-12-18.
//  Copyright © 2020 Halfway. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        HStack{
            Image("Halfway-Full-Logo").resizable().aspectRatio(contentMode: .fit).padding(.leading, 5)
        }.padding(.horizontal, 60)
            .onAppear(){
                withAnimation(Animation.linear.delay(2)){
                    viewRouter.currentPage = .userProfile
                }
            }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
