//
//  ContentView.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 30/05/21.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - States
    @StateObject var contentViewModel: ContentViewModel
    
    var body: some View {
        Text("Hello, world!")
            .padding()
        
        

//        VStack {
//            let servicesManager = CategoriesServiceFactory.create()
//            servicesManager.getCategories(fromSite: "MLA") { (Result<[Categories], NetworkingError>) in
//
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let contentViewModel = ContentViewModel()
    
    static var previews: some View {
        ContentView(contentViewModel: contentViewModel)
    }
}
