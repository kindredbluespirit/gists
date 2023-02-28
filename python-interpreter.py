## Interpreter in python actually, not literally the python interpreter!
## Taken from ChatGPT, hence the code sanity.

import signal

def sigint_handler(signum, frame):
    print("Keyboard interrupt (Ctrl+C) detected")

def sigterm_handler(signum, frame):
    print("Termination signal (SIGTERM) detected")
    exit(0)

def sighup_handler(signum, frame):
    print("Hangup signal (SIGHUP) detected")
    exit(0)

def sigquit_handler(signum, frame):
    print("Quit signal (SIGQUIT) detected")
    exit(0)

signal.signal(signal.SIGINT, sigint_handler)
signal.signal(signal.SIGTERM, sigterm_handler)
signal.signal(signal.SIGHUP, sighup_handler)
signal.signal(signal.SIGQUIT, sigquit_handler)

while True:
    try:
        user_input = input(">>> ")
    except EOFError:
        print("Exiting...")
        break
