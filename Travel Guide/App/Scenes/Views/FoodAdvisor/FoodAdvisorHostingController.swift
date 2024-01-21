//
//  FoodAdvisorHostingController.swift
//  Travel Guide
//
//  Created by salome on 20.01.24.
//

import UIKit
import SwiftUI

class FoodAdvisorHostingController: UIHostingController<FoodAdvisorView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: FoodAdvisorView())
    }
}
