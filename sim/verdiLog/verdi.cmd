debImport "-sv" "-f" "AXI2MEM.f"
debLoadSimResult /tmp/.X11-unix/AXI2MEM/sim/AXI2MEM.fsdb
wvCreateWindow
verdiSetFont -font "Bitstream Vera Sans" -size "18"
verdiSetFont -monoFont "Courier" -monoFontSize "18"
paSetPreference -showPowerState off
simSetInteractiveFsdbFile inter.fsdb
simSetSimMode on
srcSetPreference -filterPowerAwareInstruments off -profileTime off
tbvSetPreference -dynamicDumpMDA 1 -dynamicDumpStruct 1 -dynamicDumpSystemCStruct \
           1 -dynamicDumpSystemCPlain 1 -dynamicDumpSystemCFIFO 1
verdiDockWidgetHide -dock windowDock_nWave_2
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "AXI2MEM_tb.u_AXI2MEM_top" -delim "."
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top" -win $_nTrace1
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "AXI2MEM_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "AXI2MEM_tb" -delim "."
srcHBSelect "AXI2MEM_tb" -win $_nTrace1
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "AXI2MEM_tb.u_AXI2MEM_top" -delim "."
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {8 56 1 1 1 1} -backward
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcTBFSDBMsgTogg
srcSignalView -on
srcCreateSourceTab -win $_nTrace1
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top" -win $_nTrace1
srcCloseSourceTab -win $_nTrace1 -tab 2
wvCreateWindow
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvCreateWindow
wvCloseWindow -win $_nWave5
wvCloseWindow -win $_nWave4
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 76 26 1834 396
wvResizeWindow -win $_nWave2 76 26 1834 1009
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 16
wvResizeWindow -win $_nWave2 76 26 1834 1009
wvResizeWindow -win $_nWave2 76 26 1834 1009
srcSetOptions -win $_nTrace1 -annotate on
schSetOptions -win $_nSchema1 -annotate on
schCreateWindow -hierFSM -win $_nSchema1 -mode all
schCloseWindow -win $_nSchema6
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 65
wvSelectGroup -win $_nWave2 {G1}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvCollapseGroup -win $_nWave2 "G1"
wvSelectGroup -win $_nWave2 {G1}
wvExpandGroup -win $_nWave2 "G1"
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G1}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 5 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 5 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 5 6 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 5 6 7 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 5 6 7 8 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 5 6 7 8 9 10 11 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 26)}
wvSetPosition -win $_nWave2 {("G1" 27)}
wvSetPosition -win $_nWave2 {("G1" 29)}
wvSetPosition -win $_nWave2 {("G1" 31)}
wvSetPosition -win $_nWave2 {("G1" 33)}
wvSetPosition -win $_nWave2 {("G1" 34)}
wvSetPosition -win $_nWave2 {("G1" 33)}
wvSetPosition -win $_nWave2 {("G1" 32)}
wvSetPosition -win $_nWave2 {("G1" 31)}
wvSetPosition -win $_nWave2 {("G1" 30)}
wvSetPosition -win $_nWave2 {("G1" 29)}
wvSetPosition -win $_nWave2 {("G1" 28)}
wvSetPosition -win $_nWave2 {("G1" 27)}
wvSetPosition -win $_nWave2 {("G1" 26)}
wvSetPosition -win $_nWave2 {("G1" 25)}
wvSetPosition -win $_nWave2 {("G1" 26)}
wvSetPosition -win $_nWave2 {("G1" 27)}
wvSetPosition -win $_nWave2 {("G1" 28)}
wvSetPosition -win $_nWave2 {("G1" 29)}
wvSetPosition -win $_nWave2 {("G1" 30)}
wvSetPosition -win $_nWave2 {("G1" 31)}
wvSetPosition -win $_nWave2 {("G1" 32)}
wvSetPosition -win $_nWave2 {("G1" 33)}
wvSetPosition -win $_nWave2 {("G1" 34)}
wvSetPosition -win $_nWave2 {("G1" 35)}
wvSetPosition -win $_nWave2 {("G1" 36)}
wvSetPosition -win $_nWave2 {("G1" 38)}
wvSetPosition -win $_nWave2 {("G1" 39)}
wvSetPosition -win $_nWave2 {("G1" 40)}
wvSetPosition -win $_nWave2 {("G1" 41)}
wvSetPosition -win $_nWave2 {("G1" 42)}
wvSetPosition -win $_nWave2 {("G1" 43)}
wvSetPosition -win $_nWave2 {("G1" 44)}
wvSetPosition -win $_nWave2 {("G1" 45)}
wvSetPosition -win $_nWave2 {("G1" 46)}
wvSetPosition -win $_nWave2 {("G1" 48)}
wvSetPosition -win $_nWave2 {("G1" 49)}
wvSetPosition -win $_nWave2 {("G1" 50)}
wvSetPosition -win $_nWave2 {("G1" 51)}
wvSetPosition -win $_nWave2 {("G1" 52)}
wvSetPosition -win $_nWave2 {("G1" 53)}
wvSetPosition -win $_nWave2 {("G1" 54)}
wvSetPosition -win $_nWave2 {("G1" 55)}
wvSetPosition -win $_nWave2 {("G1" 54)}
wvSetPosition -win $_nWave2 {("G1" 53)}
wvSetPosition -win $_nWave2 {("G1" 52)}
wvSetPosition -win $_nWave2 {("G1" 53)}
wvSetPosition -win $_nWave2 {("G1" 54)}
wvSetPosition -win $_nWave2 {("G1" 55)}
wvSetPosition -win $_nWave2 {("G1" 56)}
wvSetPosition -win $_nWave2 {("G1" 57)}
wvSetPosition -win $_nWave2 {("G1" 58)}
wvSetPosition -win $_nWave2 {("G1" 59)}
wvSetPosition -win $_nWave2 {("G1" 61)}
wvSetPosition -win $_nWave2 {("G1" 62)}
wvSetPosition -win $_nWave2 {("G1" 63)}
wvSetPosition -win $_nWave2 {("G1" 64)}
wvSetPosition -win $_nWave2 {("G1" 65)}
wvSetPosition -win $_nWave2 {("G1" 66)}
wvSetPosition -win $_nWave2 {("G1" 67)}
wvSetPosition -win $_nWave2 {("G1" 68)}
wvSetPosition -win $_nWave2 {("G1" 69)}
wvSetPosition -win $_nWave2 {("G1" 70)}
wvSetPosition -win $_nWave2 {("G1" 71)}
wvSetPosition -win $_nWave2 {("G1" 70)}
wvSetPosition -win $_nWave2 {("G1" 69)}
wvSetPosition -win $_nWave2 {("G1" 68)}
wvSetPosition -win $_nWave2 {("G1" 67)}
wvSetPosition -win $_nWave2 {("G1" 66)}
wvSetPosition -win $_nWave2 {("G1" 65)}
wvSetPosition -win $_nWave2 {("G1" 64)}
wvSetPosition -win $_nWave2 {("G1" 63)}
wvSetPosition -win $_nWave2 {("G1" 61)}
wvSetPosition -win $_nWave2 {("G1" 60)}
wvSetPosition -win $_nWave2 {("G1" 59)}
wvSetPosition -win $_nWave2 {("G1" 58)}
wvSetPosition -win $_nWave2 {("G1" 56)}
wvSetPosition -win $_nWave2 {("G1" 55)}
wvSetPosition -win $_nWave2 {("G1" 54)}
wvSetPosition -win $_nWave2 {("G1" 53)}
wvSetPosition -win $_nWave2 {("G1" 52)}
wvSetPosition -win $_nWave2 {("G1" 51)}
wvSetPosition -win $_nWave2 {("G1" 49)}
wvSetPosition -win $_nWave2 {("G1" 48)}
wvSetPosition -win $_nWave2 {("G1" 47)}
wvSetPosition -win $_nWave2 {("G1" 46)}
wvSetPosition -win $_nWave2 {("G1" 45)}
wvSetPosition -win $_nWave2 {("G1" 44)}
wvSetPosition -win $_nWave2 {("G1" 43)}
wvSetPosition -win $_nWave2 {("G1" 42)}
wvSetPosition -win $_nWave2 {("G1" 41)}
wvSetPosition -win $_nWave2 {("G1" 40)}
wvSetPosition -win $_nWave2 {("G1" 39)}
wvSetPosition -win $_nWave2 {("G1" 38)}
wvSetPosition -win $_nWave2 {("G1" 37)}
wvSetPosition -win $_nWave2 {("G1" 36)}
wvSetPosition -win $_nWave2 {("G1" 35)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -word -line 5 -pos 2 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {8 10 1 1 1 1} -backward
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectGroup -win $_nWave2 {G2}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {12 20 1 1 1 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {12 23 1 1 1 1} -backward
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSelectGroup -win $_nWave2 {G3}
wvSelectGroup -win $_nWave2 {G3}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {25 30 1 1 1 1} -backward
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 14)}
wvSetPosition -win $_nWave2 {("G2" 15)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSelectGroup -win $_nWave2 {G4}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {32 36 1 1 1 1} -backward
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSelectGroup -win $_nWave2 {G5}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {38 48 1 1 1 1} -backward
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 10)}
wvSetPosition -win $_nWave2 {("G5" 10)}
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {50 56 1 1 1 1} -backward
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 12)}
wvSetPosition -win $_nWave2 {("G5" 13)}
wvSetPosition -win $_nWave2 {("G5" 14)}
wvSetPosition -win $_nWave2 {("G5" 15)}
wvSetPosition -win $_nWave2 {("G5" 16)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 16)}
wvSetPosition -win $_nWave2 {("G5" 12)}
wvSetPosition -win $_nWave2 {("G5" 13)}
wvSetPosition -win $_nWave2 {("G5" 14)}
wvSetPosition -win $_nWave2 {("G5" 15)}
wvSetPosition -win $_nWave2 {("G5" 16)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvScrollUp -win $_nWave2 10
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 6 7 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvScrollDown -win $_nWave2 5
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 2 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 5 6 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 5 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 5 6 7 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcSetScope -win $_nTrace1 "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -delim "."
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcSelect -signal "cstate_rd" -line 82 -pos 1 -win $_nTrace1
srcSelect -signal "cstate_wr" -line 85 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
srcHBSelect "AXI2MEM_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "AXI2MEM_tb" -delim "."
srcHBSelect "AXI2MEM_tb" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cstate" -line 103 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSelectGroup -win $_nWave2 {G1}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G8" 0)}
wvAddGroup -win $_nWave2 {G8}
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 3 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 )} 
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G8" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G8" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G8" 2)}
wvSelectGroup -win $_nWave2 {G8}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G8" 0)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G9" 0)}
wvAddGroup -win $_nWave2 {G9}
wvScrollUp -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G9" 0)}
wvSetPosition -win $_nWave2 {("G8" 0)}
wvSetPosition -win $_nWave2 {("G9" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G9" 1)}
wvSelectGroup -win $_nWave2 {G8}
wvSetCursor -win $_nWave2 3342912.701190 -snap {("G1" 2)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 3133385.409377 -snap {("G1" 2)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectGroup -win $_nWave2 {G9}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 2647663.051085 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 1352403.428971 -snap {("G3" 1)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetMarker -win $_nWave2 -keepViewRange -name "M1" 1323831.525542
wvSetMarker -win $_nWave2 -keepViewRange -name "M1" 1323831.525542
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetMarker -win $_nWave2 -keepViewRange -name "M2" 6588393.325752
wvSetMarker -win $_nWave2 -keepViewRange -name "M2" 6588000.000000
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectUserMarker -win $_nWave2 -name "M2"
wvSelectUserMarker -win $_nWave2 -name "M2"
wvDeleteMarker -win $_nWave2 "M2"
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetMarker -win $_nWave2 -keepViewRange -name "M3" 3975002.536422
wvSetMarker -win $_nWave2 -keepViewRange -name "M3" 3975000.000000
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectStuckSignals -win $_nWave2
wvSetCursor -win $_nWave2 3990542.512246 -snap {("G4" 0)}
wvSetCursor -win $_nWave2 5619141.007698 -snap {("G3" 5)}
wvSetCursor -win $_nWave2 7647746.151155 -snap {("G3" 4)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 7352503.149055 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 10933515.045486 -snap {("G3" 3)}
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 6562013.820854 -snap {("G3" 5)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetMarker -win $_nWave2 -keepViewRange -name "M4" 6589277.357418
wvSetMarker -win $_nWave2 -keepViewRange -name "M4" 6588000.000000
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSetMarker -win $_nWave2 -keepViewRange -name "M5" 7913177.113285
wvSetMarker -win $_nWave2 -keepViewRange -name "M5" 7915000.000000
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetMarker -win $_nWave2 -keepViewRange -name "M6" 9259980.893394
wvSetMarker -win $_nWave2 -keepViewRange -name "M6" 9255000.000000
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvZoomIn -win $_nWave2
wvSetMarker -win $_nWave2 -keepViewRange -name "M7" 10584965.239427
wvSetMarker -win $_nWave2 -keepViewRange -name "M7" 10585000.000000
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 11924007.697691 -snap {("G3" 1)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetMarker -win $_nWave2 -keepViewRange -name "M8" 11876387.858642
wvSetMarker -win $_nWave2 -keepViewRange -name "M8" 11876387.858642
wvSelectGroup -win $_nWave2 {G3}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetMarker -win $_nWave2 -keepViewRange -name "M9" 5295939.030791
wvSetMarker -win $_nWave2 -keepViewRange -name "M9" 5305000.000000
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetMarker -win $_nWave2 -keepViewRange -name "M10" 2670105.896344
wvSetMarker -win $_nWave2 -keepViewRange -name "M10" 2675000.000000
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 12733544.961512 -snap {("G1" 2)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3062916.135881 4864064.932767
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetCursor -win $_nWave2 8590618.964311 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 7876321.378586 -snap {("G3" 1)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvJumpToolbarUserMarker -win $_nWave2 -name "M4"
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSetCursor -win $_nWave2 6214153.254024 -snap {("G3" 4)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvUnselectUserMarker -win $_nWave2
wvJumpToolbarUserMarker -win $_nWave2 -name "M9"
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvScrollDown -win $_nWave2 2
wvSelectGroup -win $_nWave2 {G7}
wvRenameGroup -win $_nWave2 {G7} {other}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "WSTRB" -line 260 -pos 1 -win $_nTrace1
srcAction -pos 259 1 3 -win $_nTrace1 -name "WSTRB" -ctrlKey off
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "AXI2MEM_tb.u_AXI2MEM_top" -delim "."
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "WSTRB" -line 26 -pos 1 -win $_nTrace1
srcAction -pos 25 11 3 -win $_nTrace1 -name "WSTRB" -ctrlKey off
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcSetScope -win $_nTrace1 "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -delim "."
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "WSTRB" -line 34 -pos 1 -win $_nTrace1
srcAction -pos 33 11 2 -win $_nTrace1 -name "WSTRB" -ctrlKey off
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcSetScope -win $_nTrace1 "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -delim "."
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
nsMsgAction -tab trace -index {2 2}
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcSetScope -win $_nTrace1 "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -delim "."
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
wvResizeWindow -win $_nWave2 -10 26 1920 1009
wvResizeWindow -win $_nWave2 76 26 1834 1009
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "WDATA" -line 33 -pos 1 -win $_nTrace1
srcAction -pos 32 11 1 -win $_nTrace1 -name "WDATA" -ctrlKey off
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcSetScope -win $_nTrace1 "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -delim "."
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "WSTRB" -line 34 -pos 1 -win $_nTrace1
srcAction -pos 33 11 2 -win $_nTrace1 -name "WSTRB" -ctrlKey off
srcHBDrag -win $_nTrace1
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_bist_sram_0" -win $_nTrace1
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcSetScope -win $_nTrace1 "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -delim "."
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "AXI2MEM_tb.u_AXI2MEM_top" -delim "."
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top" -win $_nTrace1
wvSelectGroup -win $_nWave2 {G3}
wvSelectGroup -win $_nWave2 {G3}
wvSetCursor -win $_nWave2 10751597.037314 -snap {("G3" 1)}
srcSelect -signal "bank0_csn        \[3:0\]" -line 124 -pos 1 -win $_nTrace1
srcSelect -signal "bank1_csn        \[3:0\]" -line 125 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetPosition -win $_nWave2 {("G9" 2)}
wvSetPosition -win $_nWave2 {("G9" 1)}
wvSetPosition -win $_nWave2 {("G9" 0)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvScrollUp -win $_nWave2 2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcSelect -signal "bank1_csn" -line 125 -pos 1 -win $_nTrace1
srcAction -pos 124 2 7 -win $_nTrace1 -name "bank1_csn" -ctrlKey on
srcSelect -toggle -signal "bank1_csn" -line 71 -pos 1 -win $_nTrace1
srcAction -pos 70 13 2 -win $_nTrace1 -name "bank1_csn" -ctrlKey on
srcSelect -signal "bank1_csn        \[3:0\]" -line 125 -pos 1 -win $_nTrace1
srcAction -pos 124 6 4 -win $_nTrace1 -name "bank1_csn        \[3:0\]" -ctrlKey \
          on
srcDeselectAll -win $_nTrace1
srcAction -pos 69 12 0 -win $_nTrace1 -name "," -ctrlKey on
srcDeselectAll -win $_nTrace1
srcSelect -signal "bank0_csn" -line 71 -pos 1 -win $_nTrace1
srcAction -pos 70 11 3 -win $_nTrace1 -name "bank0_csn" -ctrlKey on
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcSetScope -win $_nTrace1 "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -delim "."
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcSelect -signal "bank1_csn" -line 71 -pos 1 -win $_nTrace1
srcAction -pos 70 13 4 -win $_nTrace1 -name "bank1_csn" -ctrlKey on
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top" -win $_nTrace1
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1 -add
srcSetScope -win $_nTrace1 "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -delim "."
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcViewImportLogFile
debReload
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 9506598.195329 9949661.535740
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvJumpToolbarUserMarker -win $_nWave2 -name "M6"
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectGroup -win $_nWave2 {G9}
wvJumpToolbarUserMarker -win $_nWave2 -name "M4"
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectGroup -win $_nWave2 {G3}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 6598412.351295 -snap {("G2" 6)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 6574985.512159 -snap {("G3" 1)}
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_bist_sram_4" -win $_nTrace1
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "AXI2MEM_tb.u_AXI2MEM_top" -delim "."
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top" -win $_nTrace1
wvSetCursor -win $_nWave2 6654007.295379 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 145570.547586 -snap {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
srcSetScope -win $_nTrace1 "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -delim "."
srcHBSelect "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if" -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetCursor -win $_nWave2 9225026.060707 -snap {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetCursor -win $_nWave2 9292801.821729 -snap {("G1" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
srcSelect -signal "aw_size_r\[1\]" -line 363 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "aw_size_r\[1\]" -line 363 -pos 1 -win $_nTrace1
srcAction -pos 362 5 11 -win $_nTrace1 -name "aw_size_r\[1\]" -ctrlKey off
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 5 )} {( "G2" 3 )} 
debReload
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G9" 0)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetCursor -win $_nWave2 5666760.846746 -snap {("G9" 0)}
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetCursor -win $_nWave2 7915364.733087 -snap {("G1" 1)}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSetCursor -win $_nWave2 8005442.268687 -snap {("G1" 0)}
wvSetCursor -win $_nWave2 8005000.252854 -snap {("G1" 0)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSetCursor -win $_nWave2 7581078.376487 -snap {("G2" 3)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvJumpToolbarUserMarker -win $_nWave2 -name "M6"
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
schCreateWindow -delim "." -win $_nSchema1 -scope \
           "AXI2MEM_tb.u_AXI2MEM_top.u_AXI2MEM_if"
schZoomIn -win $_nSchema8 -pos 51416 19147
schZoomIn -win $_nSchema8 -pos 51416 19147
schZoomIn -win $_nSchema8 -pos 51416 19146
schZoomIn -win $_nSchema8 -pos 51416 19146
schZoomIn -win $_nSchema8 -pos 51415 19146
schZoomOut -win $_nSchema8 -pos 51415 19106
schZoomOut -win $_nSchema8 -pos 51414 19105
schZoomOut -win $_nSchema8 -pos 51414 19104
schZoomOut -win $_nSchema8 -pos 51413 19104
schZoomOut -win $_nSchema8 -pos 51413 19103
schZoomIn -win $_nSchema8 -pos 51413 19103
schZoomIn -win $_nSchema8 -pos 51412 19011
schZoomIn -win $_nSchema8 -pos 51412 19012
schZoomOut -win $_nSchema8 -pos 51206 18497
schZoomOut -win $_nSchema8 -pos 51205 18368
schZoomOut -win $_nSchema8 -pos 51204 18288
schZoomOut -win $_nSchema8 -pos 51204 18287
schZoomOut -win $_nSchema8 -pos 51204 18287
srcSignalView -off
verdiDockWidgetMaximize -dock windowDock_nSchema_8
schZoomIn -win $_nSchema8 -pos 38049 21685
schZoomIn -win $_nSchema8 -pos 38048 21684
schZoomIn -win $_nSchema8 -pos 38048 21684
schZoomIn -win $_nSchema8 -pos 38048 21684
schZoomOut -win $_nSchema8 -pos 37721 21297
schZoomOut -win $_nSchema8 -pos 37720 21259
schZoomOut -win $_nSchema8 -pos 37673 21212
schZoomOut -win $_nSchema8 -pos 37673 21212
schZoomOut -win $_nSchema8 -pos 37672 21211
schZoomIn -win $_nSchema8 -pos 36131 19489
schZoomIn -win $_nSchema8 -pos 35860 19149
schZoomIn -win $_nSchema8 -pos 35859 19149
schZoomOut -win $_nSchema8 -pos 35860 19110
schZoomOut -win $_nSchema8 -pos 35860 19062
schZoomOut -win $_nSchema8 -pos 35860 19062
schZoomOut -win $_nSchema8 -pos 35860 18912
schZoomIn -win $_nSchema8 -pos 35860 18912
schZoomIn -win $_nSchema8 -pos 35860 18912
schZoomOut -win $_nSchema8 -pos 35859 18859
schZoomOut -win $_nSchema8 -pos 35860 18662
schZoomOut -win $_nSchema8 -pos 35859 18662
schZoomOut -win $_nSchema8 -pos 35859 18661
schZoomIn -win $_nSchema8 -pos 12914 -9154
schZoomIn -win $_nSchema8 -pos 12913 -9154
schZoomIn -win $_nSchema8 -pos 12913 -9154
schZoomIn -win $_nSchema8 -pos 12913 -9154
schZoomIn -win $_nSchema8 -pos 27553 -2707
schZoomIn -win $_nSchema8 -pos 27553 -2706
schZoomOut -win $_nSchema8 -pos 27553 -2753
schZoomOut -win $_nSchema8 -pos 27552 -2753
schZoomOut -win $_nSchema8 -pos 27516 -2788
schZoomOut -win $_nSchema8 -pos 27516 -2789
schSelect -win $_nSchema8 -inst "AXI2MEM_if:Always4:211:243:RegCombo"
schSelect -win $_nSchema8 -inst "AXI2MEM_if:Always4:211:243:RegCombo"
schPushViewIn -win $_nSchema8
srcSelect -win $_nTrace1 -range {211 243 1 3 1 1}
schSelect -win $_nSchema8 -inst "AXI2MEM_if:Always5:248:280:RegCombo"
schSelect -win $_nSchema8 -inst "AXI2MEM_if:Always5:248:280:RegCombo"
schSelect -win $_nSchema8 -inst "AXI2MEM_if:Always3:167:174:RegCombo"
schSelect -win $_nSchema8 -inst "AXI2MEM_if:FSM0:99:384:FSM"
schSelect -win $_nSchema8 -inst "AXI2MEM_if:Always5:248:280:RegCombo"
schPushViewIn -win $_nSchema8
srcSelect -win $_nTrace1 -range {248 280 1 3 1 1}
schCloseWindow -win $_nSchema8
srcSignalView -on
verdiDockWidgetFix -dock widgetDock_<Signal_List>
verdiDockWidgetUnfix -dock widgetDock_<Signal_List>
srcSignalView -off
srcSignalView -on
verdiDockWidgetDisplay -dock widgetDock_<Signal_List>
srcSignalView -off
srcSignalView -on
verdiDockWidgetDisplay -dock widgetDock_<Signal_List>
verdiDockWidgetRestore -dock widgetDock_<Signal_List>
wvResizeWindow -win $_nWave2 76 26 1834 1009
wvResizeWindow -win $_nWave2 -10 26 1920 1009
wvResizeWindow -win $_nWave2 76 26 1834 1009
wvResizeWindow -win $_nWave2 -10 26 1920 1009
wvResizeWindow -win $_nWave2 76 26 1834 1009
wvResizeWindow -win $_nWave2 -10 26 1920 1009
wvResizeWindow -win $_nWave2 76 26 1834 1009
wvResizeWindow -win $_nWave2 -10 26 1920 1009
wvResizeWindow -win $_nWave2 76 26 1834 1009
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
srcCloseWindow -win $_nTrace7
debExit
