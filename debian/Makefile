#! /bin/sh
# This makefile "only" invokes the upstream building sequence. It does not
# install anything itself.
CC=gcc

### Upstream File Structure ###
# This Makefile was intended to be placed in the debian folder, which in turn 
# is placed under the upstream's tree root.
ROOT_DIR=$(shell cd .; pwd)

# Build directories are hardcoded by upstream. Therefore the following
# variables shouldn't be changed nor customised.
INCLUDE_DIR=$(ROOT_DIR)/include
LIB_DIR=$(ROOT_DIR)/lib
EXE_DIR=$(ROOT_DIR)/exe
SOURCES_DIR=$(ROOT_DIR)/src
EXE_SRCS=brief chrnos ckbref commnt frmdif inspkt mkspk msopck spacit \
         spkdif spkmrg tobin toxfr versn
LIB_SRCS=cspice csupport

# Upstream ships individual build scripts for each executable. However, a
# common file is used in case modifing upstream's script is needed.
COMMON_EXE=$(SOURCES_DIR)/brief_c/mkprodct.csh
EXECUTABLES=brief chronos ckbrief commnt frmdiff inspekt mkspk msopck \
            spacit spkdiff spkmerge tobin toxfr version
COOK=simple states subpt tictoc
LIBRARIES=cspice.a csupport.a

### Compiler Flags ###
# Compiler flags are harcoded by upstream. This Makefile allows for some
# custimization and accepts standard CC and CFLAGS
COMMON_CFLAGS=-ansi -O2 -DNON_UNIX_STDIO -I$(INCLUDE_DIR) \
              -I$(ROOT_DIR)/debian $(CFLAGS) $(CPPFLAGS)
COMMON_LFLAGS=$(CFLAGS) $(LDFLAGS) -lm

build: build-exe build-cook
build-lib: builddirs $(addprefix $(LIB_DIR)/,$(LIBRARIES))
build-exe: build-lib $(addprefix $(EXE_DIR)/,$(EXECUTABLES))
build-cook: build-lib $(addprefix $(EXE_DIR)/,$(COOK))

$(addprefix $(LIB_DIR)/,$(LIBRARIES)):
	@for idir in $(LIB_SRCS) ; do \
		export TKCOMPILER="$(CC)"; \
		export TKCOMPILEOPTIONS="-c -fPIC -DUIOLEN_int $(COMMON_CFLAGS)"; \
		export TKLINKOPTIONS="$(COMMON_LFLAGS)"; \
		cd $(SOURCES_DIR)/$$idir; \
		csh mkprodct.csh; \
	done 

$(addprefix $(EXE_DIR)/,$(EXECUTABLES)):
	@for idir in $(EXE_SRCS) ; do \
		export TKCOMPILER="$(CC)"; \
		export TKCOMPILEOPTIONS="-c $(COMMON_CFLAGS)"; \
		export TKLINKOPTIONS="$(COMMON_LFLAGS)"; \
		echo "$(SOURCES_DIR)/"$$idir"_c"; \
		cd "$(SOURCES_DIR)/"$$idir"_c"; \
		csh $(COMMON_EXE); \
	done 

$(addprefix $(EXE_DIR)/,$(COOK)):
	@for idir in cook ; do \
		export TKCOMPILER="$(CC)"; \
		export TKCOMPILEOPTIONS="-c $(COMMON_CFLAGS)"; \
		export TKLINKOPTIONS="$(COMMON_LFLAGS)"; \
		echo "$(SOURCES_DIR)/"$$idir"_c"; \
		cd "$(SOURCES_DIR)/"$$idir"_c"; \
		csh mkprodct.csh; \
	done 

builddirs:
	@if [ ! -d $(EXE_DIR) ] ; then \
		mkdir $(EXE_DIR); \
	fi
	@if [ ! -d $(LIB_DIR) ] ; then \
		mkdir $(LIB_DIR); \
	fi

distclean:
	@rm -f $(EXE_DIR)/*
	@rm -f $(LIB_DIR)/*
