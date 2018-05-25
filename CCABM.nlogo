globals [phase start-time G1-time S-time G2-time M-time]

turtles-own [ active deg]

breed [ start a-start ]
breed [ SK a-SK ]
breed [ Cdc2/Cdc13 a-aCdc2/Cdc13 ]
breed [ Ste9 a-Ste9 ]
breed [ Rum1 a-Rum1 ]
breed [ Slp1 a-Slp1 ]
breed [ Cdc2/Cdc13* a-aCdc2/Cdc13* ]
breed [ Wee1Mik1 a-Wee1Mik1 ]
breed [ Cdc25 a-Cdc25 ]
breed [ PP a-PP ]

directed-link-breed [ green-links green-link ]
directed-link-breed [ red-links red-link ]

to setup
  ca
  ask patches [ set pcolor blue + 2 ]

  ;; create proteins
  create-start 1 [
    set color red
    set shape "circle"
    setxy random-xcor random-ycor
    set active start-active
    set label "start"
  ]

  create-SK 1 [
    set color red
    set shape "circle"
    setxy random-xcor random-ycor
    set active SK-active
    set label "SK"
  ]

  create-Cdc2/Cdc13 1 [
    set color red
    set shape "circle"
    setxy random-xcor random-ycor
    set active Cdc2/Cdc13-active
    set label "Cdc2/Cdc13"
  ]

  create-Ste9 1 [
    set color red
    set shape "circle"
    setxy random-xcor random-ycor
    set active Ste9-active
    set label "Ste9"
  ]

  create-Rum1 1 [
    set color red
    set shape "circle"
    setxy random-xcor random-ycor
    set active Rum1-active
    set label "Rum1"
  ]

  create-Slp1 1 [
    set color red
    set shape "circle"
    setxy random-xcor random-ycor
    set active Slp1-active
    set label "Slp1"
  ]

  create-Cdc2/Cdc13* 1 [
    set color red
    set shape "circle"
    setxy random-xcor random-ycor
    set active Cdc2/Cdc13*-active
    set label "Cdc2/Cdc13*"
  ]

  create-Wee1Mik1 1 [
    set color red
    set shape "circle"
    setxy random-xcor random-ycor
    set active Wee1Mik1-active
    set label "Wee1 Mik1"
  ]

  create-Cdc25 1 [
    set color red
    set shape "circle"
    setxy random-xcor random-ycor
    set active Cdc25-active
    set label "Cdc25"
  ]

  create-PP 1 [
    set color red
    set shape "circle"
    setxy random-xcor random-ycor
    set active PP-active
    set label "PP"
  ]

  ;; create activating links

  ask start [
    create-green-links-to SK
  ]

  ask Cdc2/Cdc13 [
    create-green-links-to Cdc25
  ]

  ask PP [
    create-green-links-to Ste9
    create-green-links-to Rum1
    create-green-links-to Wee1Mik1
  ]

  ask Cdc25 [
    create-green-links-to Cdc2/Cdc13*
  ]

  ask Slp1 [
    create-green-links-to PP
  ]

  ask Cdc2/Cdc13* [
    create-green-links-to Slp1
  ]

 ask green-links [
   set color green - 1
   set thickness 0.2
 ]

  ;; create inhibitor links

  ask SK [
     create-red-links-to Ste9
     create-red-links-to Rum1
  ]

  ask Ste9 [
     create-red-links-to Cdc2/Cdc13
     create-red-links-to Cdc2/Cdc13*
  ]

  ask Cdc2/Cdc13 [
     create-red-links-to Ste9
     create-red-links-to Rum1
     create-red-links-to Wee1Mik1
  ]

  ask Rum1 [
     create-red-links-to Cdc2/Cdc13
     create-red-links-to Cdc2/Cdc13*
  ]

  ask PP [
    create-red-links-to Cdc25
  ]

  ask Slp1 [
    create-red-links-to Cdc2/Cdc13
    create-red-links-to Cdc2/Cdc13*
  ]

  ask Wee1Mik1 [
    create-red-links-to Cdc2/Cdc13*
  ]

  ask Cdc2/Cdc13* [
     create-red-links-to Ste9
     create-red-links-to Rum1
  ]

  ask red-links [
   set color red + 1
   set thickness 0.2
   ;;set shape "inhi"
  ]

  ask links
   [ ifelse show-links = TRUE
       [ set hidden? FALSE ]
       [ set hidden? TRUE  ]
   ]

  reset-ticks
