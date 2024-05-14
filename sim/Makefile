export TEST_NAME = AXI2MEM
FILE_LIST = $(TEST_NAME).f

PLATFORM = LINUX64
waveform = $(TEST_NAME).fsdb

all:clean vcs_make

vcs_make:
	vcs -R -full64	+v2k	-fsdb 	+define+FSDB -sverilog -f $(FILE_LIST) -l run.log -timescale=1ns/1ps

run_verdi:
	verdi 	-nologo	-sv -f	$(FILE_LIST) -ssf $(waveform) &

clean:
	rm -rf *fsdb*  *csrc* DVEfiles simv simv.daidir ucli.key novas* VCS* *dat xvlog* *.log ./../rtl/xvlog* ./../tb/xvlog*  xsim.dir ./../rtl/xsim.dir ./../tb/xsim.dir
