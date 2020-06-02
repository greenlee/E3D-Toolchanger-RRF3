; stop.g
; called when M0 (Stop) is run (e.g. when a print from SD card is cancelled)

; Part cooling fans off
M106 P2 S0
M106 P4 S0
M106 P6 S0
M106 P8 S0