end


to go

    if item 0 [active] of       Start = 0	
  and item 0 [active] of          SK = 0
  and item 0 [active] of  Cdc2/Cdc13 = 0
  and item 0 [active] of        Ste9 = 1
  and item 0 [active] of        Rum1 = 1	
  and item 0 [active] of        Slp1 = 0
  and item 0 [active] of Cdc2/Cdc13* = 0
  and item 0 [active] of	  Wee1Mik1 = 1	
  and item 0 [active] of       Cdc25 = 0	
  and item 0 [active] of          PP = 0 [
    set phase "G1(stationary)"
    stop
  ]

   if item 0 [active] of       Start = 0	
  and item 0 [active] of          SK = 0
  and item 0 [active] of  Cdc2/Cdc13 = 0
  and item 0 [active] of        Ste9 = 0
  and item 0 [active] of        Rum1 = 0	
  and item 0 [active] of        Slp1 = 0
  and item 0 [active] of Cdc2/Cdc13* = 0
  and item 0 [active] of	  Wee1Mik1 = 0	
  and item 0 [active] of       Cdc25 = 1	
  and item 0 [active] of          PP = 1 [
    set phase "Limit"
    stop
  ]

   if item 0 [active] of       Start = 0	
  and item 0 [active] of          SK = 0
  and item 0 [active] of  Cdc2/Cdc13 = 0
  and item 0 [active] of        Ste9 = 0
  and item 0 [active] of        Rum1 = 1	
  and item 0 [active] of        Slp1 = 0
  and item 0 [active] of Cdc2/Cdc13* = 0
  and item 0 [active] of	  Wee1Mik1 = 1	
  and item 0 [active] of       Cdc25 = 0	
  and item 0 [active] of          PP = 0 [
    set phase "Fixed"
    stop
  ]

   if item 0 [active] of       Start = 0	
  and item 0 [active] of          SK = 0
  and item 0 [active] of  Cdc2/Cdc13 = 0
  and item 0 [active] of        Ste9 = 1
  and item 0 [active] of        Rum1 = 0	
  and item 0 [active] of        Slp1 = 0
  and item 0 [active] of Cdc2/Cdc13* = 0
  and item 0 [active] of	  Wee1Mik1 = 1	
  and item 0 [active] of       Cdc25 = 0	
  and item 0 [active] of          PP = 0 [
    set phase "Fixed"
    stop
  ]

   if item 0 [active] of       Start = 0	
  and item 0 [active] of          SK = 0
  and item 0 [active] of  Cdc2/Cdc13 = 0
  and item 0 [active] of        Ste9 = 1
  and item 0 [active] of        Rum1 = 0	
  and item 0 [active] of        Slp1 = 0
  and item 0 [active] of Cdc2/Cdc13* = 0
  and item 0 [active] of	  Wee1Mik1 = 0	
  and item 0 [active] of       Cdc25 = 0	
  and item 0 [active] of          PP = 0 [
    set phase "Fixed"
    stop
  ]

   if item 0 [active] of       Start = 0	
  and item 0 [active] of          SK = 0
  and item 0 [active] of  Cdc2/Cdc13 = 0
  and item 0 [active] of        Ste9 = 1
  and item 0 [active] of        Rum1 = 0	
  and item 0 [active] of        Slp1 = 0
  and item 0 [active] of Cdc2/Cdc13* = 0
  and item 0 [active] of	  Wee1Mik1 = 0	
  and item 0 [active] of       Cdc25 = 1	
  and item 0 [active] of          PP = 0 [
    set phase "Fixed"
    stop
  ]

   if item 0 [active] of       Start = 0	
  and item 0 [active] of          SK = 0
  and item 0 [active] of  Cdc2/Cdc13 = 0
  and item 0 [active] of        Ste9 = 1
  and item 0 [active] of        Rum1 = 0	
  and item 0 [active] of        Slp1 = 0
  and item 0 [active] of Cdc2/Cdc13* = 0
  and item 0 [active] of	  Wee1Mik1 = 1	
  and item 0 [active] of       Cdc25 = 1	
  and item 0 [active] of          PP = 0 [
    set phase "Fixed"
    stop
  ]

   if item 0 [active] of       Start = 0	
  and item 0 [active] of          SK = 0
  and item 0 [active] of  Cdc2/Cdc13 = 0
  and item 0 [active] of        Ste9 = 0
  and item 0 [active] of        Rum1 = 1	
  and item 0 [active] of        Slp1 = 0
  and item 0 [active] of Cdc2/Cdc13* = 0
  and item 0 [active] of	  Wee1Mik1 = 0	
  and item 0 [active] of       Cdc25 = 0	
  and item 0 [active] of          PP = 0 [
    set phase "Fixed"
    stop
  ]

   if item 0 [active] of       Start = 0	
  and item 0 [active] of          SK = 0
  and item 0 [active] of  Cdc2/Cdc13 = 0
  and item 0 [active] of        Ste9 = 0
  and item 0 [active] of        Rum1 = 1	
  and item 0 [active] of        Slp1 = 0
  and item 0 [active] of Cdc2/Cdc13* = 0
  and item 0 [active] of	  Wee1Mik1 = 0	
  and item 0 [active] of       Cdc25 = 1	
  and item 0 [active] of          PP = 0 [
    set phase "Fixed"
    stop
  ]

   if item 0 [active] of       Start = 0	
  and item 0 [active] of          SK = 0
  and item 0 [active] of  Cdc2/Cdc13 = 0
  and item 0 [active] of        Ste9 = 0
  and item 0 [active] of        Rum1 = 1	
  and item 0 [active] of        Slp1 = 0
  and item 0 [active] of Cdc2/Cdc13* = 0
  and item 0 [active] of	  Wee1Mik1 = 1	
  and item 0 [active] of       Cdc25 = 1	
  and item 0 [active] of          PP = 0 [
    set phase "Fixed"
    stop
  ]

   if item 0 [active] of       Start = 0	
  and item 0 [active] of          SK = 0
  and item 0 [active] of  Cdc2/Cdc13 = 0
  and item 0 [active] of        Ste9 = 1
  and item 0 [active] of        Rum1 = 1	
  and item 0 [active] of        Slp1 = 0
  and item 0 [active] of Cdc2/Cdc13* = 0
  and item 0 [active] of	  Wee1Mik1 = 0	
  and item 0 [active] of       Cdc25 = 0	
  and item 0 [active] of          PP = 0 [
    set phase "Fixed"
    stop
  ]

   if item 0 [active] of       Start = 0	
  and item 0 [active] of          SK = 0
  and item 0 [active] of  Cdc2/Cdc13 = 0
  and item 0 [active] of        Ste9 = 1
  and item 0 [active] of        Rum1 = 1	
  and item 0 [active] of        Slp1 = 0
  and item 0 [active] of Cdc2/Cdc13* = 0
  and item 0 [active] of	  Wee1Mik1 = 0	
  and item 0 [active] of       Cdc25 = 1	
  and item 0 [active] of          PP = 0 [
    set phase "Fixed"
    stop
  ]

   if item 0 [active] of       Start = 0	
  and item 0 [active] of          SK = 0
  and item 0 [active] of  Cdc2/Cdc13 = 0
  and item 0 [active] of        Ste9 = 1
  and item 0 [active] of        Rum1 = 1	
  and item 0 [active] of        Slp1 = 0
  and item 0 [active] of Cdc2/Cdc13* = 0
  and item 0 [active] of	  Wee1Mik1 = 1	
  and item 0 [active] of       Cdc25 = 1	
  and item 0 [active] of          PP = 0 [
    set phase "Fixed"
    stop
  ]

   if item 0 [active] of       Start = 0	
  and item 0 [active] of          SK = 0
  and item 0 [active] of  Cdc2/Cdc13 = 0
  and item 0 [active] of        Ste9 = 0
  and item 0 [active] of        Rum1 = 0	
  and item 0 [active] of        Slp1 = 0
  and item 0 [active] of Cdc2/Cdc13* = 0
  and item 0 [active] of	  Wee1Mik1 = 0	
  and item 0 [active] of       Cdc25 = 0	
  and item 0 [active] of          PP = 0 [
    set phase "Fixed"
    stop
  ]


  c-phase

  move
  activate
  inhibit
  degradation

  ask links
  [ ifelse show-links = TRUE
      [ set hidden? FALSE ]
      [ set hidden? TRUE  ]
  ]

  tick
