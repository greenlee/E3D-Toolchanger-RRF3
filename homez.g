; homez.g
; called to home the Z axis
T-0
M98 P/macros/Coupler - Unlock	;Open Coupler

G91 				; Relative mode
G1 H2 Z5 F5000			; Lower the bed
G90				; back to absolute positioning

G1 X150 Y100 F50000		; Position the endstop above the bed centre


G90 ; back to absolute mode

G30 ; lower head, stop when probe triggered and set Z to trigger height
