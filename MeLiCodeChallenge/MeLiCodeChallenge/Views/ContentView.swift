//
//  ContentView.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 30/05/21.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    //MARK: - States
    @StateObject var contentViewModel: ContentViewModel
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            KFImage(contentViewModel.url)
                .resizable()
                    .frame(width: 128, height: 128)
                    .cornerRadius(20)
                    .shadow(radius: 5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let contentViewModel = ContentViewModel()
    
    static var previews: some View {
        ContentView(contentViewModel: contentViewModel)
    }
}
