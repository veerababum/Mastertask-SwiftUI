//
//  School.swift
//  19860706-VeerababuMulugu-NYCSchools
//
//  Created by Mulugu, Veerababu on 08/10/23.
//

import Foundation

struct School: Decodable, Identifiable {
    var id: String { dbn }
    let dbn: String
    let schoolName: String
}
