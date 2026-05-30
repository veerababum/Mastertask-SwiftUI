//
//  SchoolDetailsViewmodel.swift
//  MasterTaskCode
//
//  Created by Veerababu Mulugu on 10/12/23.
//

import Foundation

@MainActor
final class SchoolDetailsViewModel: ObservableObject {
    @Published private(set) var satScore: SATScore?
    @Published private(set) var isLoading = false
    @Published var errorMessage: String?
    
    func fetchDetails(for dbn: String) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let scores: [SATScore] = try await NetworkManager.shared.fetchData(from: NetworkConstant.schoolDetailsUrl)
            satScore = scores.first { $0.dbn == dbn }
            
            if satScore == nil {
                errorMessage = "No SAT scores found for this school."
            }
        } catch {
            errorMessage = "Unable to load SAT scores. Please try again."
        }
        
        isLoading = false
    }
}

// Backwards-compatible typealias for any remaining references during migration.
typealias SchoolDeatilsModel = SchoolDetailsViewModel
