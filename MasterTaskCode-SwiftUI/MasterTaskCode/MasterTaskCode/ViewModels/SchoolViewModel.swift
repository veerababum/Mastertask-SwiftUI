//
//  SchoolViewModel.swift
//  MasterTaskCode
//
//  Created by Veerababu Mulugu on 10/10/23.
//

import Foundation

@MainActor
final class SchoolViewModel: ObservableObject {
    @Published private(set) var schools: [School] = []
    @Published var searchText = ""
    @Published private(set) var isLoading = false
    @Published var errorMessage: String?
    
    var filteredSchools: [School] {
        guard !searchText.isEmpty else { return schools }
        return schools.filter {
            $0.schoolName.localizedCaseInsensitiveContains(searchText) ||
            $0.dbn.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    func fetchSchools() async {
        guard schools.isEmpty else { return }
        isLoading = true
        errorMessage = nil
        
        do {
            schools = try await NetworkManager.shared.fetchData(from: NetworkConstant.schoolServiceURL)
        } catch {
            errorMessage = "Unable to load schools. Please try again."
        }
        
        isLoading = false
    }
}
