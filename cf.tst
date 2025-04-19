import os

i4 = "Y"

c = None
a = open("cf.tst", "r")
b = open("main.py", "r")

def scandisk():
    print("Starting Scandisk...")
    print("Finding the problem..")
    if not a == b:
        print("Scandisk MAY found the problem:")
        d = input("Does Bernu launch Scandisk because one of core files has been edited? If yes, then type Y.. ")
        if d == "Y":
            print("Perfect! This means that the reference file is NOT identical at the reference file.")
            e = input("Do you want to fix Bernu core files? If yes, then type Y.. ")
            if e == "Y":
                os.remove("cf.tst")
                with open("cf.tst", 'w') as file:
                    file.write(b.read())
    else:
        print("No problem found!!")
                    
            

with open('cf.tst', 'r') as ref, open('main.py', 'r') as test:
    if ref.read() == test.read():
        print()
    else:
        print("WARNING: A Bernu core file has been edited. You may got a virus. Reflashing Bernu MAY be obbligatory if you encounter problems..")
        while not c == "i understand":
            c = input("Type in 'i understand' to continue using Bernu: ")
            scandisk()
    

while True:
    c = input("Enter a Bernu command: ")
    if c == "VER":
        print("Bernu v? on microbit")
    if c == "EDIT":
        i = input("New File (N) or Existing File? (E) ")
        if i == "N":
            i2 = input("Name the new file: ")
            with open(i2, 'w') as file:
                while i4 == "Y":
                    i3 = input("Insert the content of your new file: ")
                    file.write(i3 + "\n")
                    i4 = input("Do you need to insert another line? If yes, then type Y.. ")
        elif i == "E":
            i5 = input("Name the existing file: ")
            if i5 == "main.py":
                print("WARNING: Editing core files of Bernu is EXTREMELY DANGEROUS! And can result in a Exception-Bricked installation of Bernu, to accept, press ENTER. If not, press 'RESET' on your micro:bit hardware")
                input()
            try:
                with open(i5, 'r') as file:
                    print()
                with open(i5, 'w') as file:
                    i6 = input("You want to delete this file? If yes, then type Y.. ")
                    if i6 == "Y":
                        os.remove(i5)
                    else:
                        while i4 == "Y":
                            i3 = input("Insert the content that you want to add: ")
                            file.write("\n" + i3)
                            i4 = input("Do you need to insert another line? If yes, then type Y.. ")
            except OSError:
                print("non-existent file or unknown error.")
            
    if c == "SEE":
        i8 = input("Type in what file to see: ")
        f = open(i8, "r")
        print(f.read())
        
    if c == "EXIT":
        while True:
            input()
            
    if c == "UGR":
        print("This software can help you upgrade Bernu.")
        print("But some downside can appear.")
        i9 = input("See Downsides (S) or Begin Upgrade? (U): ")
        if i9 == "S":
            print("• Bernu MAY be corrupted (Can be fixed)")
            print("• Package that you got may not include the next version and may downgrade you (For that reason, check the package metadata)")
        elif i9 == "U":
            i10 = input("Now name the the .py to start (NAME ONLY THE FILE NAME!!): ")
            try:
                __import__(i10)
            except Exception as e:
                print(e, ": Did you name only the filename?")
            