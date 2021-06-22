//
//  ListAnimation.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 22/06/21.
//

import SwiftUI

struct ListAnimationView: View {
        
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(Colors.gray)
                    .frame(width: geometry.size.width, height: 180)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                
                HStack() {
                    //Image place holder animation
                    VStack(alignment: .leading) {
                        ShimmerAnimationView()
                            .frame(width: 100, height: 100, alignment: .center)
                    }
                    .padding(.leading, 10)
                        
                    //Labels place holder animation
                    VStack(alignment: .leading) {
                        ShimmerAnimationView()
                            .frame(width: 250, height: 40, alignment: .center)
                        ShimmerAnimationView()
                            .frame(width: 200, height: 20, alignment: .center)
                        ShimmerAnimationView()
                            .frame(width: 100, height: 10, alignment: .center)
                    }
                    .padding(.leading, 5)
                    
                    Spacer()
                }
                .frame(height: 180)
            }
        }
    }
}

struct ProductListAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ListAnimationView()
    }
}
