//
//  SearchBarView.swift
//  Jade-Mainframe
//
//  Created by Guilerme Barciki on 23/06/21.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Search", text: $searchText)
                    .font(.system(size: 17, weight: .regular, design: .default))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(10)
                    .padding(.leading, 30)
                    .overlay(
                        Image(systemName: "magnifyingglass")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10).foregroundColor(Color(.systemGray2))
                        
                    )
                    .background(Color(.white))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .cornerRadius(10)
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    
    @State static var searchText: String = ""
    
    static var previews: some View {
        SearchBarView(searchText: $searchText)
           //.preferredColorScheme(.dark)
    }
}
