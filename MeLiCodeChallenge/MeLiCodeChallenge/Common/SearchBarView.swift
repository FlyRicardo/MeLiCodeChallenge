//
//  SearchBarView.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 19/06/21.
//

import Foundation
import SwiftUI

struct SearchBarView: UIViewRepresentable {

    //MARK: - Binding
    @Binding var text: String
    @Binding var searchByProduct: Bool

    //MARK: - Required by UIViewRepresentable
    func makeUIView(context: UIViewRepresentableContext<SearchBarView>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        
        searchBar.placeholder = "Buscar"
        searchBar.autocapitalizationType = .none
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.backgroundColor = .white
        
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBarView>) {
        uiView.text = text
    }

    func makeCoordinator() -> SearchBarView.Coordinator {
        return Coordinator(searchBarView: self)
    }
    
    //MARK: - Coordinator
    //Coordinator class Allows the view to implement the UIKit delegates
    class Coordinator: NSObject, UISearchBarDelegate {

        let searchBarView: SearchBarView

        init(searchBarView: SearchBarView) {
            self.searchBarView = searchBarView
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchBarView.text = searchText
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            searchBarView.text = searchBar.text ?? ""
            searchBarView.searchByProduct = true
        }
        
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = true
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = false
            searchBar.text = ""
            searchBar.resignFirstResponder()
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    @State static var text = ""
    @State static var shouldSearchForPruduct = false

    static var previews: some View {
        SearchBarView(text: $text, searchByProduct: $shouldSearchForPruduct)
    }
}
