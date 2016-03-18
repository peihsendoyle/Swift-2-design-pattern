//: Playground - noun: a place where people can play

import UIKit

// Our interfaces

protocol IWatchBand {
    
    var color: UIColor { get set }
    
    var size: BandSize { get set }
    
    var type: BandType { get set }
    
    init(size:BandSize)
}

protocol IWatchDial {
    
    var material: MaterialType { get set }
    
    var size: WatchSize { get set }
    
    init(size: WatchSize)
}

// Enums

enum BandSize : String {
    
    case SM = "SM", ML = "ML"
}

enum BandType: String {
    
    case Milanese = "Milanese",
    
    Classic = "Classic",
    
    Leather = "Leather",
    
    Modern = "Modern",
    
    LinkBracelet = "LinkBracelet",
    
    SportBand = "SportBand"
}

enum MaterialType: String {
    
    case Aluminium = "Aluminium",
    
    StainlessSteel = "Stainless Steel",
    
    Gold = "Gold"
}

enum WatchSize: String {
    
    case _38mm = "38mm", _42mm = "42mm"
}

// Prepare our Bands components

class MilaneseBand: IWatchBand {
    
    var color = UIColor.yellowColor()
    
    var size : BandSize
    
    var type = BandType.Milanese
    
    required init(size _size: BandSize) {
        size = _size
    }
}

class Classic: IWatchBand {
    
    var color = UIColor.yellowColor()
    
    var size : BandSize
    
    var type = BandType.Classic
    
    required init(size _size: BandSize) {
        size = _size
    }
}

class Leather: IWatchBand {
    
    var color = UIColor.yellowColor()
    
    var size : BandSize
    
    var type = BandType.Leather
    
    required init(size _size: BandSize) {
        size = _size
    }
}

class Modern: IWatchBand {
    
    var color = UIColor.yellowColor()
    
    var size: BandSize
    
    var type = BandType.Modern
    
    required init(size _size: BandSize) {
        size = _size }
}


class LinkBracelet: IWatchBand {
    
    var color = UIColor.yellowColor()
    
    var size: BandSize
    
    var type = BandType.LinkBracelet
    
    required init(size _size: BandSize) {
        size = _size }
}

class SportBand: IWatchBand {
    
    var color = UIColor.yellowColor()
    
    var size: BandSize
    
    var type = BandType.SportBand
    
    required init(size _size: BandSize) {
        size = _size }
}

// Dials

class AluminiumDial: IWatchDial {

    var material: MaterialType = MaterialType.Aluminium

    var size: WatchSize

    required init(size _size:WatchSize){
    
        size = _size
    }
}

class StainlessSteelDial: IWatchDial {
    
    var material: MaterialType = MaterialType.StainlessSteel
    
    var size: WatchSize
    
    required init(size _size:WatchSize) {
    
        size = _size
    }
}

class GoldDial: IWatchDial {
    
    var material: MaterialType = MaterialType.Gold
    
    var size: WatchSize
    
    required init(size _size:WatchSize) {
        
        size = _size
    }
}

// Our Abstract Factory

class WatchFactory {
    
    func createBand(bandType : BandType) -> IWatchBand {
        
        fatalError("not implemented")
    }
    
    func createDial(materialType: MaterialType) -> IWatchDial {
        
        fatalError("not implemented")
    }
    
    // our static method that return appropriated factory
    
    final class func getFactory(size: WatchSize) -> WatchFactory {
        
        var factory : WatchFactory?
        
        switch size {
            
        case ._38mm:
            
            factory = Watch38mmFactory()
            
        case ._42mm:
            
            factory = Watch42mmFactory()
        }
        
        return factory!
    }
}

// Concrete Factory for 42mm

class Watch42mmFactory: WatchFactory {
    
    override func createBand(bandType: BandType) -> IWatchBand {
        
        switch bandType {
            
        case .Milanese:
            
            return MilaneseBand(size: .ML)
            
        case .Classic:
            
            return Classic(size: .ML)
            
        case .Leather:
            
            return Leather(size: .ML)
            
        case .Modern:
            
            return Modern(size: .ML)
            
        case .LinkBracelet:
            
            return LinkBracelet(size: .ML)
            
        case .SportBand:
            
            return SportBand(size: .ML)
        }
    }
    
    override func createDial(materialType: MaterialType) -> IWatchDial {
        
        switch materialType {
            
        case .Aluminium:
            
            return AluminiumDial(size: ._42mm)
            
        case .StainlessSteel:
            
            return StainlessSteelDial(size: ._42mm)
            
        case .Gold:
            
            return GoldDial(size: ._42mm)
        }
    }
}

// Concrete Factory for 38mm

class Watch38mmFactory: WatchFactory {
    
    override func createBand(bandType: BandType) -> IWatchBand {
        
        switch bandType {
            
        case .Milanese:
            
            return MilaneseBand(size: .SM)
            
        case .Classic:
            
            return Classic(size: .SM)
            
        case .Leather:
            
            return Leather(size: .SM)
            
        case .Modern:
            
            return Modern(size: .SM)
            
        case .LinkBracelet:
            
            return LinkBracelet(size: .SM)
            
        case .SportBand:
            
            return SportBand(size: .SM)
        }
    }
    
    override func createDial(materialType: MaterialType) -> IWatchDial {
        
        switch materialType {
            
        case .Aluminium:
            
            return AluminiumDial(size: ._38mm)
            
        case .StainlessSteel:
            
            return StainlessSteelDial(size: ._38mm)
            
        case .Gold:
            
            return GoldDial(size: ._38mm)
        }
    }
}

// Simulate our client

let manufacturer1 = WatchFactory.getFactory(WatchSize._38mm)

let productA = manufacturer1.createBand(BandType.Milanese)

productA.color

productA.size.rawValue

productA.type.rawValue

let productB = manufacturer1.createDial(.Aluminium)

productB.material.rawValue

productB.size.rawValue