end

to move
  ask turtles [
    right random 360
    fd 1
  ]

end

to degradation

    ;; behavior of Cdc complex
  if item 0 [active] of Ste9 = 0 and item 0 [active] of Rum1 = 0 and item 0 [active] of Slp1 = 0 and random-float 1 < 0.0005 [
     ask Cdc2/Cdc13 [ set active 1 ]
  ]

  if item 0 [active] of SK = 1 [
   ask start [ set active 0 ]
  ]

  ;; self-degradation of SK
  if item 0 [active] of Ste9 = 0 and item 0 [active] of Rum1 = 0 [
   ask SK [ set active 0 ]
  ]

  if item 0 [active] of Cdc2/Cdc13 = 0 and item 0 [active] of Cdc2/Cdc13* = 0 and item 0 [active] of PP = 1 [
   ask Slp1 [ set active 0 ]
  ]

  if item 0 [active] of Ste9 = 1 and item 0 [active] of Rum1 = 1 and item 0 [active] of Wee1Mik1 = 1 and item 0 [active] of Cdc25 = 0 [
   ask PP [ set active 0 ]
  ]

   if item 0 [active] of PP = 1 [
   ask Cdc25 [ set active 0 ]
  ]

end

;; function for the activation of proteins by its activator
to activate

  ask start with [ active = 1 ] [
    let react one-of SK-here
      if react != nobody [
       ask react [ set active 1
      ]
      set active 0
    ]
  ]

  ask Cdc2/Cdc13 with [ active = 1 ] [
    let react one-of Cdc25-here
      if react != nobody [
       ask react [
         set active 1
      ]
    ]
  ]

  ask Cdc25 with [ active = 1 ] [
    let react one-of Cdc2/Cdc13*-here
      if react != nobody [
       ask react [
         set active 1
      ]
    ]
  ]

  ask Cdc2/Cdc13* with [ active = 1 ] [
    let react one-of Slp1-here
      if react != nobody [
       ask react [
         set active 1
      ]
    ]
  ]

  ask Slp1 with [ active = 1 ] [
    let react one-of PP-here
      if react != nobody [
       ask react [
         set active 1
      ]
    ]
  ]

  ask PP with [ active = 1 ] [
    let react one-of Ste9-here
      if react != nobody [
       ask react [
         set active 1
      ]
    ]
  ]

  ask PP with [ active = 1 ] [
    let react one-of Rum1-here
      if react != nobody [
       ask react [
         set active 1
      ]
    ]
  ]

  ask PP with [ active = 1 ] [
    let react one-of Wee1Mik1-here
      if react != nobody [
       ask react [
         set active 1
      ]
    ]
  ]

