//
//  CategoriesItem.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 19/06/21.
//

import SwiftUI
import Kingfisher

struct CategoryItemView: View {
    
    //MARK: - States
    @StateObject var categoryItemObservableObject: CategoryItemObservableObject
    
    //MARK: - Content View
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                KFImage(categoryItemObservableObject.url)
                    .placeholder {
                        // Placeholder while downloading
                        Image("DefaultImage", bundle: nil)
                    }
                    .resizable()
                    .frame(width: abs(geometry.size.width - 20), height: categoryItemObservableObject.itemHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fill)
                    .background(Colors.gray)
                    .cornerRadius(20)
                    .shadow(radius: 5)

                //Category Title
                VStack {
                    HStack {
                        Text(categoryItemObservableObject.name)
                            .font(.title).bold()
                            .background(Colors.gray)
                            .cornerRadius(5)
                        Spacer()
                    }
                    .padding(20)
                    Spacer()
                }
                .frame(height: categoryItemObservableObject.itemHeight)
            }
        }
    }
}

struct CategoryListItem_Previews: PreviewProvider {
    
    static var category = CategoryModel(id: "1", name: "test name", picture: "")
    static var categoryItemObservableObject = CategoryItemObservableObject(category: category)

    static var previews: some View {
        CategoryItemView(categoryItemObservableObject: categoryItemObservableObject)
    }
}

