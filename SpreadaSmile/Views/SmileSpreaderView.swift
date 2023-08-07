//
// SmileSpreaderView.swift
// SpreadaSmile
//
// Created by Dinsha Wiselin Christudhas on 13.07.23.
//
import SwiftUI
struct SmileSpreaderView: View {
  @EnvironmentObject var authservice : FirebaseAuthService
  @EnvironmentObject var viewModel : ApiCallViewModel
  @EnvironmentObject var appViewModel : AppViewModel
   @State var random = 0
  var body: some View {
    NavigationStack{
      VStack{
        HStack(alignment: .top){
          AppBarView()
           
        }
         
        Text("Find your best gift for your best one.")
          .font(.subheadline)
          .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
        Spacer()
        /*Button("Next Gift") {
            viewModel.random = Int.random(in: 0..<viewModel.highLighted.count)
          }*/
         
        ZStack{
         /* Circle()
            .stroke()
            .frame(width:250 ,height: 250)
           
            .foregroundColor(.purple)*/
          if $viewModel.isReady.wrappedValue{
              ZStack{
                  
                  AsyncImage(url: URL(string:viewModel.highLighted[random].image))
                  { phase in
                       switch phase{
                       case .empty:
                       ProgressView()
                       case .success(let resultImage):
                       resultImage
                               
                       .resizable()
                       .frame(width: 280, height: 270)
                       //.scaledToFit()
                       .aspectRatio(contentMode: .fit)
                       .cornerRadius(10)
                      // .padding(.trailing,65)
                       .overlay{
                           
                           Text("30% Sale").font(.largeTitle)
                               .bold()
                               .foregroundColor(.yellow)
                               .rotationEffect(.degrees(-25))
                               .padding()
                       }
                       case .failure(_):
                       Image("Sweets")
                       @unknown default:
                       Text("FAIL")
                       }
                       }
                        /* .aspectRatio(contentMode: .fit)
                         .frame(width: 250,height: 250)
                         .cornerRadius(10)*/
                         .animation(.easeIn)
              }
          /* Image(viewModel.highLighted[viewModel.random].image)
              .resizable()
              .scaledToFit()*/
             
          }
           
        }
          Spacer()
          Text("\(viewModel.highLighted.count)")
          Text("\(random)")
          Button(action: {
              // What to perform
             // viewModel.isAnimated = true
              self.random = Int.random(in: 0..<viewModel.highLighted.count)
                
          }) {
             
             Text("Next Gift")
                  .font(.title3)
                          .fontWeight(.semibold)
                          .foregroundColor(.white)
                          .padding()
                          .padding(.horizontal, 8)
                          .background(RoundedRectangle(cornerRadius: 15).fill(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/))
                          .cornerRadius(10.0)
          }
        Spacer()
        HStack(){
          Spacer()
          Button{
            authservice.signOut()
          }label:{
            Image(systemName: "figure.walk.circle.fill")
              .font(.title)
             /* .background(RoundedRectangle(cornerRadius: 15).fill(.yellow.opacity(0.3)))*/
              .background(RoundedRectangle(cornerRadius: 15).fill(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/))
              .cornerRadius(10)
              .foregroundColor(.white)
            Text("SignOut")
                  .font(.title2)
                  .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
          }
           
           
        }.padding(10)
      }
      .toolbar {
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
struct SmileSpreaderView_Previews: PreviewProvider {
  static var previews: some View {
    SmileSpreaderView().environmentObject(AppViewModel())
      .environmentObject(ApiCallViewModel())
  }
}
struct AppBarView: View {
  var body: some View {
    
      
    HStack(){
      Button(action: {}){
        Image(systemName: "line.3.horizontal.circle.fill")
          .font(.largeTitle)
          .padding()
          .background(Color(.white))
          .cornerRadius(10)
          .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
      }
      Text("SpreadaSmile")
        .font(.largeTitle)
        .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
      Spacer()
    }
  }
}








