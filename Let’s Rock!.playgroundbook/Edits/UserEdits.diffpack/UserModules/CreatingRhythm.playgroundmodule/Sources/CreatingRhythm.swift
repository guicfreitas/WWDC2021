
//Soundtrack Vodovoz Music Productions 
/*
 https://www.youtube.com/watch?v=-rK18sRGTUk&list=PLq4r2IOXma9AYVxAoHM6eKhstxdU6Q18q 
 */

import SwiftUI
import AVFoundation
import PlaygroundSupport

public struct CreatingRhythm : View{
    @State var dragAmountJazz: CGPoint?
    @State var dragAmountCountry: CGPoint?
    @State var dragAmountFolk: CGPoint?
    @State var dragAmountRB: CGPoint?
    @State var scaleAmount : CGFloat  = 1.0
    @State var FirstRb = false
    @State var FirstJazz = false
    @State var FirstCountry = false
    @State var FirstFolk = false
    @State var positionText1 : CGPoint?
    @State var positionText2 : CGPoint?
    @State var ySpeaker : CGFloat = 920
    @State var area : CGFloat = 0.02
    @State var posText : CGPoint?
    @State var posText2 : CGPoint?
    @State var isHoverYes = false
    @State var posPicker : CGPoint?
    @State var rotationAmount = 90.0
    
    var player : AVAudioPlayer?
    var player2 : AVAudioPlayer?
    
