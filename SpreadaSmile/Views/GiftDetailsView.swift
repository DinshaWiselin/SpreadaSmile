// GiftDetailsView.swift
// SpreadaSmile
//
// Created by Dinsha Wiselin Christudhas on 07.07.23.
//
import SwiftUI
struct GiftDetailsView: View {
  @EnvironmentObject var appViewModel : AppViewModel
  @EnvironmentObject var apiViewModel : ApiCallViewModel
  // var shopName :ProductCategories
  @State var product:Product
  @State var numberofproducts = 0
  var body: some View {
    NavigationStack{
      ScrollView {
        VStack{
            AsyncImage(url: URL(string:product.image)){ phase in
                switch phase{
                case .empty:
                ProgressView()
                case .success(let resultImage):
                resultImage
                        
                .resizable()
                .frame(width: 350, height: 350)
                //.scaledToFit()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding()
                case .failure(_):
                Image("Sweets")
                @unknown default:
                Text("FAIL")
                }
                }
                /*//.aspectRatio(contentMode: .fit)
                .scaledToFit()
                  .frame(width: 350,height: 350)
                   .cornerRadius(10)
                   .padding(.all,10)*/
          //      Product Image
          /*Image(product.image)
            .resizable()
            .frame(width:210 ,height: 200)
            //.scaledToFit()
            //.aspectRatio(1,contentMode: .fit)
            //.edgesIgnoringSafeArea(.top)
            .cornerRadius(20.0)*/
            Spacer()
          DescriptionView(product:product)
          /* Text("\(product.price)")
            .font(.title)
            .foregroundColor(.white)*/
        }
        // .edgesIgnoringSafeArea(.top)
       /* HStack {
           Text("\(product.price)")
            .font(.title)
            .foregroundColor(.white)
          // Spacer()
        }
        .padding()
        .padding(.horizontal)
        // .background(Color("Primary"))
        .cornerRadius(60.0)
        //.frame(maxHeight: .infinity, alignment: .bottom)
        .edgesIgnoringSafeArea(.bottom)*/
      }
      .navigationTitle("Your Gift")
      .toolbar {
        /* Image(systemName: "heart.fill")
          .foregroundColor(.purple)*/
        NavigationLink {
          ShoppingCartView()
            .environmentObject(appViewModel)
        } label: {
          CartButton(numberOfProducts: appViewModel.products.count)
        }
      }
    }.onAppear{
        appViewModel.listenProducts()
    }
  }
}
struct GiftDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    GiftDetailsView(product: Product.dummyProduct)
      .environmentObject(AppViewModel())
  }
}
struct DescriptionView: View {
  @EnvironmentObject var appViewModel : AppViewModel
  @State var product:Product
    var body: some View {
        VStack (alignment: .leading) {
            //        Title
            
            
            //Spacer()
            Text(product.category)
                .font(.title)
                .fontWeight(.bold)
            
            //        Rating
            HStack (spacing: 4) {
                ForEach(0 ..< 5) { item in
                    Image(systemName: "star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
           // .padding(.top,3)
            Text(product.shopName ?? "Shop Name and Address")
                .onAppear{product.getShop()}
                .bold()
                .font(.title2)
                .foregroundColor(.black)
            
                .padding(.top,5)
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text(product.description)
                .lineSpacing(8.0)
                .opacity(0.6)
            //        Info
            HStack {
                //            Minus Button
                Button(action: {
                    product.decrement()
                    appViewModel.myProduct = product
                }) {
                    Image(systemName: "minus")
                        .padding(.all, 8)
                }
                .frame(width: 30, height: 30)
                .foregroundColor(.black)
                Text("\(product.numberOfProduct ?? 1)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 8)
                //            Plus Button
                Button(action: {
                    product.increment()
                    appViewModel.myProduct = product
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .padding(.all, 8)
                }
                Spacer()
                Text("$\(String(format: "%.2f", product.price))")
                    .font(.title)
                    .foregroundColor(.black)
            }
        }
        
        .padding(15)
        .padding(.top,15)
        .background(RoundedRectangle(cornerRadius: 15).fill(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/))
        
        .cornerRadius(30)
        //.offset(x: 0, y: -20.0)
        VStack{
            /* Button(action:appViewModel.addToCart(product: product)){
             Label("Add to Cart")
             .font(.title3)
             .fontWeight(.semibold)
             .foregroundColor(.black)
             .padding()
             .padding(.horizontal, 8)
             .background(Color.purple)
             .cornerRadius(10.0)
             }*/
            Button("Add to Cart") {
                appViewModel.myProduct = product
                if appViewModel.myProduct.numberOfProduct == nil{
                    appViewModel.myProduct.numberOfProduct = 1
                }
                appViewModel.addToCart(product: appViewModel.myProduct)
            }.font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal, 8)
                .background(RoundedRectangle(cornerRadius: 15).fill(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/))
                .cornerRadius(10.0)
            /*Button("Buy Now") {
             // PaymentButtonView()
             } .font(.title3)
             .fontWeight(.semibold)
             .foregroundColor(.black)
             .padding()
             .padding(.horizontal, 8)
             .background(Color.purple)
             .cornerRadius(10.0)*/
            
            /* Text("Add to Cart")
             .font(.title3)
             .fontWeight(.semibold)
             .foregroundColor(.black)
             .padding()
             .padding(.horizontal, 8)
             .background(Color.purple)
             .cornerRadius(10.0)
             Text("Buy Now")
             .font(.title3)
             .fontWeight(.semibold)
             .foregroundColor(.black)
             .padding()
             .padding(.horizontal, 8)
             .background(Color.purple)
             .cornerRadius(10.0)*/
        }
        
        
    }
            }







