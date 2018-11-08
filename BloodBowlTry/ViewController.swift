//
//  ViewController.swift
//  BloodBowlTry
//
//  Created by Emmett Hasley on 10/25/18.
//  Copyright © 2018 John Heresy High School. All rights reserved.
//

import UIKit
let capacity = 11
let overdraw = Int.random(in: 11 ... 14)
let rerollsMax = 8
var moneyBits = [600,700,800,900,1000]
let safety = 1000
var teams = [String]()
class AUnit{
    var capacity : Int
    var name : String
    var is_linemen : Bool
    var cost : Int
    var amount : Int
    init (_ beepis : Int, _ shmeepis : String, _ creepis : Bool, _ gleepis : Int, _ murweepis : Int){
        self.capacity = beepis
        self.name = shmeepis
        self.is_linemen = creepis
        self.cost = gleepis
        self.amount = murweepis
    }
    func addAmount() {
        self.amount += 1
    }
}
var linemenHuman = AUnit(16, "Linemen", true, 40000, 0)
var blitzerHuman = AUnit(4, "Blitzer", false, 90000, 0)
var catcherHuman = AUnit(4, "Catcher", false, 60000, 0)
var throwerHuman = AUnit(2, "Thrower", false, 70000, 0)
var ogreHuman = AUnit(1, "Ogre", false, 130000, 0)
var empty = AUnit(16, "Empty", false, 0, 0)
var longBeardDwarf = AUnit(16, "Long Beard", true, 70000, 0)
var runnerDwarf = AUnit(2, "Runner", false, 80000, 0)
var blitzerDwarf = AUnit(2, "Blitzer", false, 80000, 0)
var trollSlayerDwarf = AUnit(2, "Troll Slayer", false, 90000, 0)
var deathrollerDwarf = AUnit(1, "Deathroller", false, 160000, 0)
var linemenOrc = AUnit(16, "Linemen", true, 50000, 0)
var goblinOrc = AUnit(4, "Goblin", false, 40000, 0)
var throwerOrc = AUnit(2, "Thrower", false, 70000, 0)
var blackOrc = AUnit(4, "Black Orc", false, 80000, 0)
var blitzerOrc = AUnit(4, "Blitzer", false, 80000, 0)
var trollOrc = AUnit(1, "Troll", false, 110000, 0)
var linemenSkaven = AUnit(16, "Linemen", true, 50000, 0)
var throwerSkaven = AUnit(2, "Thrower", false, 70000, 0)
var gutterRunnerSkaven = AUnit(4, "Gutter Runner", false, 80000, 0)
var stormVerminSkaven = AUnit(2, "Storm Vermin", false, 90000, 0)
var ratOgreSkaven = AUnit(1, "Rat Ogre", false, 150000, 0) // 60000 rerolls Skaven
var linemenHighElf = AUnit(16, "Linemen", true, 70000, 0)
var throwerHighElf = AUnit(2, "Thrower", false, 90000, 0)
var catcherHighElf = AUnit(4, "Catcher", false, 90000, 0)
var blitzerHighElf = AUnit(2, "Blitzer", false, 100000, 0) //50000 rerolls Highelfs
var linemenDarkElf = AUnit(16, "Linemen", true, 70000, 0)
var runnerDarkElf = AUnit(2, "Runner", false, 80000, 0)
var assassinDarkElf = AUnit(2, "Assassin", false, 90000, 0)
var blitzerDarkElf = AUnit(4, "Blitzer", false, 100000, 0)
var witchElfDarkElf = AUnit(2, "Witch Elf", false, 110000, 0) //50000 rerolls DarkElfs
var linemenBret = AUnit(16, "Linemen", false, 40000, 0)
var blizterBret = AUnit(4, "Blitzer", false, 110000, 0)
var blockerBret = AUnit(4, "Blocker", false, 70000, 0) //70000 rerolls Bretonian
var beastmenChaos = AUnit(16, "Beastmen", true, 60000, 0)
var chaosWarriorChaos = AUnit(4, "Chaos Warrior", false, 100000, 0)
var minotaurChaos = AUnit(1, "Minotaur", false, 150000, 0) //60000 rerolls Chaos

