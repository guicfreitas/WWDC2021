import SwiftUI
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
    
    public init(){
    }
    
    public var body : some View{
        GeometryReader {gp in 
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
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 10){
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
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 10){
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
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 10){
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
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 10){
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
                
                
                
                
                
            }.background(Color(#colorLiteral(red: 0.9501661658287048, green: 0.6621111035346985, blue: 0.22048801183700562, alpha: 1.0)))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        
        
    }
    
    
}