end

;; function for the inhibition of proteins by its inhibitor
to inhibit

  ask SK with [ active = 1 ] [
    let react one-of Ste9-here
      if react != nobody [
       ask react [ set active 0
      ]
    ]
  ]

  ask SK with [ active = 1 ] [
    let react one-of Rum1-here
      if react != nobody [
       ask react [ set active 0
      ]
    ]
  ]

  ask Ste9 with [ active = 1 ] [
    let react one-of Cdc2/Cdc13-here
      if react != nobody [
       ask react [ set active 0
      ]
    ]
  ]

  ask Ste9 with [ active = 1 ] [
    let react one-of Cdc2/Cdc13*-here
      if react != nobody [
       ask react [ set active 0
      ]
    ]
  ]

  ask Cdc2/Cdc13 with [ active = 1 ] [
    let react one-of Ste9-here
      if react != nobody [
       ask react [ set active 0
      ]
    ]
  ]

  ask Cdc2/Cdc13 with [ active = 1 ] [
    let react one-of Rum1-here
      if react != nobody [
       ask react [ set active 0
      ]
    ]
  ]

  ask Cdc2/Cdc13 with [ active = 1 ] [
    let react one-of Wee1Mik1-here
      if react != nobody [
       ask react [ set active 0
      ]
    ]
  ]

  ask Rum1 with [ active = 1 ] [
    let react one-of Cdc2/Cdc13-here
      if react != nobody [
       ask react [ set active 0
      ]
    ]
  ]

  ask Rum1 with [ active = 1 ] [
    let react one-of Cdc2/Cdc13*-here
      if react != nobody [
       ask react [ set active 0
      ]
    ]
  ]

  ask PP with [ active = 1 ] [
    let react one-of Cdc25-here
      if react != nobody [
       ask react [ set active 0
      ]
    ]
  ]

  ask Slp1 with [ active = 1 ] [
    let react one-of Cdc2/Cdc13-here
      if react != nobody [
       ask react [ set active 0
      ]
    ]
  ]

  ask Slp1 with [ active = 1 ] [
    let react one-of Cdc2/Cdc13*-here
      if react != nobody [
       ask react [ set active 0
      ]
    ]
  ]

  ask Wee1Mik1 with [ active = 1 ] [
    let react one-of Cdc2/Cdc13*-here
      if react != nobody [
       ask react [ set active 0
      ]
    ]
  ]

  ask Cdc2/Cdc13* with [ active = 1 ] [
    let react one-of Ste9-here
      if react != nobody [
       ask react [ set active 0
      ]
    ]
  ]

  ask Cdc2/Cdc13* with [ active = 1 ] [
    let react one-of Rum1-here
      if react != nobody [
       ask react [ set active 0
      ]
    ]
  ]

