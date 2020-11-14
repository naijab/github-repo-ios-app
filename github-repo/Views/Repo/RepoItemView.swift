//
//  RepoItemView.swift
//  github-repo
//
//  Created by Nattapon Pondongnok on 14/11/2563 BE.
//

import SwiftUI

struct RepoItemView: View {
    
    @ObservedObject var githubViewModel = GithubViewModel()
    
    let repo: GithubRepository

    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            Text(repo.name)
                .foregroundColor(Color.primary)
                .bold()
          
            HStack {
                Image("StarIcon")
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .center)
                    .padding(.trailing, 4)
                Text("\(repo.stargazersCount)")
                    .foregroundColor(Color.gray)
            }
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(githubViewModel.contributors, id: \.self) { contributor in
                        ContributorItem(title: contributor.login, avatar: contributor.avatarURL)
                    }
                }
            }
            .frame(height: 100)
        })
        .cornerRadius(10)
        .padding(.vertical, 10)
        .padding(.leading, 16)
        .background(Color.repoBg)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.5),
                        lineWidth: 1)
        )
        .onAppear {
            githubViewModel.fetchContributor(username: repo.owner.login, repoName: repo.name)
        }
    }
}
