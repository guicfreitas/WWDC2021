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
    
    @State var startPicker : CGPoint? 
    @State var posFirstText : CGPoint?
    @State var posObs : CGPoint?
    
    @State var startCard1 = false
    @State var startCard2 = false
    @State var startCard3 = false
    @State var startCard4 = false
    @State var startCard5 = false
    
    
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
                    withAnimation(.easeInOut(duration: 1)){
                        self.startCard1.toggle()
                        self.startGreen.toggle()
                    }
                    
                }){
                    Image(uiImage: UIImage(named: "greenNote")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: self.greenFrame ?? gp.size.width * 0.019, height: self.greenFrame ?? gp.size.width * 0.019)
                        
                }.opacity(startGreen ? 1 : 0)
                .frame(width: 140, height: 140)
                .position(self.posGreen ?? CGPoint(x: gp.size.width * 0.40 , y: gp.size.height * 0.52))
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 4)){
                        self.startCard2.toggle()
                        self.startRed.toggle()
                    }
                }){
                    Image(uiImage: UIImage(named: "redNote")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: self.redFrame ?? gp.size.width * 0.019, height: self.redFrame ?? gp.size.width * 0.019)
                        .position(self.posRed ?? CGPoint(x: gp.size.width * 0.452 , y: gp.size.height * 0.52))
                        
                }.opacity(startRed ? 1 : 0)
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 4)){
                        
                    }
                }){
                    Image(uiImage: UIImage(named: "yellowNote")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: self.yellowFrame ?? gp.size.width * 0.019, height: self.yellowFrame ?? gp.size.width * 0.019)
                        
                        
                }.opacity(startYellow ? 1 : 0)
                .frame(width: 140, height: 140)
                .position(self.posYellow ?? CGPoint(x: gp.size.width * 0.505 , y: gp.size.height * 0.52))
                
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
                        
                }.opacity(startBlue ? 1 : 0)
                .frame(width: 140, height: 140)
                .position(self.posBlue ?? CGPoint(x: gp.size.width * 0.558 , y: gp.size.height * 0.52))
                
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
                        
                        
                }.opacity(startOrange ? 1 : 0)
                .frame(width: 140, height: 140)
                .position(self.posOrange ?? CGPoint(x: gp.size.width * 0.61 , y: gp.size.height * 0.52))
                
                Text("Let's Play and discover new things")
                    .font(Font.custom("Chinese Rocks", size: 70))
                    .foregroundColor(.black)
                    .position(self.posFirstText ?? CGPoint(x: gp.size.width * 0.50, y: gp.size.height * 0.10))
                    .multilineTextAlignment(.center)
                    .animation(.default)
                
                Text("*Click on the notes when they reach their color*")
                    .font(Font.custom("Chinese Rocks", size: 30))
                    .foregroundColor(.black)
                    .position(self.posObs ?? CGPoint(x: gp.size.width/2, y: gp.size.height * 0.15))
                    .animation(.default)
                    
                Button( action: {
                    
                    withAnimation(.easeInOut(duration : 1)){
                        startGreen.toggle()
                        self.startPicker = CGPoint(x: gp.size.width * 0.50, y: -gp.size.height * 0.22)
                        self.posFirstText = CGPoint(x: gp.size.width * 0.50, y: -gp.size.height * 0.10)
                    }
                    
                    withAnimation(.easeInOut(duration: 4)){
                        self.posGreen = CGPoint(x: gp.size.width * 0.22,y: gp.size.height * 0.92)
                        self.posObs = CGPoint(x: gp.size.width/2, y: -gp.size.height * 0.15)
                        self.greenFrame = gp.size.width * 0.045
                    }
                    
                }){
                    Image(uiImage: UIImage(named: "startPicker")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 140, height: 140)
                        
                }
                .frame(width: 140, height: 140)
                .position(self.startPicker ?? CGPoint(x: gp.size.width * 0.50, y: gp.size.height * 0.26))
                
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 1)){
                        self.startCard1.toggle()
                    }
                    withAnimation(.easeInOut(duration: 4)){
                        self.startRed.toggle()
                        self.posRed = CGPoint(x: gp.size.width * 0.36,y: gp.size.height * 0.92)
                        self.redFrame = gp.size.width * 0.045
                    }
                    
                }){
                    Image(uiImage: UIImage(named: "card1")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: gp.size.width * 0.35, height: gp.size.width * 0.35)
                        
                    
                }.opacity(startCard1 ? 1 : 0)
                .frame(width: 140, height: 140)
                .position(x: gp.size.width * 0.50 , y: gp.size.height * 0.26)
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 1)){
                        self.startCard2.toggle()
                    }
                    withAnimation(.easeInOut(duration: 4)){
                        self.startYellow.toggle()
                        self.posYellow = CGPoint(x: gp.size.width * 0.504,y: gp.size.height * 0.92)
                        self.yellowFrame = gp.size.width * 0.045
                    }
                    
                }){
                    Image(uiImage: UIImage(named: "card2")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: gp.size.width * 0.35, height: gp.size.width * 0.35)
                    
                    
                }.opacity(startCard1 ? 1 : 0)
                .frame(width: 140, height: 140)
                .position(x: gp.size.width * 0.50 , y: gp.size.height * 0.26)
                
                
                
                
                
            }.background(Color(#colorLiteral(red: 0.9501661658287048, green: 0.6621111035346985, blue: 0.22048801183700562, alpha: 1.0)))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }
}

