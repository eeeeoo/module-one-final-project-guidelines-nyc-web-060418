
tashawn = Teacher.create(name: "Tashawn", email: "tashawn@ironschool.com", password: "stylingAlways")
graham = Teacher.create(name: "Graham", email: "graham@ironschool.com", password: "2beHappy")
andrew = Teacher.create(name: "Andrew", email: "andrew@ironschool.com", password: "xpressThyself")
zach = Teacher.create(name: "Zach", email: "zach@ironschool.com", password: "code4Ever")


jee = Student.create(name: "Jee", email: "jee@ironschool.com", password: "matchaLatte")
alex = Student.create(name: "Alex", email: "alex@ironschool.com", password: "dogsRgr8")
brad = Student.create(name: "Brad", email: "brad@ironschool.com", password: "loveCalculus")
isaac = Student.create(name: "Isaac", email: "isaac@ironschool.com", password: "dope4life")


calc1 = Course.create(name: "Calculus I", teacher: andrew, student: brad)
art = Course.create(name: "Art", teacher: zach, student: jee)
swimming = Course.create(name: "Swimming", teacher: tashawn, student: alex)
cs101 = Course.create(name: "Computer Science 101", teacher: graham, student: jee)
chem = Course.create(name: "Chemistry", teacher: tashawn, student: isaac)
music = Course.create(name: "Music 101", teacher: graham, student: jee)
philosophy = Course.create(name: "Philosophy", teacher: zach, student: alex)
theatre = Course.create(name: "Theatre", teacher: andrew, student: brad)