func randomTeam(_ unit1 : AUnit, _ unit2 : AUnit, _ unit3 : AUnit, _ unit4 : AUnit, _ unit5 : AUnit, _ unit6 : AUnit, _ rerollCost : Int) -> String{
    unit1.amount = 0
    unit2.amount = 0
    unit3.amount = 0
    unit4.amount = 0
    unit5.amount = 0
    unit6.amount = 0
    var team = 0
    var units = [unit1, unit2, unit3, unit4, unit5, unit6]
    var availableUnits = [unit1, unit2, unit3, unit4, unit5, unit6]
    for x in 0 ... 5{
        let y = 5 - x
        if units[y].cost == 0 {
            units.remove(at: y)
            availableUnits.remove(at: y)
        }
    }
    var money = moneyBits.randomElement()! * 1000
    var remainingMoney = 1000000 - money
    let rerolls = remainingMoney / rerollCost
    remainingMoney %= rerollCost
    money += remainingMoney
    remainingMoney = 0
    print(remainingMoney)
    print(money)
    var person = empty
    var least = 40000
    switch units.count{
    case 2:
        least = min(units[0].cost, units[1].cost)
    case 3:
        least = min(units[0].cost, units[1].cost, units[2].cost)
    case 4:
        least = min(units[0].cost, units[1].cost, units[2].cost, units[3].cost)
    case 5:
        least = min(units[0].cost, units[1].cost, units[2].cost, units[3].cost, units[4].cost)
    case 6:
        least = min(units[0].cost, units[1].cost, units[2].cost, units[3].cost, units[4].cost, units[5].cost)
    default:
        least = min(units[0].cost, units[1].cost)
    }
    while money >= least && availableUnits.count >= 1 && team <= 16 {
        var whosfirst = Int.random(in: 0 ... (availableUnits.count - 1)) //4
        print(whosfirst) //0 through 4
        person = availableUnits[whosfirst] //0 ... unit1 1... unit2 and so on
        if person.capacity <= person.amount{
            availableUnits.remove(at: whosfirst)
            if availableUnits.count >= 1{
                whosfirst = Int.random(in: 0 ... (availableUnits.count - 1))
                person = availableUnits[whosfirst]
            }
            
        }
        if money > 0 && money >= person.cost && team <= 16 {
            person.addAmount()
            team += 1
            money -= person.cost
        }
    }
    
    switch units.count {
    case 2:
        return "\(unit1.name), \(unit1.amount) \(unit2.name), \(unit2.amount) \(rerolls) rerolls \(money), \(team)"
    case 3:
        return "\(unit1.name), \(unit1.amount) \(unit2.name), \(unit2.amount) \(unit3.name), \(unit3.amount) \n \(rerolls) rerolls \(money), \(team)"
    case 4:
        return "\(unit1.name), \(unit1.amount) \(unit2.name), \(unit2.amount) \(unit3.name), \(unit3.amount) \n \(unit4.name), \(unit4.amount) \(rerolls) rerolls \(money), \(team)"
    case 5:
        return "\(unit1.name), \(unit1.amount) \(unit2.name), \(unit2.amount) \(unit3.name), \(unit3.amount) \n \(unit4.name), \(unit4.amount) \(unit5.name), \(unit5.amount) \(rerolls) rerolls \(money), \(team)"
    case 6:
        return "\(unit1.name), \(unit1.amount) \(unit2.name), \(unit2.amount) \(unit3.name), \(unit3.amount) \n \(unit4.name), \(unit4.amount) \(unit5.name), \(unit5.amount) \(unit6.name), \(unit6.amount) \n \(rerolls) rerolls \(money), \(team)"
    default:
        return "Boop"
    }
}

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = ""
        teams = ["Human", "Orc", "Dwarf", "Skaven", "High Elf", "Dark Elf", "Brettonian", "Chaos"]
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teams.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return teams[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = teams[row]
    }
    @IBAction func whenRandom(_ sender: Any) {
        switch pickerView.selectedRow(inComponent: 0){
        case 0:
            label.text = randomTeam(linemenHuman, throwerHuman, catcherHuman, blitzerHuman, ogreHuman, empty, 60000)
        case 1:
            label.text = randomTeam(linemenOrc, goblinOrc, throwerOrc, blackOrc, blitzerOrc, trollOrc, 60000)
        case 2:
            label.text = randomTeam(longBeardDwarf, runnerDwarf, blitzerDwarf, trollSlayerDwarf, deathrollerDwarf, empty, 50000)
        case 3:
            label.text = randomTeam(linemenSkaven, throwerSkaven, gutterRunnerSkaven, stormVerminSkaven, ratOgreSkaven, empty, 60000)
        case 4:
            label.text = randomTeam(linemenHighElf, throwerHighElf, catcherHighElf, blitzerHighElf, empty, empty, 50000)
        case 5:
            label.text = randomTeam(linemenDarkElf, runnerDarkElf, assassinDarkElf, blitzerDarkElf, witchElfDarkElf, empty, 50000)
        case 6:
            label.text = randomTeam(linemenBret, blizterBret, blockerBret, empty, empty, empty, 70000)
        case 7:
            label.text = randomTeam(beastmenChaos, chaosWarriorChaos, minotaurChaos, empty, empty, empty, 60000)
        default:
            print("What")
        }
    }
}



