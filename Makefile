ifeq ($(DEBUG),yes)
  OPTIMIZE_FLAG = -O0 -g -DDEBUG
else
  OPTIMIZE_FLAG = -O3
endif


BINS = fib_seq fib_threads 2threads 2threads-2 counter async \
       counter_atomic counter_mutex counter_lock_guard \
       condvar producer_consumer \
       readwrite-simple readwrite-better readwrite-best
DEPS = $(OBJS:.o=.d)
CXX = g++
CXXFLAGS = -std=c++14 -Wall -MMD -MP $(OPTIMIZE_FLAG)
LDLIBS = -pthread 

UNAME_OS := $(shell uname -s)

ifneq ($(UNAME_OS), Darwin)
  LDFLAGS += -lrt
endif



all: $(BINS)

%: %.cpp 
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $< -o $@.bin $(LDLIBS)
		
%.d: %.cpp

clean:
	-rm -f ./bin/* *.d
	
-include $(DEPS)
ifeq ($(DEBUG),yes)
  OPTIMIZE_FLAG = -O0 -g -DDEBUG
else
  OPTIMIZE_FLAG = -O3
endif


