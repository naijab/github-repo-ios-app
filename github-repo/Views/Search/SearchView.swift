//
//  SearchView.swift
//  github-repo
//
//  Created by Nattapon Pondongnok on 14/11/2563 BE.
//

import SwiftUI
import RxSwift

struct SearchView: View {
    @ObservedObject private var githubViewModel = GithubViewModel()
    
    @State private var hasTitle = true
    @State private var searchKeyword: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                TextField("Github User", text: $searchKeyword)
                    .foregroundColor(Color.primary)
                Divider()
                    .frame(height: 1)
                NavigationLink(
                    destination: SearchResultView(
                        keyword: searchKeyword
                    ),
                    label: {
                        Text("SEARCH")
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                            .background(Color.primary)
                            .foregroundColor(Color.buttonText)
                            .cornerRadius(12)
                    })
            }
            .navigationBarTitle("Github Repository")
            .padding(.horizontal, 30)
        }
       
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
