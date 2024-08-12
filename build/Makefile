all: ../piopera ../sendiq ../tune

CFLAGS	?= -Wall -g -O2 -Wno-unused-variable
CXXFLAGS ?= -std=c++11 -Wall -g -O2 -Wno-unused-variable
LDFLAGS ?= -L/opt/vc/lib
LDFLAGS += -lrpitx -lm -lrt -lpthread
CXX ?= c++
CC ?= cc

CFLAGS_Pissb	= -Wall -g -O2 -Wno-unused-variable
LDFLAGS_Pissb	= $(LDFLAGS) -lsndfile -lliquid

../piopera : opera.cpp 
	$(CXX) $(CXXFLAGS) -o ../piopera opera.cpp  $(LDFLAGS)

../sendiq : sendiq.cpp 
	$(CXX) $(CXXFLAGS) -o ../sendiq sendiq.cpp  $(LDFLAGS)

../tune : tune.cpp 
	$(CXX) $(CXXFLAGS) -o ../tune tune.cpp  $(LDFLAGS)

clean:
	rm -f  ../sendiq ../tune ../piopera

install: all
	install -m 0755 ../piopera /usr/bin
	install -m 0755 ../sendiq /usr/bin
	install -m 0755 ../tune /usr/bin
