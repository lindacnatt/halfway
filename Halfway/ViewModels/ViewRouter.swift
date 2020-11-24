//
//  ViewRouter.swift
//  Halfway
//
//  Created by Johannes on 2020-11-24.
//  Copyright © 2020 Halfway. All rights reserved.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .settingLocation
}

enum Page {
    case settingLocation
    case userProfile
    case createInvite
    case session
}