//
//  LoaderSpinnerAnimationView.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 22/06/21.
//

import SwiftUI

struct LoaderSpinnerAnimationView: View {
    
    @State private var isLoading = false
    @State var degress = 10.0
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0.0, to: 0.65)
                .stroke(isLoading ? Colors.yellow : Colors.blue, lineWidth: 5.0)
                .frame(width: 80, height: 80)
                .rotationEffect(Angle(degrees: degress))
                .onAppear() {
                    self.start()
                }
            
            Text("Loading ...")
                .padding()
        }
    }
}

extension LoaderSpinnerAnimationView {
    func start() {
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            withAnimation {
                self.degress += 10.0
            }
            
            if self.degress == 360.0 {
                self.degress = 0.0
                self.isLoading.toggle()
            }
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderSpinnerAnimationView()
    }
}
