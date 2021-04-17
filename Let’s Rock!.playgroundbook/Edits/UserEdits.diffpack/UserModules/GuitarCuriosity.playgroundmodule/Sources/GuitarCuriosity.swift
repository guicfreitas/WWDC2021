import SwiftUI
import PlaygroundSupport

public struct GuitarCuriosity : View{
    @State var posGreen : CGPoint?
    @State var 
    
    public init(){
        
    }
    
    public var body : some View{
        GeometryReader{ gp in
            ZStack(){
                
                Image(uiImage: UIImage(named: "guitarHero")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: gp.size.width, height: gp.size.height/2)
                    .position(x: gp.size.width/2 , y: gp.size.height * 0.76)
                    .animation(.default)
                
                Button(action: {
                    print("asdasd")
                }){
                    Image(uiImage: UIImage(named: "greenNote")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: gp.size.width * 0.019, height: gp.size.width * 0.019)
                        .position(x: gp.size.width * 0.40 , y: gp.size.height * 0.52)
                        .animation(.default)
                }
                Button(action: {
                    print("asdasd")
                }){
                    Image(uiImage: UIImage(named: "redNote")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: gp.size.width * 0.019, height: gp.size.width * 0.019)
                        .position(x: gp.size.width * 0.452 , y: gp.size.height * 0.52)
                        .animation(.default)
                }
                Button(action: {
                    print("asdasd")
                }){
                    Image(uiImage: UIImage(named: "yellowNote")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: gp.size.width * 0.019, height: gp.size.width * 0.019)
                        .position(x: gp.size.width * 0.505 , y: gp.size.height * 0.52)
                        .animation(.default)
                }
                Button(action: {
                    print("asdasd")
                }){
                    Image(uiImage: UIImage(named: "blueNote")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: gp.size.width * 0.019, height: gp.size.width * 0.019)
                        .position(x: gp.size.width * 0.558 , y: gp.size.height * 0.52)
                        .animation(.default)
                }
                Button(action: {
                    print("asdasd")
                }){
                    Image(uiImage: UIImage(named: "orangeNote")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: gp.size.width * 0.019, height: gp.size.width * 0.019)
                        .position(x: gp.size.width * 0.61 , y: gp.size.height * 0.52)
                        .animation(.default)
                }
                
                
            }.background(Color(#colorLiteral(red: 0.9501661658287048, green: 0.6621111035346985, blue: 0.22048801183700562, alpha: 1.0)))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }
}

