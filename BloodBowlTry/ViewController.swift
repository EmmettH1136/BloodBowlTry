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
    var race : String
    var cost : Int
    var amount : Int
    init (_ beepis : Int, _ shmeepis : String, _ creepis : String, _ gleepis : Int, _ murweepis : Int){
        self.capacity = beepis
        self.name = shmeepis
        self.race = creepis
        self.cost = gleepis
        self.amount = murweepis
    }
    func addAmount() {
        self.amount += 1
    }
}
var linemenHuman = AUnit(16, "Linemen", "Human", 40000, 0)
var blitzerHuman = AUnit(4, "Blitzer", "Human", 90000, 0)
var catcherHuman = AUnit(4, "Catcher", "Human", 60000, 0)
var throwerHuman = AUnit(2, "Thrower", "Human", 70000, 0)
var ogreHuman = AUnit(1, "Ogre", "Human", 130000, 0)
var empty = AUnit(16, "Empty", "None", 0, 0)
var longBeardDwarf = AUnit(16, "Long Beard", "Dwarf", 70000, 0)
var runnerDwarf = AUnit(2, "Runner", "Dwarf", 80000, 0)
var blitzerDwarf = AUnit(2, "Blitzer", "Dwarf", 80000, 0)
var trollSlayerDwarf = AUnit(2, "Troll Slayer", "Dwarf", 90000, 0)
var deathrollerDwarf = AUnit(1, "Deathroller", "Dwarf", 160000, 0)
var linemenOrc = AUnit(16, "Linemen", "Orc", 50000, 0)
var goblinOrc = AUnit(4, "Goblin", "Orc", 40000, 0)
var throwerOrc = AUnit(2, "Thrower", "Orc", 70000, 0)
var blackOrc = AUnit(4, "Black Orc", "Orc", 80000, 0)
var blitzerOrc = AUnit(4, "Blitzer", "Orc", 80000, 0)
var trollOrc = AUnit(1, "Troll", "Orc", 110000, 0)
var linemenSkaven = AUnit(16, "Linemen", "Skaven", 50000, 0)
var throwerSkaven = AUnit(2, "Thrower", "Skaven", 70000, 0)
var gutterRunnerSkaven = AUnit(4, "Gutter Runner", "Skaven", 80000, 0)
var stormVerminSkaven = AUnit(2, "Storm Vermin", "Skaven", 90000, 0)
var ratOgreSkaven = AUnit(1, "Rat Ogre", "Skaven", 150000, 0) // 60000 rerolls Skaven
var linemenHighElf = AUnit(16, "Linemen", "High Elf", 70000, 0)
var throwerHighElf = AUnit(2, "Thrower", "High Elf", 90000, 0)
var catcherHighElf = AUnit(4, "Catcher", "High Elf", 90000, 0)
var blitzerHighElf = AUnit(2, "Blitzer", "High Elf", 100000, 0) //50000 rerolls Highelfs
var linemenDarkElf = AUnit(16, "Linemen", "Dark Elf", 70000, 0)
var runnerDarkElf = AUnit(2, "Runner", "Dark Elf", 80000, 0)
var assassinDarkElf = AUnit(2, "Assassin", "Dark Elf", 90000, 0)
var blitzerDarkElf = AUnit(4, "Blitzer", "Dark Elf", 100000, 0)
var witchElfDarkElf = AUnit(2, "Witch Elf", "Dark Elf", 110000, 0) //50000 rerolls DarkElfs
var linemenBret = AUnit(16, "Linemen", "Bretonian", 40000, 0)
var blizterBret = AUnit(4, "Blitzer", "Bretonian", 110000, 0)
var blockerBret = AUnit(4, "Blocker", "Bretonian", 70000, 0) //70000 rerolls Bretonian
var beastmenChaos = AUnit(16, "Beastmen", "Chaos", 60000, 0)
var chaosWarriorChaos = AUnit(4, "Chaos Warrior", "Chaos", 100000, 0)
var minotaurChaos = AUnit(1, "Minotaur", "Chaos", 150000, 0) //60000 rerolls Chaos
var linemenWoodElf = AUnit(16, "Linemen", "Wood Elf", 70000, 0)
var catcherWoodElf = AUnit(4, "Catcher", "Wood Elf", 90000, 0)
var throwerWoodElf = AUnit(2, "Thrower", "Wood Elf", 90000, 0)
var wardancerWoodElf = AUnit(2, "Wardancer", "Wood Elf", 120000, 0)
var treemanWoodElf = AUnit(1, "Treeman", "Wood Elf", 120000, 0) //50000 rerolls Wood Elf
var skinkLizardmen = AUnit(16, "Skink", "Lizardmen", 60000, 0)
var saurusLizardmen = AUnit(6, "Saurus", "Lizardmen", 80000, 0)
var kroxigorLizardmen = AUnit(1, "Kroxigor", "Lizardmen", 140000, 0) //60000 rerolls Lizardmen
var linemenNorse = AUnit(16, "Linemen", "Norse", 50000, 0)
var throwerNorse = AUnit(2, "Thrower", "Norse", 70000, 0)
var runnerNorse = AUnit(2, "Runner", "Norse", 90000, 0)
var berserkerNorse = AUnit(2, "Berserker", "Norse", 90000, 0)
var ulfwerenerNorse = AUnit(2, "Ulfwerener", "Norse", 110000, 0)
var yheteeNorse = AUnit(1, "Yhetee", "Norse", 140000, 0) //60000 rerolls Norse

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
        person = availableUnits[whosfirst] //0 ... unit1 1... unit2 and so on
        if person.capacity <= person.amount{
            availableUnits.remove(at: whosfirst)
            if availableUnits.count >= 1{
                whosfirst = Int.random(in: 0 ... (availableUnits.count - 1))
                person = availableUnits[whosfirst]
            }
            
        }
        if money > 0 && money >= person.cost && team <= 16 && person.amount < person.capacity {
            person.addAmount()
            team += 1
            money -= person.cost
        }
    }
    
    switch units.count {
    case 2:
        return "\(unit1.name), \(unit1.amount) \(unit2.name), \(unit2.amount) \(rerolls) rerolls \(money), \(team)"
    case 3:
        return "\(unit1.amount) \(unit1.name), \(unit2.amount) \(unit2.name), \(unit3.amount) \(unit3.name), \n \(rerolls) rerolls \(money), \(team)"
    case 4:
        return "\(unit1.amount) \(unit1.name), \(unit2.amount) \(unit2.name), \(unit3.amount) \(unit3.name), \n \(unit4.amount) \(unit4.name), \(rerolls) rerolls \(money), \(team)"
    case 5:
        return "\(unit1.amount) \(unit1.name), \(unit2.amount) \(unit2.name), \(unit3.amount) \(unit3.name), \n \(unit4.amount) \(unit4.name), \(unit5.amount) \(unit5.name), \(rerolls) rerolls \(money), \(team)"
    case 6:
        return "\(unit1.amount) \(unit1.name), \(unit2.amount) \(unit2.name), \(unit3.amount) \(unit3.name), \n \(unit4.amount) \(unit4.name), \(unit5.amount) \(unit5.name), \(unit6.amount) \(unit6.name), \n \(rerolls) rerolls \(money), \(team)"
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
        teams = ["Human", "Orc", "Dwarf", "Skaven", "High Elf", "Dark Elf", "Bretonian", "Chaos", "Wood Elf", "Lizardmen", "Norse" ]
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
        case 8:
            label.text = randomTeam(linemenWoodElf, catcherWoodElf, throwerWoodElf, wardancerWoodElf, treemanWoodElf, empty, 50000)
        case 9 :
            label.text = randomTeam(skinkLizardmen, saurusLizardmen, kroxigorLizardmen, empty, empty, empty, 60000)
        case 10:
            label.text = randomTeam(linemenNorse, runnerNorse, throwerNorse, berserkerNorse, ulfwerenerNorse, yheteeNorse, 60000)
        default:
            print("What")
        }
    }
}



