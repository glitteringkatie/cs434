#Tim Dufala
#CS434

EXE:=as1
REPORT:= as1report.pdf
#########################
#TARBALL VARIABLES
#########################

TARBALL:=${EXE}.tar.gz

#List of files to put in the tarball
FILES:=${EXE}.m regPlot.pdf Makefile housing_data.m housing_test.m ${REPORT}

#########################
#PHONY TARGETS
#########################

.PHONY: all clean submit unpack cleantest

all: ${EXE}

clean:
	rm -rf ${wildcard regPlot.pdf ${TARBALL}}

#Used to submit source tree
submit: ${EXE}
	tar -cjvf ${TARBALL} ${FILES}

#Used to open submission
unpack:
	tar -xjf ${TARBALL}

#########################
#EXPLICIT TARGETS
#########################

${EXE}: ${EXE}.m
	matlab -r ${EXE}

#########################
#TEST TARGETS/VARIABLES
#########################
#Has all test information
#All files should be in ${TESTDIR}
#${TESTOUTPUT} should be made
include ${TESTMAKE}

#########################
#INCLUDE DEPENDENCY INFO
#########################

-include ${SOURCE:%.c=%.d}
