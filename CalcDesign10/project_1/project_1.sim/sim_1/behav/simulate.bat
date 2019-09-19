@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim TB_myCalc_behav -key {Behavioral:sim_1:Functional:TB_myCalc} -tclbatch TB_myCalc.tcl -view C:/Users/lab/Documents/DigitalSystems/Thursday/CalcDesign10/project_1/TB_myCalc_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
