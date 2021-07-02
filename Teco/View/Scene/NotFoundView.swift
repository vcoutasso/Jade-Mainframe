//
//  NotFoundView.swift
//  Teco
//
//  Created by Vinícius Couto on 02/07/21.
//

import SwiftUI

struct NotFoundView: View {
    var body: some View {
        Image(Assets.Images.Splash.notFound.name)
            .ignoresSafeArea()
    }
}

struct NotFoundView_Previews: PreviewProvider {
    static var previews: some View {
        NotFoundView()
    }
}