end

to c-phase
  ;; checks for Start phase
   if item 0 [active] of       Start = 1	
  and item 0 [active] of          SK = 0
  and item 0 [active] of  Cdc2/Cdc13 = 0
  and item 0 [active] of        Ste9 = 1
  and item 0 [active] of        Rum1 = 1	
  and item 0 [active] of        Slp1 = 0
  and item 0 [active] of Cdc2/Cdc13* = 0
  and item 0 [active] of	  Wee1Mik1 = 1	
  and item 0 [active] of       Cdc25 = 0	
  and item 0 [active] of          PP = 0 [
    set phase "Start"
  ]

  ;; checks for G1 phase
   if item 0 [active] of SK = 1 [
    set phase "G1"
    set G1-time ticks - start-time
  ]

    ;; checks for S phase
   if item 0 [active] of       Start = 0	
  and item 0 [active] of          SK = 0
  and item 0 [active] of  Cdc2/Cdc13 = 0
  and item 0 [active] of        Ste9 = 0
  and item 0 [active] of        Rum1 = 0	
  and item 0 [active] of        Slp1 = 0
  and item 0 [active] of Cdc2/Cdc13* = 0
  and item 0 [active] of	  Wee1Mik1 = 1	
  and item 0 [active] of       Cdc25 = 0	
  and item 0 [active] of          PP = 0 [
    set phase "S"
    set S-time ticks - G1-time - start-time
  ]

  ;; checks for G2 transition
   if item 0 [active] of Cdc2/Cdc13 = 1 [
    set phase "G2"
    set G2-time ticks - S-time - G1-time - start-time
  ]

  ;; checks for M phase

     if item 0 [active] of PP = 1 and item 0 [active] of Cdc2/Cdc13 = 0 [
    set phase "M"
    set M-time ticks - G2-time - S-time - G1-time - start-time
  ]
end






@#$#@#$#@
GRAPHICS-WINDOW
435
60
823
449
-1
-1
11.52
1
11
1
1
1
0
0
0
1
-16
16
-16
16
0
0
1
ticks
30.0

CHOOSER
55
10
170
55
start-active
start-active
0 1
1

CHOOSER
170
10
285
55
SK-active
SK-active
0 1
0

CHOOSER
285
10
400
55
Cdc2/Cdc13-active
Cdc2/Cdc13-active
0 1
0

CHOOSER
400
10
515
55
Ste9-active
Ste9-active
0 1
1

CHOOSER
515
10
630
55
Rum1-active
Rum1-active
0 1
1

CHOOSER
630
10
745
55
Slp1-active
Slp1-active
0 1
0

