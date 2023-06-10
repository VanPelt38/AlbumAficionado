//
//  TopTens.swift
//  Top10Albums
//
//  Created by Jake Gordon on 08/01/2023.
//

import Foundation

//Hard-coded genre lists.

struct TopTens {
    
    let electroPop: [[String]] = [
        ["1. Kala - M.I.A.", "Kala (album)"],
        ["2. Robyn - Robyn", "Robyn (album)"],
        ["3. Plunge - Fever Ray", "Plunge (album)"],
        ["4. Anniemal - Annie", "Anniemal"],
        ["5. Hopelessness - ANOHNI", "Hopelessness (album)"],
        ["6. Violator - Depeche Mode", "Violator (album)"],
        ["7. The Pleasure Principle - Gary Numan", "The Pleasure Principle (album)"],
        ["8. Power Corruption & Lies - New Order", "Power, Corruption & Lies"],
        ["9. Chaleur Humaine - Christine And The Queens", "Chaleur humaine"],
        ["10. A New Chance - The Tough Alliance", "A New Chance"]
    ]
    
    let punk: [[String]] = [
        ["1. Ramones - Ramones", "Ramones (album)"],
         ["2. Never Mind The Bollocks - The Sex Pistols", "Never Mind the Bollocks, Here's the Sex Pistols"],
          ["3. Fresh Fruit For Rotting Vegetables - Dead Kennedys", "Fresh Fruit for Rotting Vegetables"],
           ["4. The Clash - The Clash", "The Clash (album)"],
        ["5. Damaged - Black Flag", "Damaged (Black Flag album)"],
        ["6. Double Nickels On The Dime - Minutemen", "Double Nickels on the Dime"],
        ["7. Bad Brains - Bad Brains", "Bad Brains (album)"],
        ["8. Funhouse - The Stooges", "Fun House (The Stooges album)"],
        ["9. Static Age - Misfits", "Static Age"],
        ["10. Out Of Step - Minor Threat", "Minor Threat (album)"]
    ]

    let pop: [[String]] = [
        ["1. Thriller - Michael Jackson", "Thriller (album)"],
        ["2. 1999 - Prince", "1999 (Prince album)"],
        ["3. Like A Prayer - Madonna", "Like a Prayer (album)"],
        ["4. Arrival - ABBA", "Arrival (ABBA album)"],
        ["5. Bad Girls - Donna Summers", "Bad Girls (Donna Summer album)"],
        ["6. Spice - The Spice Girls", "Spice (album)"],
        ["7. Come On Over - Shania Twain", "Come On Over"],
        ["8. Taylor Swift - Taylor Swift", "Taylor Swift (album)"],
        ["9. The Fame Monster - Lady Gaga", "The Fame Monster"],
        ["10. Hounds Of Love - Kate Bush", "Hounds of Love"]
    ]
    
    let tripHop: [[String]] = [
        ["1. Dummy - Portishead", "Dummy (album)"],
        ["2. Mezzanine - Massive Attack", "Mezzanine (album)"],
        ["3. Maxinquaye - Tricky", "Maxinquaye"],
        ["4. Smokers Delight - Nightmares On Wax", "Smokers Delight"],
        ["5. Psyence Fiction - UNKLE", "Psyence Fiction"],
        ["6. Endtroducing... - DJ Shadow", "Endtroducing..."],
        ["7. Blue Lines - Massive Attack", "Blue Lines"],
        ["8. Who Can You Trust? - Morcheeba", "Who Can You Trust? (album)"],
        ["9. Sounds From The Thievery Hi-Fi - Thievery Corporation", "Sounds from the Thievery Hi-Fi"],
        ["10. Sounds Of The Satellites - Laika", "Sounds of the Satellites"]
    ]
    
    let rock: [[String]] = [
        ["1. Revolver - The Beatles", "Revolver (Beatles album)"],
        ["2. Are You Experienced - Jimi Hendrix", "Are You Experienced"],
        ["3. Abbey Road - The Beatles", "Abbey Road"],
        ["4. The Doors - The Doors", "The Doors (album)"],
        ["5. Led Zeppelin IV - Led Zeppelin", "Led Zeppelin IV"],
        ["6. The Dark Side Of The Moon - Pink Floyd", "The Dark Side of the Moon"],
        ["7. Back In Black - AC/DC", "Back in Black"],
        ["8. Exile On Main St. - The Rolling Stones", "Exile on Main St."],
        ["9. Born To Run - Bruce Springsteen", "Born to Run"],
        ["10. The Rise And Fall Of Ziggy Stardust And The Spiders From Mars - David Bowie", "The Rise and Fall of Ziggy Stardust and the Spiders from Mars"]
    ]
    
