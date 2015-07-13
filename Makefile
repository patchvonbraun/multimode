PYTHONPATH:=.:$(PYTHONPATH)
export PYTHONPATH
EXES=multimode.py multimode_helper.py
LIBS=multimode_helper.py
THESTUFF=$(LIBS) multimode.grc Makefile README
multimode.py: multimode.grc
	@echo Using $(PYTHONPATH) for compile...
	grcc -d . multimode.grc
	
install: multimode.py
	-mkdir -p $(HOME)/bin
	cp $(EXES) $(HOME)/bin
	cp $(LIBS) $(HOME)/bin
	@echo Please make sure your PYTHONPATH includes $(HOME)/bin
	@echo And also that PATH includes $(HOME)/bin
	@echo this will allow multimode to work correctly

clean:
	rm -f multimode.py
	rm -f multimode.pyc


tarball:
	tar czvf multimode-$(VERSION).tar.gz $(THESTUFF)
