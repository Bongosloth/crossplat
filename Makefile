WIN = windows
LIN = linux
MAC = mac
SCRIPT = game.py
WIN_EXE = --onefile $(SCRIPT) --distpath $(WIN) --workpath $(WIN) --specpath $(WIN) --clean
LIN_EXE = --onefile $(SCRIPT) --distpath $(LIN) --workpath $(LIN) --specpath $(LIN) --clean
MAC_EXE = --onefile $(SCRIPT) --distpath $(MAC) --workpath $(MAC) --specpath $(MAC) --clean

windows:
	mkdir $(WIN)
	pip install pyinstaller
	pyinstaller $(WIN_EXE)
	./$(WIN)/game.exe

linux:
	mkdir $(LIN)
	pip install pyinstaller
	pyinstaller $(LIN_EXE)
	./$(LIN)/game

mac:
	mkdir $(MAC)
	pip3 install pyinstaller
	pyinstaller $(MAC_EXE)
	./$(MAC)/game

web:
	open http://localhost:8000/game.html
	python3 -m http.server 8000