    let soul: [[String]] = [
        ["1. Live At The Apollo - James Brown", "Live at the Apollo (1963 album)"],
        ["2. Songs In The Key Of Life - Stevie Wonder", "Songs in the Key of Life"],
        ["3. What's Going On - Marvin Gaye", "What's Going On (Marvin Gaye album)"],
        ["4. Stand! - Sly & The Family Stone", "Stand!"],
        ["5. I Never Loved A Man The Way I Love You - Aretha Franklin", "I Never Loved a Man the Way I Love You"],
        ["6. The Genius Of Ray Charles - Ray Charles", "The Genius of Ray Charles"],
        ["7. Voodoo - D'Angelo", "Voodoo (D'Angelo album)"],
        ["8. Innervisions - Stevie Wonder", "Innervisions"],
        ["9. In Person - Ray Charles", "Ray Charles in Person"],
        ["10. Let's Stay Together - Al Green", "Let's Stay Together (Al Green album)"]
    ]
    
    let electroHouse: [[String]] = [
        ["1. Cross - Justice", "Cross (Justice album)"],
        ["2. Destroy Rock & Roll - Mylo", "Destroy Rock & Roll"],
        ["3. Army Of Mushrooms - Infected Mushroom", "Army of Mushrooms"],
        ["4. Clarity - Zedd", "Clarity (Zedd album)"],
        ["5. Essential - Soulwax", "Soulwax"],
        ["6. Alternative Light Source - Leftfield", "Alternative Light Source"],
        ["7. Generation Hexed - Drums Of Death", "Generation Hexed"],
        ["8. OutRun - Kavinsky", "OutRun (album)"],
        ["9. Aleph - Gesaffelstein", "Aleph (album)"],
        ["10. 4x4=12 - Deadmau5", "4×4=12"]
    ]
    
    let hipHop: [[String]] = [
        ["1. The Chronic - Dr. Dre", "The Chronic"],
        ["2. Illmatic - Nas", "Illmatic"],
        ["3. It Takes A Nation Of Millions To Hold Us Back - Public Enemy", "It Takes a Nation of Millions to Hold Us Back"],
        ["4. Ready To Die - The Notorious B.I.G.", "Ready to Die"],
        ["5. Enter The Wu-Tang (36 Chambers) - Wu-Tang Clan", "Enter the Wu-Tang (36 Chambers)"],
        ["6. Paul's Boutique - Beastie Boys", "Paul's Boutique"],
        ["7. Midnight Marauders - A Tribe Called Quest", "Midnight Marauders"],
        ["8. 3 Feet High And Rising - De La Soul", "3 Feet High and Rising"],
        ["9. Gangster Chronicle - London Posse", "Gangster Chronicle"],
        ["10. All Eyez On Me - 2Pac", "All Eyez on Me"]
    ]
    
    let indie: [[String]] = [
        ["1. Inside In / Inside Out - The Kooks", "Inside In / Inside Out"],
        ["2. Panic Prevention - Jamie T", "Panic Prevention"],
        ["3. Costello Music - The Fratellis", "Costello Music"],
        ["4. The Cribs - The Cribs", "The Cribs (album)"],
        ["5. Fantasy Black Channel - Late Of The Pier", "Fantasy Black Channel"],
        ["6. Hold On Now, Youngster... - Los Campesinos", "Hold on Now, Youngster..."],
        ["7. Razorlight - Razorlight", "Razorlight (album)"],
        ["8. Waited Up 'Til It Was Light - Johnny Foreigner", "Waited Up 'til It Was Light"],
        ["9. Down In Albion - Babyshambles", "Down in Albion"],
        ["10. Whatever People Say I Am, That's What I'm Not - The Arctic Monkeys", "Whatever People Say I Am, That's What I'm Not"]
    ]
    
    let electronica: [[String]] = [
        ["1. Trans-Europe Express - Kraftwerk", "Trans-Europe Express (album)"],
        ["2. Untrue - Burial", "Untrue (album)"],
        ["3. Dubnobasswithmyheadman - Underworld", "Dubnobasswithmyheadman"],
        ["4. Bricolage - Amon Tobin", "Bricolage (album)"],
        ["5. Leftism - Leftfield", "Leftism (album)"],
        ["6. Endtroducing... - DJ Shadow", "Endtroducing....."],
        ["7. Selected Ambient Works 85–92 - Aphex Twin", "Selected Ambient Works 85–92"],
        ["8. The Orb's Adventures Beyond the Ultraworld - The Orb", "The Orb's Adventures Beyond the Ultraworld"],
        ["9. Bytes - Black Dog Productions", "Bytes (album)"],
        ["10. ex:el - 808 State", "ex:el"]
    ]
    
    let folkRock: [[String]] = [
        ["1. Liege & Lief - Fairport Convention", "Liege & Lief"],
        ["2. Parcel Of Rogues - Steeleye Span", "Parcel of Rogues (album)"],
        ["3. American Beauty - Grateful Dead", "American Beauty (album)"],
        ["4. Court And Spark - Joni Mitchell", "Court and Spark"],
        ["5. Bringing It All Back Home - Bob Dylan", "Bringing It All Back Home"],
        ["6. Blue - Joni Mitchell", "Blue (Joni Mitchell album)"],
        ["7. After The Gold Rush - Neil Young", "After the Gold Rush"],
        ["8. Come Out Fighting Ghengis Smith - Roy Harper", "Come Out Fighting Ghengis Smith"],
        ["9. On The Shore - Trees", "On the Shore"],
        ["10. The Pentangle - Pentangle", "The Pentangle (album)"]
    ]
    
