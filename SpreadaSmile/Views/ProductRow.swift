import SwiftUI
struct ProductRow: View {
  @EnvironmentObject var appViewModel:AppViewModel
    var product: Products
  var body: some View {
    HStack(spacing: 20) {
     AsyncImage(url: URL(string:product.image))
            .aspectRatio(contentMode: .fit)
            .frame(width: 50)
            .cornerRadius(10)
          Spacer()
          VStack(alignment: .leading, spacing: 10) {
            Text("\(product.numberOfProducts ?? 1) x")
            Text(product.category)
              .bold()
            Text("$\(product.price)")
          }
          //Spacer()
         /* Image("Sweets")
        .resizable()
        .frame(width: 100,height: 100)
            .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))*/
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
  }
}
struct ProductRow_Previews: PreviewProvider {
  static var previews: some View {
    ProductRow(product:dummyProduct1[0])
  }
}
