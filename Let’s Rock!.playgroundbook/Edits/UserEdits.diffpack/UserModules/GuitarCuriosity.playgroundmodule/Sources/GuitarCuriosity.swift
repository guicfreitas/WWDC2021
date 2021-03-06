import SwiftUI
import PlaygroundSupport
import AVFoundation

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
    
    @State var imageNames = ["card1","card2","card3","card4","card5"]
    @State var texts = ["Let's Play and discover new things","""
I think i'm more in love with rock
after all this!

What about you?
Thanks for you atentiton!
"""]
    @State var contText = 0
    @State var cont = 0
    
    var player2: AVAudioPlayer?
    
    public init(){
        let fontURL = Bundle.main.url(forResource: "CHINESER", withExtension: "ttf")
        CTFontManagerRegisterFontURLs([fontURL!] as CFArray, CTFontManagerScope.process, true){ (errors, done) -> Bool in
            if(done) {
                
            }
            print(errors as Array)
            return true
        }
        guard let url2 = Bundle.main.url(forResource: "yasMusic", withExtension: "mpeg") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)            
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player2 = try AVAudioPlayer(contentsOf: url2, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            
            player2?.prepareToPlay()
            guard let player2 = player2 else { return }
            player2.volume = 0.1
            player2.numberOfLoops = 5
            player2.play()
        }catch let error {
            print(error.localizedDescription)
        }
        
        
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
                    withAnimation(.easeInOut(duration: 1)){
                        self.startCard1.toggle()
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
                    withAnimation(.easeInOut(duration: 1)){
                        self.startCard1.toggle()
                        self.startYellow.toggle()
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
                    withAnimation(.easeInOut(duration: 1)){
                        self.startCard1.toggle()
                        self.startBlue.toggle()
                    }
                }){
                    Image(uiImage: UIImage(named: "blueNote")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: self.blueFrame ?? gp.size.width * 0.019, height: self.blueFrame ??  gp.size.width * 0.019)
                        
                        
                }.opacity(startBlue ? 1 : 0)
                .frame(width: 140, height: 140)
                .position(self.posBlue ?? CGPoint(x: gp.size.width * 0.558 , y: gp.size.height * 0.52))
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 1)){
                        self.startCard1.toggle()
                        self.startOrange.toggle()
                    }
                    
                }){
                    Image(uiImage: UIImage(named: "orangeNote")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: self.orangeFrame ?? gp.size.width * 0.019, height: self.orangeFrame ?? gp.size.width * 0.019)
                        
                        
                }.opacity(startOrange ? 1 : 0)
                .frame(width: 140, height: 140)
                .position(self.posOrange ?? CGPoint(x: gp.size.width * 0.61 , y: gp.size.height * 0.52))
                
                Text(texts[contText])
                    .font(Font.custom("Chinese Rocks",size: 70))
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
                    switch cont {
                    case 0:
                        withAnimation(.easeInOut(duration: 1)){
                            self.startCard1.toggle()
                        }
                        withAnimation(.easeInOut(duration: 4)){
                            self.startRed.toggle()
                            self.posRed = CGPoint(x: gp.size.width * 0.36,y: gp.size.height * 0.92)
                            self.redFrame = gp.size.width * 0.045
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            cont += 1
                        }
                        
                    case 1:
                        withAnimation(.easeInOut(duration: 1)){
                            self.startCard1.toggle()
                        }
                        withAnimation(.easeInOut(duration: 4)){
                            self.startYellow.toggle()
                            self.posYellow = CGPoint(x: gp.size.width * 0.502,y: gp.size.height * 0.92)
                            self.yellowFrame = gp.size.width * 0.045
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            cont += 1
                        }
                    case 2: 
                        withAnimation(.easeInOut(duration: 1)){
                            self.startCard1.toggle()
                        }
                        withAnimation(.easeInOut(duration: 4)){
                            self.startBlue.toggle()
                            self.posBlue = CGPoint(x: gp.size.width * 0.645,y: gp.size.height * 0.92)
                            self.blueFrame = gp.size.width * 0.045
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            cont += 1
                        }
                    case 3:
                        withAnimation(.easeInOut(duration: 1)){
                            self.startCard1.toggle()
                        }
                        withAnimation(.easeInOut(duration: 4)){
                            self.startOrange.toggle()
                            self.posOrange = CGPoint(x: gp.size.width * 0.785,y: gp.size.height * 0.92)
                            self.orangeFrame = gp.size.width * 0.045
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            cont += 1
                        }
                    case 4:
                        withAnimation(.easeInOut(duration: 1)){
                            self.startCard1.toggle()
                            contText += 1
                        }
                        withAnimation(.easeInOut(duration: 1.1)){
                            
                            posFirstText = CGPoint(x: gp.size.width * 0.50, y: gp.size.height * 0.20)
                        }
                    default:
                        break 
                    }
                    
                    
                }){
                    Image(uiImage: UIImage(named: imageNames[cont])!)
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