    let postRock: [[String]] = [
        ["1. Millions Now Living Will Never Die - Tortoise", "Millions Now Living Will Never Die"],
        ["2. Spiderland - Slint", "Spiderland"],
        ["3. Hex - Bark Psychosis", "Hex (Bark Psychosis album)"],
        ["4. Laughing Stock - Talk Talk", "Laughing Stock"],
        ["5. Young Team - Mogwai", "Mogwai Young Team"],
        ["6. F♯ A♯ ∞ - Godspeed You! Black Emperor", "F♯ A♯ ∞"],
        ["7. Ágætis byrjun - Sigur Ros", "Ágætis byrjun"],
        ["8. Spirit Of Eden - Talk Talk", "Spirit of Eden"],
        ["9. China Gate - Cul De Sac", "China Gate (album)"],
        ["10. Mirrored - Battles", "Mirrored"]
    ]
    
    let reggaeton: [[String]] = [
        ["1. Barrio Fino - Daddy Yankee", "Barrio Fino"],
        ["2. Vibras - J Balvin", "Vibras"],
        ["3. Mas Flow 2 - Luny Tunes & Baby Ranks", "Mas Flow 2"],
        ["4. Flashback - Ivy Queen", "Flashback (Ivy Queen album)"],
        ["5. KG0516 - Karol G", "KG0516"],
        ["6. The Last Don - Don Omar", "The Last Don (album)"],
        ["7. Pa'l Mundo - Wisin & Yandel", "Pa'l Mundo"],
        ["8. Aura - Ozuna", "Aura (Ozuna album)"],
        ["9. El Abayarde - Tego Calderon", "El Abayarde"],
        ["10. Mas Flow: Los Benjamins - Luny Tunes & Tainy", "Mas Flow: Los Benjamins"]
    ]
    
    let alternativeRock: [[String]] = [
        ["1. OK Computer - Radiohead", "OK Computer"],
        ["2. Nevermind - Nirvana", "Nevermind"],
        ["3. Doolittle - Pixies", "Doolittle (album)"],
        ["4. Blue Album - Weezer", "Weezer (Blue Album)"],
        ["5. Daydream Nation - Sonic Youth", "Daydream Nation"],
        ["6. Murmur - R.E.M.", "Murmur (album)"],
        ["7. The Queen Is Dead - The Smiths", "The Queen Is Dead"],
        ["8. Surfer Rosa - Pixies", "Surfer Rosa"],
        ["9. The Velvet Underground & Nico - The Velvet Underground & Nico", "The Velvet Underground & Nico"],
        ["10. Loveless - My Bloody Valentine", "Loveless (album)"]
    ]
    
    let emo: [[String]] = [
        ["1. Diary - Sunny Day Real Estate", "Diary (Sunny Day Real Estate album)"],
        ["2. American Football - American Football", "American Football (1999 album)"],
        ["3. Rites Of Spring - Rites Of Spring", "Rites of Spring (album)"],
        ["4. Dear You - Jawbreaker", "Dear You"],
        ["5. From Under The Cork Tree - Fall Out Boy", "From Under the Cork Tree"],
        ["6. Frame & Canvas - Braid", "Frame & Canvas"],
        ["7. The Black Parade - My Chemical Romance", "The Black Parade"],
        ["8. Full Collapse - Thursday", "Full Collapse"],
        ["9. Nothing Feels Good - The Promise Ring", "Nothing Feels Good"],
        ["10. Burritos, Inspiration Point, Fork Balloon Sports, Cards In The Spokes, Automatic Biographies, Kites, Kung Fu, Trophies, Banana Peels We've Slipped On And Egg Shells We've Tippy Toed Over (Shmap'n Shmazz) - Cap'n Jazz", "Shmap'n Shmazz"]
    ]
    
    let grunge: [[String]] = [
        ["1. Nevermind - Nirvana", "Nevermind"],
        ["2. Badmotorfinger - Soundgarden", "Badmotorfinger"],
        ["3. Ten - Pearl Jam", "Ten (Pearl Jam album)"],
        ["4. Dirt - Alice In Chains", "Dirt (Alice in Chains album)"],
        ["5. Superfuzz Bigmuff - Mudhoney", "Superfuzz Bigmuff"],
        ["6. Siamese Dream - Smashing Pumpkins", "Siamese Dream"],
        ["7. Temple Of The Dog - Temple Of The Dog", "Temple of the Dog (album)"],
        ["8. Live Through This - Hole", "Live Through This"],
        ["9. In Utero - Nirvana", "In Utero"],
        ["10. Bleach - Nirvana", "Bleach (Nirvana album)"]
    ]
}
