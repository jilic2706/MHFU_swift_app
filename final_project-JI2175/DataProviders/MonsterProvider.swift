//
//  MonsterProvider.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 09.12.2021..
//

import Foundation

class MonsterProvider {
    static let shared = MonsterProvider()
    
    private(set) var monsters: [Monster] = []
    
    init() {
        monsters = [
            Monster(id: 1, name: "Felyne", description: "Cat-like humanoids called Lynians that are noted for their white fur. Felynes are quiet and peaceful until angered, in which case they may attack. Capable of speech, they are sometimes found in the employ of human masters.", entityType: .monster, type: .lynian, size: .small, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/2/2f/FrontierGen-Felyne_Icon.png/revision/latest/scale-to-width-down/70?cb=20160325035401"), habitats: [800, 801, 802, 803, 804, 806, 807, 808, 809, 810, 811]),
            Monster(id: 4, name: "Vespoid", description: "An enormous, wasp-like insectoid with a poisonous stinger that paralyzes prey. Easily damaged, there are rarely any usable parts left to harvest from them once they are killed.", entityType: .monster, type: .neopteron, size: .small, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/7/7e/FrontierGen-Vespoid_Icon.png/revision/latest/scale-to-width-down/70?cb=20160325042028"), habitats: [801, 802, 803, 804, 805, 806, 807, 808, 809, 810, 811, 812]),
            Monster(id: 8, name: "Popo", description: "A herbivorous monster known for its giant, bent fangs. Living in herds, it is particularly bold when defending its offspring. Popo meat is quite nutritious, and its tongue is widely admired as a delicacy.", entityType: .monster, type: .herbivore, size: .small, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/b/bf/FrontierGen-Popo_Icon.png/revision/latest/scale-to-width-down/70?cb=20160325040917"), habitats: [801]),
            Monster(id: 27, name: "Yian Kut-Ku", description: "A bird-like wyvern with a huge beak and large ears that splay open when it is angered. With its sensitive hearing it dislikes loud noises. It is smaller but faster than other wyverns.", entityType: .monster, type: .birdWyvern, size: .large, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/3/32/FrontierGen-Yian_Kut-Ku_Icon.png/revision/latest/scale-to-width-down/70?cb=20160325042330"), habitats: [802, 805, 808, 809, 812]),
            Monster(id: 36, name: "Rathalos", description: "Male wyvern that keeps a nest and patrols its patch of territory from the air in search of prey. Its claws are filled with a poison that weakens its quarry.", entityType: .monster, type: .flyingWyvern, size: .large, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/b/b0/FrontierGen-Rathalos_Icon.png/revision/latest/scale-to-width-down/70?cb=20160325040920"), habitats: [806, 808, 811, 812]),
            Monster(id: 53, name: "Plesioth", description: "An enormous, flightless, aquatic wyvern with wings that have evolved into fins for swimming. Although superficially fish-like, they can move on land as well. They love frogs.", entityType: .monster, type: .piscineWyvern, size: .large, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/f/f1/FrontierGen-Plesioth_Icon.png/revision/latest/scale-to-width-down/70?cb=20160325040914"), habitats: [802, 803, 808, 809]),
            Monster(id: 56, name: "Daimyo Hermitaur", description: "A large carapaceon with a giant monster's skull on its back. Fond of the sand, it is mainly seen in the desert or jungle zones. Living underground, it surfaces when hungering for a snack.", entityType: .monster, type: .carapaceon, size: .large, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/a/ad/FUIOS-Daimyo_Hermitaur_Icon.svg/revision/latest/scale-to-width-down/70?cb=20210724030459"), habitats: [801, 802, 808, 809]),
            Monster(id: 63, name: "Congalala", description: "A large pelagus sporting pink fur often spotted in the jungle and swamp zones. Fond of mushrooms, its diet affects its breath, which may be poisonous or flaming. One can predict these traits via the food in its local habitat.", entityType: .monster, type: .pelagus, size: .large, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/e/e9/Congalala_Icon.png/revision/latest?cb=20130218180747"), habitats: [801, 804, 808, 810]),
            Monster(id: 75, name: "Teostra", description: "A brutal male Elder Dragon with breath of flame and expert control over fire. Its vile temperament means anyone who approaches is subject to fire and brimstone. Known to attack towns, the Guild keeps tabs on its movements.", entityType: .monster, type: .elderDragon, size: .large, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/4/4b/FrontierGen-Teostra_Icon.png/revision/latest/scale-to-width-down/70?cb=20160325041246"), habitats: [805, 811, 813, 814]),
            Monster(id: 81, name: "Espinas", description: "???", entityType: .monster, type: .flyingWyvern, size: .large, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/a/ad/FrontierGen-Espinas_Icon.png/revision/latest?cb=20160325035149"), habitats: [806, 814, 816])
        ]
    }
}
