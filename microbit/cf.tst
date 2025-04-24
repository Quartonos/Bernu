import os
from microbit import *
import music
import bjson


def ls(path="settings.json"):
    try:
        with open(path) as f:
            return bjson.loads(f.read())
    except:
        return {}
    
def sas(settings, path="settings.json"):
    with open(path, "w") as f:
        f.write(bjson.dumps(settings))

def ss(key, value, path="settings.json"):
    settings = load_settings(path)
    settings[key] = value
    ss(settings)

def gbs(settings, key, default=False):
    value = settings.get(key, default)
    if isinstance(value, str):
        if value.lower() == "true":
            return True
        elif value.lower() == "false":
            return False
    return value

def cs(key, value, path="settings.json"):
    settings = ls(path)
    settings[key] = value
    sas(settings)
    


settings = ls()

IM1 = Image(
    "10100:"
    "02020:"
    "00303:"
    "04040:"
    "00505"
)

IM2 = Image(
    "54321:"
    "50001:"
    "54321:"
    "50001:"
    "54321:"
)

i4 = "Y"

display.show([IM1, IM2], loop=False, delay=1000)
ref = open('cf.tst', 'r')
test = open('main.py', 'r')

c = None
a = open("cf.tst", "r")
b = open("main.py", "r")

if gbs(settings, "start", True):
    music.play(['A5:1', 'C4:2', 'F4:2', 'C4:4', 'A5:2'])

def scandisk():
    a = open("cf.tst", "r")
    b = open("main.py", "r")
    print("Starting Scandisk...")
    print("Finding the problem..")
    if not a == b:
        print("Scandisk MAY found the problem:")
        d = input("Does Bernu launch Scandisk because one of core files has been edited? If yes, then type Y.. ")
        if d == "Y":
            print("Perfect! This means that the reference file is NOT identical at the Bernu Core file.")
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
        try:
            f = open(i8, "r")
            print(f.read())
        except Exception:
            print("error.")
        
    if c == "DRV":
        print("This software can help you run .py programs")
        print("For example, you name the filename of the .py program and will run.")
        print("Just remember that the .py program should not have required PyPI Libraries.")
        try:
            __import__(input("Name the filename of the .py to start: "))
        except Exception:
            print("unknown  error")
        
            
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
                break
            
    if c == "PY":
        print("To return to Bernu, type 'import main'")
        break
    
    if c == "SET":
        print("Welcome to Bernu Settings!")
        print("1. Startup Noise")
        i11 = input("What option do you want to edit?")
        if i11 == "1":
            print("'OFF' or 'ON'?")
            i12 = input("Respond.. ")
            if i12 == "ON":
                cs("start", True)
            elif i12 == "OFF":
                cs("start", False)
            break

 
            