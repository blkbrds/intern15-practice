import UIKit

class DongVat {
    var name: String

    init(name: String) {
        self.name = name
    }

    func ten() -> String {
        return name
    }
}

protocol Thu: class {
    var isDi: Bool { get }
}

protocol Chim: class {
    var isBay: Bool { get }
}

protocol Ca: class {
    var isBoi: Bool { get }
}

final class CaChuon: DongVat, Ca, Chim {
    var isBoi: Bool = true

    var isBay: Bool = true

    override init(name: String) {
        super.init(name: name)
    }
}

final class Bo: DongVat, Thu {
    var isDi: Bool = true

    override init(name: String) {
        super.init(name: name)
    }
}

final class Ga: DongVat, Chim, Thu {
    var isDi: Bool = true

    var isBay: Bool = true

    override init(name: String) {
        super.init(name: name)
    }
}

final class Vit: DongVat, Thu, Ca, Chim {
    var isBay: Bool = true

    var isDi: Bool = true

    var isBoi: Bool = true

    override init(name: String) {
        super.init(name: name)
    }
}

final class CaMap: DongVat, Ca {
    var isBoi: Bool = true

    override init(name: String) {
        super.init(name: name)
    }
}

final class Heo: DongVat, Thu {
    var isDi: Bool = true

    override init(name: String) {
        super.init(name: name)
    }
}

final class HaiCau: DongVat, Thu, Ca {
    var isBoi: Bool = true

    var isDi: Bool = true

    override init(name: String) {
        super.init(name: name)
    }
}

final class Doi: DongVat, Chim, Thu {
    var isDi: Bool = true

    var isBay: Bool = true

    override init(name: String) {
        super.init(name: name)
    }
}

final class CaSau: DongVat, Ca, Thu {
    var isDi: Bool = true

    var isBoi: Bool = true

    override init(name: String) {
        super.init(name: name)
    }
}

var dongVat: [DongVat] = [CaChuon(name: "Cá Chuồn"), Bo(name: "Con Bò"), Ga(name: "Con Gà"), Vit(name: "Con Vịt"), CaMap(name: "Cá Mập"), Heo(name: "Con Heo"), HaiCau(name: "Hải Cẩu"), Doi(name: "Dơi"), CaSau(name: "Cá Sấu")]

private func bietBay() -> [DongVat] {
    var bietBay: [DongVat] = []
    dongVat.forEach {
        if $0 is Chim {
            bietBay.append($0)
        }
    }
    return bietBay
}

private func bietBoi() -> [DongVat] {
    var bietBoi: [DongVat] = []
    dongVat.forEach {
        if $0 is Ca {
            bietBoi.append($0)
        }
    }
    return bietBoi
}

private func bietDi() -> [DongVat] {
    var bietDi: [DongVat] = []
    dongVat.forEach {
        if $0 is Thu {
            bietDi.append($0)
        }
    }
    return bietDi
}

private func vuaBayBoi() -> [DongVat] {
    var vuaBayBoi: [DongVat] = []
    dongVat.forEach {
        if $0 is Chim && $0 is Ca {
            vuaBayBoi.append($0)
        }
    }
    return vuaBayBoi
}

private func vuaDiBay() -> [DongVat] {
    var vuaDiBay: [DongVat] = []
    dongVat.forEach {
        if $0 is Chim && $0 is Thu {
            vuaDiBay.append($0)
        }
    }
    return vuaDiBay
}

private func vuaBoiDi() -> [DongVat] {
    var vuaBoiDi: [DongVat] = []
    dongVat.forEach {
        if $0 is Ca && $0 is Thu {
            vuaBoiDi.append($0)
        }
    }
    return vuaBoiDi
}

private func bietCaBa() -> [DongVat] {
    var bietCaBa: [DongVat] = []
    dongVat.forEach {
        if $0 is Chim && $0 is Thu && $0 is Ca {
            bietCaBa.append($0)
        }
    }
    return bietCaBa
}

private func bietChiMotTrongBa() -> Set<String> {

    var dongVatSet = Set<String>()
    dongVat.forEach { (dongVat) in
        dongVatSet.insert(dongVat.name)
    }

    var caBa: Set<String> = []
    bietCaBa().forEach { (bietcaBa) in
        caBa.insert(bietcaBa.name)
    }

    var bayBoi: Set<String> = []
    vuaBayBoi().forEach { (vuaBayBoi) in
        bayBoi.insert(vuaBayBoi.name)
    }

    var diBay: Set<String> = []
    vuaDiBay().forEach { (vuaDiBay) in
        diBay.insert(vuaDiBay.name)
    }

    var boiDi: Set<String> = []
    vuaBoiDi().forEach { (vuaBoiDi) in
        boiDi.insert(vuaBoiDi.name)
    }

    return dongVatSet.subtracting(caBa).subtracting(bayBoi).subtracting(diBay).subtracting(boiDi)
}
