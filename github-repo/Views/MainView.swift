//
//  github_repoApp.swift
//  github-repo
//
//  Created by Nattapon Pondongnok on 14/11/2563 BE.
//

import SwiftUI

@main
struct MainView: App {
    var body: some Scene {
        WindowGroup {
            SearchView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
