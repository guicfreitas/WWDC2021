import SwiftUI
import PlaygroundSupport

public struct GuitarCuriosity : View{
    @State var posGreen : CGPoint?
    @State var startGreen = false
    @State var greenFrame : CGFloat?
    
    @State var posRed : CGPoint?
    @State var startRed = false
    @State var redFrame : CGFloat?
    
    @State var posYellow  : CGPoint?
    @State var startYellow = false
    @State var yellowFrame : CGFloat?
    
    @State var posBlue : CGPoint?
    @State var startBlue = false
    @State var blueFrame : CGFloat?
    
    @State var posOrange : CGPoint?
    @State var startOrange = false
    @State var orangeFrame : CGFloat?
    
    
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
                    withAnimation(.easeInOut(duration: 4)){
                        self.posGreen = CGPoint(x: gp.size.width * 0.22,y: gp.size.height * 0.92)
                        self.greenFrame = gp.size.width * 0.045
                    }
                    
                }){
                    Image(uiImage: UIImage(named: "greenNote")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: self.greenFrame ?? gp.size.width * 0.019, height: self.greenFrame ?? gp.size.width * 0.019)
                        .position(self.posGreen ?? CGPoint(x: gp.size.width * 0.40 , y: gp.size.height * 0.52))
                        
                }
                Button(action: {
                    withAnimation(.easeInOut(duration: 4)){
                        self.posRed = CGPoint(x: gp.size.width * 0.36,y: gp.size.height * 0.92)
                        self.redFrame = gp.size.width * 0.045
                    }
                }){
                    Image(uiImage: UIImage(named: "redNote")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: self.redFrame ?? gp.size.width * 0.019, height: self.redFrame ?? gp.size.width * 0.019)
                        .position(self.posRed ?? CGPoint(x: gp.size.width * 0.452 , y: gp.size.height * 0.52))
                        
                }
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 4)){
                        self.posYellow = CGPoint(x: gp.size.width * 0.504,y: gp.size.height * 0.92)
                        self.yellowFrame = gp.size.width * 0.045
                    }
                }){
                    Image(uiImage: UIImage(named: "yellowNote")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: self.yellowFrame ?? gp.size.width * 0.019, height: self.yellowFrame ?? gp.size.width * 0.019)
                        .position(self.posYellow ?? CGPoint(x: gp.size.width * 0.505 , y: gp.size.height * 0.52))
                        
                }
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 4)){
                        self.posBlue = CGPoint(x: gp.size.width * 0.645,y: gp.size.height * 0.92)
                        self.blueFrame = gp.size.width * 0.045
                    }
                }){
                    Image(uiImage: UIImage(named: "blueNote")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: self.blueFrame ?? gp.size.width * 0.019, height: self.blueFrame ??  gp.size.width * 0.019)
                        .position(self.posBlue ?? CGPoint(x: gp.size.width * 0.558 , y: gp.size.height * 0.52))
                        
                }
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 4)){
                        self.posOrange = CGPoint(x: gp.size.width * 0.785,y: gp.size.height * 0.92)
                        self.orangeFrame = gp.size.width * 0.045
                    }
                    
                }){
                    Image(uiImage: UIImage(named: "orangeNote")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: self.orangeFrame ?? gp.size.width * 0.019, height: self.orangeFrame ?? gp.size.width * 0.019)
                        .position(self.posOrange ?? CGPoint(x: gp.size.width * 0.61 , y: gp.size.height * 0.52))
                        
                }
                
                
                
            }.background(Color(#colorLiteral(red: 0.9501661658287048, green: 0.6621111035346985, blue: 0.22048801183700562, alpha: 1.0)))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }
}

