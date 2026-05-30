//
//  DetailsViewController.swift
//  MasterTaskCode
//
//  Created by Veerababu Mulugu on 10/11/23.
//

import SwiftUI

struct SchoolDetailView: View {
    let school: School
    @StateObject private var viewModel = SchoolDetailsViewModel()
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 8) {
                    Text(school.schoolName)
                        .font(.title3.weight(.semibold))
                    
                    Text(school.dbn)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 6)
            }
            
            Section("SAT Scores") {
                if viewModel.isLoading {
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                } else if let satScore = viewModel.satScore {
                    ScoreRow(title: "Reading", value: satScore.satCriticalReadingAvgScore)
                    ScoreRow(title: "Math", value: satScore.satMathAvgScore)
                    ScoreRow(title: "Writing", value: satScore.satWritingAvgScore)
                    ScoreRow(title: "Test Takers", value: satScore.numOfSatTestTakers)
                } else if let errorMessage = viewModel.errorMessage {
                    Label(errorMessage, systemImage: "info.circle")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .navigationTitle("SAT Score")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetchDetails(for: school.dbn)
        }
    }
}

private struct ScoreRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
        }
    }
}

#Preview {
    NavigationStack {
        SchoolDetailView(school: School(dbn: "01M292", schoolName: "Sample School"))
    }
}
