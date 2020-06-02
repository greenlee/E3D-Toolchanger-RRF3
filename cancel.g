; Disable Mesh Compensation.
G29 S2

; purge tool
M98 Ppurge.g

; park tool
T-1

; Heaters off
;M0

; Part cooling fans off
M106 P2 S0
M106 P4 S0
M106 P6 S0
M106 P8 S0