## Tashawn
tashawn.add_assignment(swimming, "Butterfly", "Fly like a butterfly.")
tashawn.add_assignment(swimming, "Butterfly II", "Practice!")
tashawn.add_announcement(swimming, "Swim Practice", "Mondays & Wednesdays from 4:30.")
tashawn.add_announcement(swimming, "Extra Help: Butterfly", "We will hold extra butterful practice sessions on Saturday!")
tashawn.add_note(swimming, "Butterfly", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
tashawn.add_note(swimming, "Free-Form", "Lorem ipsum dolor amet chillwave distillery vice, beard occupy before they sold out live-edge humblebrag 90's. Sartorial +1 vape VHS biodiesel neutra banh mi cronut la croix ugh gentrify. Readymade crucifix salvia chambray. Pug tacos lo-fi forage lomo hexagon polaroid iceland food truck.")

tashawn.add_assignment(chem, "H2O", "Read page 350-360")
tashawn.add_assignment(chem, "CO2", "Read page 368-380")
tashawn.add_announcement(chem, "H2O Party", "Party will be held at the school pool area at 2PM on Friday!")
tashawn.add_announcement(chem, "CO2 Film", "A movie on how CO2 will be shown in the library on Friday at 5pm.")
tashawn.add_note(chem, "H2O Lecture", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
tashawn.add_note(chem, "CO2 Lecture", "Gun square-rigged Sail ho marooned jack careen topmast crimp run a shot across the bow black spot. Holystone ballast run a shot across the bow handsomely sheet trysail Jack Ketch Sea Legs starboard lanyard. Deadlights splice the main brace case shot marooned ho Blimey rutters Davy Jones' Locker clipper boatswain.")

## Andrew
andrew.add_assignment(calc1, "Integrals", "Pg 24-25 #12-24 ALL")
andrew.add_assignment(calc1, "Graphing Circles", "Pg 32-33 #20-32 EVEN")
andrew.add_announcement(calc1, "Calc Team", "Join our pro Calc Team and get free pizza.")
andrew.add_announcement(calc1, "Pie Day 6/28", "Sharing is caring, bring some pie to share with our class.")
andrew.add_note(calc1, "Lecture 06/24 -- Cats & Calc", "
 			Chase laser jump five feet high and sideways when a shadow moves or destroy the blinds. Leave fur on owners clothes woops poop hanging from butt must get rid run run around house drag poop on floor maybe it comes off woops left brown marks on floor human slave clean lick butt now or groom forever, stretch tongue and leave it slightly out, blep lick butt and make a weird face for ask to go outside and ask to come inside and ask to go outside and ask to come inside and destroy house in 5 seconds or sniff all the things. Disappear for four days and return home with an expensive injury; bite the vet meow to be let out unwrap toilet paper caticus cuteicus but cough furball.")
andrew.add_note(calc1, "Lecture 06/26", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")

andrew.add_assignment(theatre, "R & J Part 3", "Read page 50-80")
andrew.add_assignment(theatre, "R & J Part 4", "Read page 81-95")
andrew.add_announcement(theatre, "R & J Practice", "Party will be held at the school pool area at 2PM on Friday!")
andrew.add_announcement(theatre, "R & J Movie", "Just a heads up that for next class we will watch scenes from the Romeo & Juliet film.")
andrew.add_note(theatre, "R & J Forshadowing", "Dont wait for the storm to pass, dance in the rain knock dish off table head butt cant eat out of my own dish stare at wall turn and meow stare at wall some more meow again continue staring hiss at vacuum cleaner or eat an easter feather as if it were a bird then burp victoriously, but tender. Rub whiskers on bare skin act innocent.")
andrew.add_note(theatre, "R & J Reflections", "No… It's a thing; it's like a plan, but with more greatness. I'm the Doctor. Well, they call me the Doctor. I don't know why. I call me the Doctor too. I still don't know why. No, I'll fix it. I'm good at fixing rot. Call me the Rotmeister. No, I'm the Doctor. Don't call me the Rotmeister.")

#Zach
zach.add_assignment(art, "3D Art", "3D Assignemnt with Rhino")
zach.add_assignment(art, "4D Art", "4D Assignemnt with Reality")
zach.add_note(art, "Lecture: 3D Art", "360 degree transformation")
zach.add_note(art, "Lecture: 4D Art", "360 degree transformation")
zach.add_announcement(art, "3D Art Lecture Cancellation", "No class on Monday")
zach.add_announcement(art, "4D Art Show", "Art show will be help on Saturday at 10 AM.")

zach.add_assignment(philosophy, "Descartes", "Read page 30-100")
zach.add_assignment(philosophy, "Plato", "Read page 131-170")
zach.add_note(philosophy, "Lecture: Descartes", "I think, therefore I am")
zach.add_note(philosophy, "Lecture: Plato", "Human behavior flows from three main sources: desire, emotion, and knowledge.")
zach.add_announcement(philosophy, "Descartes", "No class on Monday")
zach.add_announcement(philosophy, "Plato Skit", "Skits will be presented next week on Tuesday!")

#graham
graham.add_assignment(music, "Hiphop", "Research Influence of Jazz")
graham.add_assignment(music, "Lo-fi", "Research how lo-fi came about")
graham.add_note(music, "Lecture: Hiphop", "Miles Davis and Bibop")
graham.add_note(music, "Lecture: Lo-fi", "A lot of lofi track are heavily inspirated by (or build around) some beats from artists like J Dilla , MF Doom, and many other Hip Hop artists from the 80s and 90s; This tracks tend to be called \"Lofi Hip Hop\" and are one of varius subgenres of the Lofi culture.")
graham.add_announcement(music, "Hiphop", "Bring your instruments")
graham.add_announcement(music, "Lo-fi", "Lo-fi contest will be help Thursday at 5 PM.")

graham.add_assignment(cs101, "OOP", "OOP and ANT")
graham.add_assignment(cs101, "ORM", "Work on labs on the Learn platform.")
graham.add_note(cs101, "Lecture on OOP", "Classes and Objects")
graham.add_note(cs101, "Lecture on ORM", "ORM is a technique used to connect Ruby programs to databases.")
graham.add_announcement(cs101, "OOP", "Bring your laptops")
graham.add_announcement(cs101, "ORM", "ORM review will be held on Tuesday!.")
