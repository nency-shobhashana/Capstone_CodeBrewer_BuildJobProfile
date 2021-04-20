//
//  Subscription.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/20/21.
//

import Foundation

struct Subscription {
    let planName: String
    let plantPrice: Int
    let isMonthly: Bool
    let planDescription : String
    let noOfLetter: Int
}

let subscription = [
    Subscription(planName: "Standard", plantPrice: 10, isMonthly: true, planDescription: "Limited cover letter\n(5 Cover letters only)", noOfLetter: 5),
    Subscription(planName: "Gold", plantPrice: 100, isMonthly: false, planDescription: "Unlimited cover letter", noOfLetter: .max)
]