    public init(){
        let fontURL = Bundle.main.url(forResource: "CHINESER", withExtension: "ttf")
        CTFontManagerRegisterFontURLs([fontURL!] as CFArray, CTFontManagerScope.process, true){ (errors, done) -> Bool in
            if(done) {
                
            }
            print(errors as Array)
            return true
        }
        
        guard let url = Bundle.main.url(forResource: "overdriven-guitar-single-power-chord-long-release_A_minor", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)            
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            
            player?.prepareToPlay()
            guard let player = player else { return }
            
            
        } catch let error {
            print(error.localizedDescription)
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
        GeometryReader {gp in 
            ZStack(){
                Image(uiImage: UIImage(named: "leftBg")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: gp.size.width)
                    .position(x:gp.size.width * 0.10 ,y:gp.size.height * 0.50)
                Image(uiImage: UIImage(named: "rightBg")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: gp.size.height)
                    .position(x:gp.size.width * 0.90 ,y:gp.size.height * 0.50)
            }.background(Color(#colorLiteral(red: 0.9603047966957092, green: 0.7802415490150452, blue: 0.5308190584182739, alpha: 1.0)))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            ZStack(){
                
                Button(action: {
                    PlaygroundPage.current.navigateTo(page: .next)
                }){
                    Image(uiImage: UIImage(named: "nextPicker")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 140, height: 140)
                        .position(posPicker ?? CGPoint(x: -1500, y: gp.size.width * 0.40))
                        .shadow(radius: isHoverYes ? 5 : 0)
                        .animation(.spring())
                        .onHover { hover in
                            isHoverYes = hover
                        }
                } 
                Image(uiImage: UIImage(named: "folk")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .position(self.dragAmountFolk ?? CGPoint(x:  gp.size.width/2 - 240, y: 450))
                    .animation(.default)
                    .highPriorityGesture(
                        DragGesture()
                            .onChanged({self.dragAmountFolk = $0.location
                                if($0.location.x >= gp.size.width * (0.45 - area) && $0.location.x <= gp.size.width * (0.55 + area) && $0.location.y >= gp.size.height * (0.75 - area) && $0.location.y <= gp.size.height * 0.95){
                                    self.dragAmountFolk = CGPoint(x: gp.size.width * 0.50, y: gp.size.height * 0.85)
                                    if(FirstFolk == false){
                                        self.scaleAmount += 50
                                        self.area += 0.05
                                        self.FirstFolk = true
                                        self.ySpeaker -= 20
                                    }
                                    
                                }
                                if(FirstRb == true && FirstFolk == true && FirstJazz == true && FirstCountry == true){
                                    positionText1 = CGPoint(x: gp.size.width / 2, y: -1050)
                                    positionText2 = CGPoint(x: gp.size.width / 2, y: -1190)
                                    posText = CGPoint(x: gp.size.width/2, y: gp.size.height * 0.21)
                                    
                                    player!.volume = 0.15
                                    player!.play()
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 15){
                                        posText = CGPoint(x: gp.size.width/2, y: gp.size.height * -0.21)
                                        self.posText2 = CGPoint(x: gp.size.width * 0.50, y: gp.size.height * 0.25)
                                        self.posPicker = CGPoint(x: gp.size.width * 0.50, y: gp.size.height * 0.37)
                                    }
                                }
                            })
                    )
                
                Image(uiImage: UIImage(named: "jazz")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .position(self.dragAmountJazz ?? CGPoint(x:  gp.size.width/2 - 80, y: 450))
                    .animation(.default)
                    .highPriorityGesture(
                        DragGesture()
                            .onChanged({self.dragAmountJazz = $0.location
                                if($0.location.x >= gp.size.width * (0.45 - area) && $0.location.x <= gp.size.width * (0.55 + area) && $0.location.y >= gp.size.height * (0.75 - area) && $0.location.y <= gp.size.height * 0.95){
                                    self.dragAmountJazz = CGPoint(x: gp.size.width * 0.50, y: gp.size.height * 0.85)
                                    if(FirstJazz == false){
                                        self.scaleAmount += 50
                                        self.area += 0.05
                                        self.FirstJazz = true
                                        self.ySpeaker -= 20
                                    }
                                }
                                if(FirstRb == true && FirstFolk == true && FirstJazz == true && FirstCountry == true){
                                    positionText1 = CGPoint(x: gp.size.width / 2, y: -1050)
                                    positionText2 = CGPoint(x: gp.size.width / 2, y: -1190)
                                    posText = CGPoint(x: gp.size.width/2, y: gp.size.height * 0.21)
                                    
                                    player!.volume = 0.15
                                    player!.play()
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 15){
                                        posText = CGPoint(x: gp.size.width/2, y: gp.size.height * -0.21)
                                        self.posText2 = CGPoint(x: gp.size.width * 0.50, y: gp.size.height * 0.25)
                                        self.posPicker = CGPoint(x: gp.size.width * 0.50, y: gp.size.height * 0.37)
                                    }
                                }
                            })
                    )
                Image(uiImage: UIImage(named: "r&b")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .position(self.dragAmountRB ?? CGPoint(x: gp.size.width/2 + 240, y: 450))
                    .animation(.default)
                    .highPriorityGesture(
                        DragGesture()
                            .onChanged({self.dragAmountRB = $0.location
                                if($0.location.x >= gp.size.width * (0.45 - area) && $0.location.x <= gp.size.width * (0.55 + area) && $0.location.y >= gp.size.height * (0.75 - area) && $0.location.y <= gp.size.height * 0.95){
                                    self.dragAmountRB = CGPoint(x: gp.size.width * 0.50, y: gp.size.height * 0.85)
                                    if(FirstRb == false){
                                        self.scaleAmount += 50
                                        self.area += 0.05
                                        self.FirstRb = true
                                        self.ySpeaker -= 20
                                    }
                                    
                                }
                                if(FirstRb == true && FirstFolk == true && FirstJazz == true && FirstCountry == true){
                                    positionText1 = CGPoint(x: gp.size.width / 2, y: -1050)
                                    positionText2 = CGPoint(x: gp.size.width / 2, y: -1190)
                                    posText = CGPoint(x: gp.size.width/2, y: gp.size.height * 0.21)
                                    
                                    player!.volume = 0.15
                                    player!.play()
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 15){
                                        posText = CGPoint(x: gp.size.width/2, y: gp.size.height * -0.21)
                                        self.posText2 = CGPoint(x: gp.size.width * 0.50, y: gp.size.height * 0.25)
                                        self.posPicker = CGPoint(x: gp.size.width * 0.50, y: gp.size.height * 0.37)
                                    }
                                }
                            })
                        
                    )
                
                Image(uiImage: UIImage(named: "country")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .position(self.dragAmountCountry ?? CGPoint(x: gp.size.width/2 + 80, y: 450))
                    .animation(.default)
                    .highPriorityGesture(
                        DragGesture()
                            .onChanged({self.dragAmountCountry = $0.location
                                if($0.location.x >= gp.size.width * (0.45 - area) && $0.location.x <= gp.size.width * (0.55 + area) && $0.location.y >= gp.size.height * (0.75 - area) && $0.location.y <= gp.size.height * 0.95){
                                    self.dragAmountCountry = CGPoint(x: gp.size.width * 0.50, y: gp.size.height * 0.85)
                                    if(FirstCountry == false){
                                        self.scaleAmount += 50
                                        self.area += 0.05
                                        self.FirstCountry = true
                                        self.ySpeaker -= 20
                                    }
                                    
                                }
                                if(FirstRb == true && FirstFolk == true && FirstJazz == true && FirstCountry == true){
                                    positionText1 = CGPoint(x: gp.size.width / 2, y: -1050)
                                    positionText2 = CGPoint(x: gp.size.width / 2, y: -1190)
                                    posText = CGPoint(x: gp.size.width/2, y: gp.size.height * 0.21)
                                    
                                    player!.volume = 0.15
                                    player!.play()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 15){
                                        posText = CGPoint(x: gp.size.width/2, y: gp.size.height * -0.21)
                                        self.posText2 = CGPoint(x: gp.size.width * 0.50, y: gp.size.height * 0.25)
                                        self.posPicker = CGPoint(x: gp.size.width * 0.50, y: gp.size.height * 0.37)
                                    }
                                }
                            })
                    )
                
                Text("But first let's create a new rhythm")
                    .font(Font.custom("Chinese Rocks", size: 100))
                    .frame(width: gp.size.width * 0.90)
                    .multilineTextAlignment(.center )
                    .foregroundColor(.black)
                    .position(self.positionText1 ?? CGPoint(x: gp.size.width/2, y: gp.size.height * 0.13))
                    .animation(.default)
                
                Text("*Mix this genre into the speaker*")
                    .font(Font.custom("Chinese Rocks", size: 30))
                    .foregroundColor(.black)
                    .position(self.positionText2 ?? CGPoint(x: gp.size.width/2, y: gp.size.height * 0.24))
                    .animation(.default)
                
                    
                
                
                Image(uiImage: UIImage(named: "caixa")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300 + scaleAmount, height: 300 + scaleAmount)
                    .position(x: gp.size.width/2, y: ySpeaker)
                    .animation(.default)
                
                 Text("""
                 Did you know what you just did?
                 You have just created Rock!
                 
                 That's how this great genre was born, 
                 in 1950 all this rhythm was mixed up.
                 
                 And became a fever during a long time!
                 """)
                 .font(Font.custom("Chinese Rocks", size: 55))
                 .foregroundColor(.black)
                 .multilineTextAlignment(.center)
                 .position(self.posText ?? CGPoint(x: gp.size.width/2, y: gp.size.height * -0.50))
                 .animation(.default)
                    
                Text("So let's discover a little more!")
                    .font(Font.custom("Chinese Rocks", size: 70))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .position(self.posText2 ?? CGPoint(x: -1500, y: gp.size.height * 0.35))
                    .animation(.default)
                
                
                
                
                
            }
            
        }
        
        
    }
    
    
}

