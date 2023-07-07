//
//  ImageView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 03.07.23.
//

import SwiftUI

import SwiftUI

struct ImageView: View {
  
        let url = URL(string: "https://picsum.photos/400")

       
    var body: some View {
        AsyncImage(url: url){phase in
            switch phase{
            case .empty:
                ProgressView()
            case .success(let resultImage):
                resultImage
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
            case .failure(_):
                Image(systemName: "exclamationmark.transmission")
            @unknown default:
                Text("FAIL")
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
