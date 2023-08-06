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
        ["1. Kala - M.I.A.", "Kala_(album)", "Kala"],
        ["2. Robyn - Robyn", "Robyn_(album)", "Robyn"],
        ["3. Plunge - Fever Ray", "Plunge_(album)", "Plunge"],
        ["4. Anniemal - Annie", "Anniemal", "Anniemal"],
        ["5. Hopelessness - ANOHNI", "Hopelessness_(album)", "Hopelessness"],
        ["6. Violator - Depeche Mode", "Violator_(album)", "Violator"],
        ["7. The Pleasure Principle - Gary Numan", "The_Pleasure_Principle_(album)", "The Pleasure Principle"],
        ["8. Power Corruption & Lies - New Order", "Power,_Corruption_%26_Lies", "Power, Corruption & Lies"],
        ["9. Chaleur Humaine - Christine And The Queens", "Chaleur_humaine", "Chaleur humaine"],
        ["10. A New Chance - The Tough Alliance", "A_New_Chance", "A New Chance"]
    ]
    
    let punk: [[String]] = [
        ["1. Ramones - Ramones", "Ramones_(album)", "Ramones"],
         ["2. Never Mind The Bollocks - The Sex Pistols", "Never_Mind_the_Bollocks,_Here%27s_the_Sex_Pistols", "Never Mind the Bollocks, Here's the Sex Pistols"],
          ["3. Fresh Fruit For Rotting Vegetables - Dead Kennedys", "Fresh_Fruit_for_Rotting_Vegetables", "Fresh Fruit for Rotting Vegetables"],
           ["4. The Clash - The Clash", "The_Clash_(album)", "The Clash"],
        ["5. Damaged - Black Flag", "Damaged_(Black_Flag_album)", "Damaged"],
        ["6. Double Nickels On The Dime - Minutemen", "Double_Nickels_on_the_Dime", "Double Nickels on the Dime"],
        ["7. Bad Brains - Bad Brains", "Bad_Brains_(album)", "Bad Brains"],
        ["8. Funhouse - The Stooges", "Fun_House_(The_Stooges_album)", "Fun House"],
        ["9. Static Age - Misfits", "Static_Age", "Static Age"],
        ["10. Out Of Step - Minor Threat", "Minor_Threat_(album)", "Minor Threat"]
    ]

    let pop: [[String]] = [
        ["1. Thriller - Michael Jackson", "Thriller_(album)", "Thriller"],
        ["2. 1999 - Prince", "1999_(Prince_album)", "1999"],
        ["3. Like A Prayer - Madonna", "Like_a_Prayer_(album)", "Like a Prayer"],
        ["4. Arrival - ABBA", "Arrival_(ABBA_album)", "Arrival"],
        ["5. Bad Girls - Donna Summers", "Bad_Girls_(Donna_Summer_album)", "Bad Girls"],
        ["6. Spice - The Spice Girls", "Spice_(album)", "Spice"],
        ["7. Come On Over - Shania Twain", "Come_On_Over", "Come On Over"],
        ["8. Taylor Swift - Taylor Swift", "Taylor_Swift_(album)", "Taylor Swift"],
        ["9. The Fame Monster - Lady Gaga", "The_Fame_Monster", "The Fame Monster"],
        ["10. Hounds Of Love - Kate Bush", "Hounds_of_Love", "Hounds of Love"]
    ]
    
    let tripHop: [[String]] = [
        ["1. Dummy - Portishead", "Dummy_(album)", "Dummy"],
        ["2. Mezzanine - Massive Attack", "Mezzanine_(album)", "Mezzanine"],
        ["3. Maxinquaye - Tricky", "Maxinquaye", "Maxinquaye"],
        ["4. Smokers Delight - Nightmares On Wax", "Smokers_Delight", "Smokers Delight"],
        ["5. Psyence Fiction - UNKLE", "Psyence_Fiction", "Psyence Fiction"],
        ["6. Endtroducing... - DJ Shadow", "Endtroducing...", "Endtroducing..."],
        ["7. Blue Lines - Massive Attack", "Blue_Lines", "Blue Lines"],
        ["8. Who Can You Trust? - Morcheeba", "Who_Can_You_Trust%3F_(album)", "Who Can You Trust?"],
        ["9. Sounds From The Thievery Hi-Fi - Thievery Corporation", "Sounds_from_the_Thievery_Hi-Fi", "Sounds from the Thievery Hi-Fi"],
        ["10. Sounds Of The Satellites - Laika", "Sounds_of_the_Satellites", "Sounds of the Satellites"]
    ]
    
    let rock: [[String]] = [
        ["1. Revolver - The Beatles", "Revolver_(Beatles_album)", "Revolver"],
        ["2. Are You Experienced - Jimi Hendrix", "Are_You_Experienced", "Are You Experienced"],
        ["3. Abbey Road - The Beatles", "Abbey_Road", "Abbey Road"],
        ["4. The Doors - The Doors", "The_Doors_(album)", "The Doors"],
        ["5. Led Zeppelin IV - Led Zeppelin", "Led_Zeppelin_IV", "Led Zeppelin IV"],
        ["6. The Dark Side Of The Moon - Pink Floyd", "The_Dark_Side_of_the_Moon", "The Dark Side of the Moon"],
        ["7. Back In Black - AC/DC", "Back_in_Black", "Back in Black"],
        ["8. Exile On Main St. - The Rolling Stones", "Exile_on_Main_St.", "Exile on Main St."],
        ["9. Born To Run - Bruce Springsteen", "Born_to_Run", "Born to Run"],
        ["10. The Rise And Fall Of Ziggy Stardust And The Spiders From Mars - David Bowie", "The_Rise_and_Fall_of_Ziggy_Stardust_and_the_Spiders_from_Mars", "The Rise and Fall of Ziggy Stardust and the Spiders from Mars"]
    ]
    
    let soul: [[String]] = [
        ["1. Live At The Apollo - James Brown", "Live_at_the_Apollo_(1963_album)", "Live at the Apollo"],
        ["2. Songs In The Key Of Life - Stevie Wonder", "Songs_in_the_Key_of_Life", "Songs in the Key of Life"],
        ["3. What's Going On - Marvin Gaye", "What%27s_Going_On_(Marvin_Gaye_album)", "What's Going On"],
        ["4. Stand! - Sly & The Family Stone", "Stand!", "Stand!"],
        ["5. I Never Loved A Man The Way I Love You - Aretha Franklin", "I_Never_Loved_a_Man_the_Way_I_Love_You", "I Never Loved a Man the Way I Love You"],
        ["6. The Genius Of Ray Charles - Ray Charles", "The_Genius_of_Ray_Charles", "The Genius of Ray Charles"],
        ["7. Voodoo - D'Angelo", "Voodoo_(D%27Angelo_album)", "Voodoo"],
        ["8. Innervisions - Stevie Wonder", "Innervisions", "Innervisions"],
        ["9. In Person - Ray Charles", "Ray_Charles_in_Person", "In Person"],
        ["10. Let's Stay Together - Al Green", "Let%27s_Stay_Together_(Al_Green_album)", "Let's Stay Together"]
    ]
    
    let electroHouse: [[String]] = [
        ["1. Cross - Justice", "Cross_(Justice_album)", "Cross"],
        ["2. Destroy Rock & Roll - Mylo", "Destroy_Rock_%26_Roll", "Destroy Rock & Roll"],
        ["3. Army Of Mushrooms - Infected Mushroom", "Army_of_Mushrooms", "Army of Mushrooms"],
        ["4. Clarity - Zedd", "Clarity_(Zedd_album)", "Clarity"],
        ["5. Essential - Soulwax", "Soulwax#Albums", "Soulwax"],
        ["6. Alternative Light Source - Leftfield", "Alternative_Light_Source", "Alternative Light Source"],
        ["7. Generation Hexed - Drums Of Death", "Generation_Hexed", "Generation Hexed"],
        ["8. OutRun - Kavinsky", "OutRun_(album)", "OutRun"],
        ["9. Aleph - Gesaffelstein", "Aleph_(album)", "Aleph"],
        ["10. 4x4=12 - Deadmau5", "4×4%3D12", "4×4=12"]
    ]
    
    let hipHop: [[String]] = [
        ["1. The Chronic - Dr. Dre", "The_Chronic", "The Chronic"],
        ["2. Illmatic - Nas", "Illmatic", "Illmatic"],
        ["3. It Takes A Nation Of Millions To Hold Us Back - Public Enemy", "It_Takes_a_Nation_of_Millions_to_Hold_Us_Back", "It Takes a Nation of Millions to Hold Us Back"],
        ["4. Ready To Die - The Notorious B.I.G.", "Ready_to_Die", "Ready to Die"],
        ["5. Enter The Wu-Tang (36 Chambers) - Wu-Tang Clan", "Enter_the_Wu-Tang_(36_Chambers)", "Enter the Wu-Tang (36 Chambers)"],
        ["6. Paul's Boutique - Beastie Boys", "Paul%27s_Boutique", "Paul's Boutique"],
        ["7. Midnight Marauders - A Tribe Called Quest", "Midnight_Marauders", "Midnight Marauders"],
        ["8. 3 Feet High And Rising - De La Soul", "3_Feet_High_and_Rising", "3 Feet High and Rising"],
        ["9. Gangster Chronicle - London Posse", "Gangster_Chronicle", "Gangster Chronicle"],
        ["10. All Eyez On Me - 2Pac", "All_Eyez_on_Me", "All Eyez on Me"]
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
        ["1. Millions Now Living Will Never Die - Tortoise", "Millions_Now_Living_Will_Never_Die", "Millions Now Living Will Never Die"],
        ["2. Spiderland - Slint", "Spiderland", "Spiderland"],
        ["3. Hex - Bark Psychosis", "Hex_(Bark_Psychosis_album)", "Hex"],
        ["4. Laughing Stock - Talk Talk", "Laughing_Stock", "Laughing Stock"],
        ["5. Young Team - Mogwai", "Mogwai_Young_Team", "Young Team"],
        ["6. F♯ A♯ ∞ - Godspeed You! Black Emperor", "F♯_A♯_∞", "F♯ A♯ ∞"],
        ["7. Ágætis byrjun - Sigur Ros", "Ágætis_byrjun", "Ágætis byrjun"],
        ["8. Spirit Of Eden - Talk Talk", "Spirit_of_Eden", "Spirit of Eden"],
        ["9. China Gate - Cul De Sac", "China_Gate_(album)", "China Gate"],
        ["10. Mirrored - Battles", "Mirrored", "Mirrored"]
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
