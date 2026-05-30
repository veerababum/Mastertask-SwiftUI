//
//  ViewController.swift
//  MasterTaskCode
//
//  Created by Veerababu Mulugu on 9/28/23.
//

import SwiftUI

struct SchoolListView: View {
    @StateObject private var viewModel = SchoolViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading && viewModel.schools.isEmpty {
                    ProgressView("Loading schools")
                } else if let errorMessage = viewModel.errorMessage, viewModel.schools.isEmpty {
                    ErrorStateView(message: errorMessage)
                } else {
                    List(viewModel.filteredSchools) { school in
                        NavigationLink {
                            SchoolDetailView(school: school)
                        } label: {
                            SchoolRowView(school: school)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("NYC Schools")
            .searchable(text: $viewModel.searchText, prompt: "Search schools")
            .task {
                await viewModel.fetchSchools()
            }
            .refreshable {
                await viewModel.fetchSchools()
            }
        }
    }
}

private struct ErrorStateView: View {
    let message: String
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "exclamationmark.triangle")
                .font(.largeTitle)
                .foregroundStyle(.orange)
            
            Text("Could Not Load Schools")
                .font(.headline)
            
            Text(message)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

private struct SchoolRowView: View {
    let school: School
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "building.columns")
                .foregroundStyle(.blue)
                .frame(width: 28, height: 28)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(school.schoolName)
                    .font(.headline)
                    .foregroundStyle(.primary)
                
                Text(school.dbn)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    SchoolListView()
}
