import SwiftUI
struct ProductRow: View {
  @EnvironmentObject var appViewModel:AppViewModel
    var product: Product
  var body: some View {
      HStack(spacing: 20) {
          AsyncImage(url: URL(string:product.image)) { phase in
               switch phase{
               case .empty:
               ProgressView()
               case .success(let resultImage):
               resultImage
                       
               .resizable()
               .frame(width: 140, height: 140)
               //.scaledToFit()
               .aspectRatio(contentMode: .fit)
               .cornerRadius(10)
               .padding(.trailing,65)
              case .failure(_):
               Image("Sweets")
               @unknown default:
               Text("FAIL")
               }
               }
          /*.aspectRatio(contentMode: .fit)
           .frame(width: 50)
           .cornerRadius(10)*/
         // Spacer()
          VStack(spacing: 10) {
              HStack(spacing: 10) {
                  Text("\(product.numberOfProduct ?? 1) x")
                  Text(product.category)
                      .bold()
              }
              Text("$\(String(format: " %.2f",product.price))")
          }
      
          .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
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
