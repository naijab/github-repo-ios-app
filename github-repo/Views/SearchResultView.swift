//
//  SearchResultView.swift
//  github-repo
//
//  Created by Nattapon Pondongnok on 14/11/2563 BE.
//

import SwiftUI

struct SearchResultView: View {
    let keyword: String
    
    var body: some View {
        Text("Keyword : " + keyword)
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(keyword: "Demo")
    }
}