CHOOSER
745
10
860
55
Cdc2/Cdc13*-active
Cdc2/Cdc13*-active
0 1
0

CHOOSER
860
10
975
55
Wee1Mik1-active
Wee1Mik1-active
0 1
1

CHOOSER
975
10
1090
55
Cdc25-active
Cdc25-active
0 1
0

CHOOSER
1090
10
1205
55
PP-active
PP-active
0 1
0

BUTTON
245
220
310
253
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
320
260
385
293
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
245
455
325
500
start
[active] of start
17
1
11

MONITOR
645
455
725
500
Slp1
[active] of Slp1
17
1
11

MONITOR
325
455
405
500
SK
[active] of SK
17
1
11

MONITOR
725
455
805
500
Cdc2/Cdc13*
[active] of Cdc2/Cdc13*
17
1
11

MONITOR
405
455
485
500
Cdc2/Cdc13
[active] of Cdc2/Cdc13
17
1
11

MONITOR
805
455
885
500
Wee1Mik1
[active] of Wee1Mik1
17
1
11

MONITOR
485
455
565
500
Ste9
[active] of Ste9
17
1
11

MONITOR
885
455
965
500
Cdc25
[active] of Cdc25
17
1
11

MONITOR
565
455
645
500
Rum1
[active] of Rum1
17
1
11

MONITOR
965
455
1045
500
PP
[active] of PP
17
1
11

BUTTON
245
260
310
293
go once
go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SWITCH
256
180
368
213
show-links
show-links
0
1
-1000

MONITOR
910
180
995
225
Phase
phase
17
1
11

MONITOR
835
230
892
275
NIL
G1-time
17
1
11

MONITOR
895
230
952
275
NIL
S-time
17
1
11

MONITOR
955
230
1012
275
NIL
G2-time
17
1
11

MONITOR
1015
230
1072
275
NIL
M-time
17
1
11

MONITOR
835
280
892
325
G1
(G1-time / ticks) * 100
4
1
11

MONITOR
895
280
950
325
S
(S-time / ticks) * 100
4
1
11

MONITOR
955
280
1012
325
G2
(G2-time / ticks) * 100
4
1
11

MONITOR
1015
280
1072
325
M
(M-time / ticks) * 100
4
1
11

TEXTBOX
1085
300
1235
318
%
11
0.0
1

BUTTON
320
220
385
253
bio
setup\nask start [ set active 1 ]\nask SK [ set active 0 ]\nask Cdc2/Cdc13 [ set active 0 ]\nask Ste9 [ set active 1 ]\nask Rum1 [ set active 1 ]\nask Slp1 [ set active 0 ]\nask Cdc2/Cdc13* [ set active 0 ]\nask Wee1Mik1 [ set active 1 ]\nask Cdc25 [ set active 0 ]\nask PP [ set active 0 ]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
1085
245
1235
263
ticks
11
0.0
1

@#$#@#$#@
## WHAT IS IT?

This is a Cell Cycle Agent-Based Model (CCABM) of the fission yeast. The current model was created to simulate the sequence of protein events of the fission yeast cell cycle while measuring the time and percentage of duration of each of the four cell cycle phases (G1, S, G2 and M) as part of the journal research titled “An agent-based model of the fission yeast cell cycle”

## HOW IT WORKS

The CCABM is based on the protein regulatory network of the cell cycle from [Davidich MI, Bornholdt S (2008) Boolean Network Model Predicts Cell Cycle Sequence of Fission Yeast.](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0001672). Each protein is represented by an agent and have activation, inhibition and self-degradation process. The proteins have a binary property called activity that represent if they are active or not, the combination of values of activity of each protein determines the time step in the cell cycle.

## HOW TO USE IT

The selectors for the initial conditions of the proteins are located in top of the world, biological conditions are the following: “Start” (1), SK (0), Cdc2/Cdc13 (0), Ste9 (1), Rum (1), Slp1 (0), Cdc2/Cdc13* (0), Wee1/Mik1 (1), Cdc25 (0), and PP (0). 

Left of the world there is a selector to choose if links are visible or not. The setup button is to set the model with the initial states selected in the selector for initial conditions. The bio button is to set the initial states the same as the initial biological conditions ignoring the values set in the selector for initial states.The go once button is used to run one time-step and the go button is used to run the model entirely until the simulation is finished. 

