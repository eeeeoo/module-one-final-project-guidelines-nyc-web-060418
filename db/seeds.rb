
tashawn = Teacher.create(name: "Tashawn", email: "tashawn@ironschool.com")
graham = Teacher.create(name: "Graham", email: "graham@ironschool.com")
andrew = Teacher.create(name: "Andrew", email: "andrew@ironschool.com")
zach = Teacher.create(name: "Zach", email: "zach@ironschool.com")


jee = Student.create(name: "Jee", email: "jee@ironschool.com")
alex = Student.create(name: "Alex", email: "alex@ironschool.com")
brad = Student.create(name: "Brad", email: "brad@ronschool.com")
isaac = Student.create(name: "Isaac", email: "isaac@ironschool.com")


calc1 = Course.create(name: "Calculus I", teacher: andrew, student: brad)
art = Course.create(name: "Art", teacher: zach, student: jee)
swimming = Course.create(name: "Swimming", teacher: tashawn, student: brad)
cs101 = Course.create(name: "Computer Science 101", teacher: graham, student: jee)
chem = Course.create(name: "Chemistry", teacher: tashawn, student: isaac)
music = Course.create(name: "Music 101", teacher: graham, student: jee)
philosophy = Course.create(name: "Philosophy", teacher: zach, student: alex)
theatre = Course.create(name: "Theatre", teacher: andrew, student: brad)


## Tashawn
tashawn.add_assignment(swimming, "Butterfly", "fly")
tashawn.add_announcement(swimming, "Butterfly", "Happening Now")
tashawn.add_note(swimming, "Butterfly", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
tashawn.add_assignment(chem, "H2O", "Read page 350-360")
tashawn.add_announcement(chem, "H2O Party", "Party will be held at the school pool area at 2PM on Friday!")
tashawn.add_note(chem, "H2O Lecture", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")

## Andrew
andrew.add_assignment(calc1, "Butterfly", "fly")
andrew.add_announcement(calc1, "Butterfly", "Happening Now")
andrew.add_note(calc1, "Lecture 10/08", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
andrew.add_assignment(theatre, "R & J", "Read page 50-80")
andrew.add_announcement(theatre, "R & J Practice", "Party will be held at the school pool area at 2PM on Friday!")
andrew.add_note(theatre, "R & J Forshadowing", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")

#Zach
zach.add_assignment(art, "3D Art", "3D Assignemnt with Rhino")
zach.add_note(art, "3D Art", "360 degree transformation")
zach.add_assignment(philosophy, "Descartes", "Read page 30-100")
zach.add_note(philosophy, "Descartes", "I think, therefore I am")
zach.add_announcement(art, "3D Art", "No class on Monday")
zach.add_announcement(philosophy, "Descartes", "No class on Monday")

#graham
zach.add_assignment(music, "Hiphop", "Research Influence of Jazz")
zach.add_note(music, "Hiphop", "Miles Davis and Bibop")
zach.add_announcement(music, "Hiphop", "Bring your instruments")
zach.add_assignment(cs101, "OOP", "OOP and ANT")
zach.add_note(cs101, "OOP", "Classes and Objects")
zach.add_announcement(cs101, "OOP", "Bring your laptops")