Right of the world are three rows of monitors, the first row shows the current phase were the cell cycle is, the second row shows the time in ticks for each phase and the third row shows the percentage of duration for each phase as well.

Under the world are monitors that show the current value of activity for each protein.

## BEHAVIOR SPACE 
The CCABM is intended to be ran under biological conditions. In addition, to perform the different experiments to validate the model the behavior space tool was used, performing three different experiments.

Biological conditions: The model is run 100 times under biological conditions, in order to eliminate inherent variability.

All possible initial states: Run the model with the 1024 combinations of initial conditions to check the times that the model reached the desired final state.

All possible initial states but only when Start is active: The same as the above when only is Start is active, resulting in 512 combinations, again to check the times that the model reached the desired final state.

## EXTENDING THE MODEL

This model can be complemented to generate a model of cancer drug studies performed in the fission yeast, first by changing the behavior of the cell cycle to match one type of cancer and by adding a type of agent that represents the drug to see when and if the drug stops the cell cycle (the cell die).

## CREDITS AND REFERENCES

MIT License

Copyright (c) 2018 Carlos Castro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.0.1
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="biologial conditions" repetitions="100" sequentialRunOrder="false" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>G1-time</metric>
    <metric>S-time</metric>
    <metric>G2-time</metric>
    <metric>M-time</metric>
    <metric>[active] of start</metric>
    <metric>[active] of SK</metric>
    <metric>[active] of Cdc2/Cdc13</metric>
    <metric>[active] of Ste9</metric>
    <metric>[active] of Rum1</metric>
    <metric>[active] of Slp1</metric>
    <metric>[active] of Cdc2/Cdc13*</metric>
    <metric>[active] of Wee1Mik1</metric>
    <metric>[active] of Cdc25</metric>
    <metric>[active] of PP</metric>
    <enumeratedValueSet variable="Cdc25-active">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Cdc2/Cdc13-active">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="show-links">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Slp1-active">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="SK-active">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Wee1Mik1-active">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Cdc2/Cdc13*-active">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Rum1-active">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="start-active">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="PP-active">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Ste9-active">
      <value value="1"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="all possible initial states" repetitions="1" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>G1-time</metric>
    <metric>S-time</metric>
    <metric>G2-time</metric>
    <metric>M-time</metric>
    <metric>[active] of start</metric>
    <metric>[active] of SK</metric>
    <metric>[active] of Cdc2/Cdc13</metric>
    <metric>[active] of Ste9</metric>
    <metric>[active] of Rum1</metric>
    <metric>[active] of Slp1</metric>
    <metric>[active] of Cdc2/Cdc13*</metric>
    <metric>[active] of Wee1Mik1</metric>
    <metric>[active] of Cdc25</metric>
    <metric>[active] of PP</metric>
    <enumeratedValueSet variable="Cdc25-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Cdc2/Cdc13-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="show-links">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Slp1-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="SK-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Wee1Mik1-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Cdc2/Cdc13*-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Rum1-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="start-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="PP-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Ste9-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="all possible initial states but only of start is active" repetitions="1" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>G1-time</metric>
    <metric>S-time</metric>
    <metric>G2-time</metric>
    <metric>M-time</metric>
    <metric>[active] of start</metric>
    <metric>[active] of SK</metric>
    <metric>[active] of Cdc2/Cdc13</metric>
    <metric>[active] of Ste9</metric>
    <metric>[active] of Rum1</metric>
    <metric>[active] of Slp1</metric>
    <metric>[active] of Cdc2/Cdc13*</metric>
    <metric>[active] of Wee1Mik1</metric>
    <metric>[active] of Cdc25</metric>
    <metric>[active] of PP</metric>
    <enumeratedValueSet variable="Cdc25-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Cdc2/Cdc13-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="show-links">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Slp1-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="SK-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Wee1Mik1-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Cdc2/Cdc13*-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Rum1-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="start-active">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="PP-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Ste9-active">
      <value value="0"/>
      <value value="1"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

inhi
0.0
-0.2 0 0.0 1.0
0.0 1 4.0 4.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
1
@#$#@#$#@
