** Generated for: hspiceD
** Generated on: Nov 12 19:16:39 2025
** Design library name: SRAM_DCDR
** Design cell name: RowDecoder512
** Design view name: schematic


.TEMP 25.0
.OPTION
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2

** Library name: ProjectSRAM
** Cell name: inverter
** View name: schematic
.subckt inverter a vdd vss zn
xm0 zn a vss vss nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm1 zn a vdd vdd pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
.ends inverter
** End of subcircuit definition.

** Library name: ProjectSRAM
** Cell name: and4
** View name: schematic
.subckt and4 a1 a2 a3 a4 vdd vss zn
xm3 net1 a1 net2 vss nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm4 net2 a2 net3 vss nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm5 net3 a3 vss vss nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm7 vss a4 vss vss nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xi1 net1 vdd vss zn inverter
xm6 net1 a4 vdd vdd pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm2 net1 a3 vdd vdd pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm1 net1 a2 vdd vdd pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm0 net1 a1 vdd vdd pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
.ends and4
** End of subcircuit definition.

** Library name: ProjectSRAM
** Cell name: subblock1
** View name: schematic
.subckt subblock1 a0 a1 a2 clk pd0_0 pd0_1 pd0_2 pd0_3 pd0_4 pd0_5 pd0_6 pd0_7 vdd vss
xi10 a1 vdd vss a1b inverter
xi9 a0 vdd vss a0b inverter
xi12 a2 vdd vss a2b inverter
xi19 a0 a1b a2 clk vdd vss pd0_2 and4
xi18 a0b a1b a2 clk vdd vss pd0_3 and4
xi21 a0 a1 a2 clk vdd vss pd0_0 and4
xi20 a0b a1 a2 clk vdd vss pd0_1 and4
xi14 a0b a1b a2b clk vdd vss pd0_7 and4
xi15 a0 a1b a2b clk vdd vss pd0_6 and4
xi16 a0b a1 a2b clk vdd vss pd0_5 and4
xi17 a0 a1 a2b clk vdd vss pd0_4 and4
.ends subblock1
** End of subcircuit definition.

** Library name: ProjectSRAM
** Cell name: and3
** View name: schematic
.subckt and3 a1 a2 a3 vdd vss zn
xm5 net2 a3 vss vss nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm3 a a1 net1 vss nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm4 net1 a2 net2 vss nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm2 a a3 vdd vdd pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm1 a a2 vdd vdd pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm0 a a1 vdd vdd pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xi0 a vdd vss zn inverter
.ends and3
** End of subcircuit definition.

** Library name: ProjectSRAM
** Cell name: subblock2
** View name: schematic
.subckt subblock2 a3 a4 a5 pd1_0 pd1_1 pd1_2 pd1_3 pd1_4 pd1_5 pd1_6 pd1_7 vdd vss
xi25 a3b a4b a5b vdd vss pd1_7 and3
xi26 a3 a4b a5b vdd vss pd1_6 and3
xi30 a3 a4b a5 vdd vss pd1_2 and3
xi29 a3b a4b a5 vdd vss pd1_3 and3
xi28 a3 a4 a5b vdd vss pd1_4 and3
xi27 a3b a4 a5b vdd vss pd1_5 and3
xi31 a3b a4 a5 vdd vss pd1_1 and3
xi32 a3 a4 a5 vdd vss pd1_0 and3
xi9 a3 vdd vss a3b inverter
xi10 a4 vdd vss a4b inverter
xi12 a5 vdd vss a5b inverter
.ends subblock2
** End of subcircuit definition.

** Library name: ProjectSRAM
** Cell name: subblock3
** View name: schematic
.subckt subblock3 a6 a7 a8 pd2_0 pd2_1 pd2_2 pd2_3 pd2_4 pd2_5 pd2_6 pd2_7 vdd vss
xi26 a6 a7b a8b vdd vss pd2_6 and3
xi25 a6b a7b a8b vdd vss pd2_7 and3
xi27 a6b a7 a8b vdd vss pd2_5 and3
xi28 a6 a7 a8b vdd vss pd2_4 and3
xi29 a6b a7b a8 vdd vss pd2_3 and3
xi30 a6 a7b a8 vdd vss pd2_2 and3
xi31 a6b a7 a8 vdd vss pd2_1 and3
xi32 a6 a7 a8 vdd vss pd2_0 and3
xi9 a6 vdd vss a6b inverter
xi10 a7 vdd vss a7b inverter
xi12 a8 vdd vss a8b inverter
.ends subblock3
** End of subcircuit definition.

** Library name: SRAM_DCDR
** Cell name: RowDecoder512
** View name: schematic
xi0 net2489 net2490 net2491 net2492 net2479 net2480 net2481 net2482 net2483 net2484 net2485 net2486 net2488 net2487 subblock1
xi1 net2503 net2504 net2505 net2493 net2494 net2495 net2496 net2497 net2498 net2499 net2500 net2502 net2501 subblock2
xi2 net2516 net2517 net2518 net2506 net2507 net2508 net2509 net2510 net2511 net2512 net2513 net2515 net2514 subblock3
xi514 net2477 net2473 net2475 net2474 net2476 net2478 and3
xi513 net2471 net2467 net2469 net2468 net2470 net2472 and3
xi512 net2465 net2461 net2463 net2462 net2464 net2466 and3
xi511 net2459 net2455 net2457 net2456 net2458 net2460 and3
xi510 net2453 net2449 net2451 net2450 net2452 net2454 and3
xi509 net1223 net1219 net1221 net1220 net1222 net1224 and3
xi508 net1217 net1213 net1215 net1214 net1216 net1218 and3
xi507 net1211 net1207 net1209 net1208 net1210 net1212 and3
xi506 net1205 net1201 net1203 net1202 net1204 net1206 and3
xi505 net1199 net1195 net1197 net1196 net1198 net1200 and3
xi504 net1193 net1189 net1191 net1190 net1192 net1194 and3
xi503 net1187 net1183 net1185 net1184 net1186 net1188 and3
xi502 net1181 net1177 net1179 net1178 net1180 net1182 and3
xi501 net1175 net1171 net1173 net1172 net1174 net1176 and3
xi500 net1169 net1165 net1167 net1166 net1168 net1170 and3
xi499 net1163 net1159 net1161 net1160 net1162 net1164 and3
xi498 net1157 net1153 net1155 net1154 net1156 net1158 and3
xi497 net1151 net1147 net1149 net1148 net1150 net1152 and3
xi496 net1145 net1141 net1143 net1142 net1144 net1146 and3
xi495 net1139 net1135 net1137 net1136 net1138 net1140 and3
xi494 net1133 net1129 net1131 net1130 net1132 net1134 and3
xi493 net1127 net1123 net1125 net1124 net1126 net1128 and3
xi492 net1121 net1117 net1119 net1118 net1120 net1122 and3
xi491 net1115 net1111 net1113 net1112 net1114 net1116 and3
xi490 net1109 net1105 net1107 net1106 net1108 net1110 and3
xi489 net1103 net1099 net1101 net1100 net1102 net1104 and3
xi488 net1097 net1093 net1095 net1094 net1096 net1098 and3
xi487 net1091 net1087 net1089 net1088 net1090 net1092 and3
xi486 net1085 net1081 net1083 net1082 net1084 net1086 and3
xi485 net1079 net1075 net1077 net1076 net1078 net1080 and3
xi484 net1073 net1069 net1071 net1070 net1072 net1074 and3
xi483 net1067 net1063 net1065 net1064 net1066 net1068 and3
xi482 net1061 net1057 net1059 net1058 net1060 net1062 and3
xi481 net1055 net1051 net1053 net1052 net1054 net1056 and3
xi480 net1049 net1045 net1047 net1046 net1048 net1050 and3
xi479 net1043 net1039 net1041 net1040 net1042 net1044 and3
xi478 net1037 net1033 net1035 net1034 net1036 net1038 and3
xi477 net1031 net1027 net1029 net1028 net1030 net1032 and3
xi476 net1025 net1021 net1023 net1022 net1024 net1026 and3
xi475 net1019 net1015 net1017 net1016 net1018 net1020 and3
xi474 net1013 net1009 net1011 net1010 net1012 net1014 and3
xi473 net1007 net1003 net1005 net1004 net1006 net1008 and3
xi472 net1001 net997 net999 net998 net1000 net1002 and3
xi471 net995 net991 net993 net992 net994 net996 and3
xi470 net989 net985 net987 net986 net988 net990 and3
xi469 net983 net979 net981 net980 net982 net984 and3
xi468 net977 net973 net975 net974 net976 net978 and3
xi467 net971 net967 net969 net968 net970 net972 and3
xi466 net965 net961 net963 net962 net964 net966 and3
xi465 net959 net955 net957 net956 net958 net960 and3
xi464 net953 net949 net951 net950 net952 net954 and3
xi463 net947 net943 net945 net944 net946 net948 and3
xi462 net941 net937 net939 net938 net940 net942 and3
xi461 net935 net931 net933 net932 net934 net936 and3
xi460 net929 net925 net927 net926 net928 net930 and3
xi459 net923 net919 net921 net920 net922 net924 and3
xi458 net917 net913 net915 net914 net916 net918 and3
xi457 net911 net907 net909 net908 net910 net912 and3
xi456 net905 net901 net903 net902 net904 net906 and3
xi455 net899 net895 net897 net896 net898 net900 and3
xi454 net893 net889 net891 net890 net892 net894 and3
xi453 net887 net883 net885 net884 net886 net888 and3
xi452 net881 net877 net879 net878 net880 net882 and3
xi451 net875 net871 net873 net872 net874 net876 and3
xi450 net869 net865 net867 net866 net868 net870 and3
xi449 net863 net859 net861 net860 net862 net864 and3
xi448 net857 net853 net855 net854 net856 net858 and3
xi447 net851 net847 net849 net848 net850 net852 and3
xi446 net845 net841 net843 net842 net844 net846 and3
xi445 net839 net835 net837 net836 net838 net840 and3
xi444 net833 net829 net831 net830 net832 net834 and3
xi443 net827 net823 net825 net824 net826 net828 and3
xi442 net821 net817 net819 net818 net820 net822 and3
xi441 net815 net811 net813 net812 net814 net816 and3
xi440 net809 net805 net807 net806 net808 net810 and3
xi439 net803 net799 net801 net800 net802 net804 and3
xi438 net797 net793 net795 net794 net796 net798 and3
xi437 net791 net787 net789 net788 net790 net792 and3
xi436 net785 net781 net783 net782 net784 net786 and3
xi435 net779 net775 net777 net776 net778 net780 and3
xi434 net773 net769 net771 net770 net772 net774 and3
xi433 net767 net763 net765 net764 net766 net768 and3
xi432 net761 net757 net759 net758 net760 net762 and3
xi431 net755 net751 net753 net752 net754 net756 and3
xi430 net749 net745 net747 net746 net748 net750 and3
xi429 net743 net739 net741 net740 net742 net744 and3
xi428 net737 net733 net735 net734 net736 net738 and3
xi427 net731 net727 net729 net728 net730 net732 and3
xi426 net725 net721 net723 net722 net724 net726 and3
xi425 net719 net715 net717 net716 net718 net720 and3
xi424 net713 net709 net711 net710 net712 net714 and3
xi423 net707 net703 net705 net704 net706 net708 and3
xi422 net701 net697 net699 net698 net700 net702 and3
xi421 net695 net691 net693 net692 net694 net696 and3
xi420 net689 net685 net687 net686 net688 net690 and3
xi419 net683 net679 net681 net680 net682 net684 and3
xi418 net677 net673 net675 net674 net676 net678 and3
xi417 net671 net667 net669 net668 net670 net672 and3
xi416 net665 net661 net663 net662 net664 net666 and3
xi415 net659 net655 net657 net656 net658 net660 and3
xi414 net653 net649 net651 net650 net652 net654 and3
xi413 net647 net643 net645 net644 net646 net648 and3
xi412 net641 net637 net639 net638 net640 net642 and3
xi411 net635 net631 net633 net632 net634 net636 and3
xi410 net629 net625 net627 net626 net628 net630 and3
xi409 net623 net619 net621 net620 net622 net624 and3
xi408 net617 net613 net615 net614 net616 net618 and3
xi407 net611 net607 net609 net608 net610 net612 and3
xi406 net605 net601 net603 net602 net604 net606 and3
xi405 net599 net595 net597 net596 net598 net600 and3
xi404 net593 net589 net591 net590 net592 net594 and3
xi403 net587 net583 net585 net584 net586 net588 and3
xi402 net581 net577 net579 net578 net580 net582 and3
xi401 net575 net571 net573 net572 net574 net576 and3
xi400 net569 net565 net567 net566 net568 net570 and3
xi399 net563 net559 net561 net560 net562 net564 and3
xi398 net557 net553 net555 net554 net556 net558 and3
xi397 net551 net547 net549 net548 net550 net552 and3
xi396 net545 net541 net543 net542 net544 net546 and3
xi395 net539 net535 net537 net536 net538 net540 and3
xi394 net533 net529 net531 net530 net532 net534 and3
xi393 net527 net523 net525 net524 net526 net528 and3
xi392 net521 net517 net519 net518 net520 net522 and3
xi391 net515 net511 net513 net512 net514 net516 and3
xi390 net509 net505 net507 net506 net508 net510 and3
xi389 net503 net499 net501 net500 net502 net504 and3
xi388 net497 net493 net495 net494 net496 net498 and3
xi387 net491 net487 net489 net488 net490 net492 and3
xi386 net485 net481 net483 net482 net484 net486 and3
xi385 net479 net475 net477 net476 net478 net480 and3
xi384 net473 net469 net471 net470 net472 net474 and3
xi383 net467 net463 net465 net464 net466 net468 and3
xi382 net461 net457 net459 net458 net460 net462 and3
xi381 net455 net451 net453 net452 net454 net456 and3
xi380 net449 net445 net447 net446 net448 net450 and3
xi379 net443 net439 net441 net440 net442 net444 and3
xi378 net437 net433 net435 net434 net436 net438 and3
xi377 net431 net427 net429 net428 net430 net432 and3
xi376 net425 net421 net423 net422 net424 net426 and3
xi375 net419 net415 net417 net416 net418 net420 and3
xi374 net413 net409 net411 net410 net412 net414 and3
xi373 net407 net403 net405 net404 net406 net408 and3
xi372 net401 net397 net399 net398 net400 net402 and3
xi371 net395 net391 net393 net392 net394 net396 and3
xi370 net389 net385 net387 net386 net388 net390 and3
xi369 net383 net379 net381 net380 net382 net384 and3
xi368 net377 net373 net375 net374 net376 net378 and3
xi367 net371 net367 net369 net368 net370 net372 and3
xi366 net365 net361 net363 net362 net364 net366 and3
xi365 net359 net355 net357 net356 net358 net360 and3
xi364 net353 net349 net351 net350 net352 net354 and3
xi363 net347 net343 net345 net344 net346 net348 and3
xi362 net341 net337 net339 net338 net340 net342 and3
xi361 net335 net331 net333 net332 net334 net336 and3
xi360 net329 net325 net327 net326 net328 net330 and3
xi359 net323 net319 net321 net320 net322 net324 and3
xi358 net317 net313 net315 net314 net316 net318 and3
xi357 net311 net307 net309 net308 net310 net312 and3
xi356 net305 net301 net303 net302 net304 net306 and3
xi355 net299 net295 net297 net296 net298 net300 and3
xi354 net293 net289 net291 net290 net292 net294 and3
xi353 net287 net283 net285 net284 net286 net288 and3
xi352 net281 net277 net279 net278 net280 net282 and3
xi351 net275 net271 net273 net272 net274 net276 and3
xi350 net269 net265 net267 net266 net268 net270 and3
xi349 net263 net259 net261 net260 net262 net264 and3
xi348 net257 net253 net255 net254 net256 net258 and3
xi347 net251 net247 net249 net248 net250 net252 and3
xi346 net245 net241 net243 net242 net244 net246 and3
xi345 net239 net235 net237 net236 net238 net240 and3
xi344 net233 net229 net231 net230 net232 net234 and3
xi343 net227 net223 net225 net224 net226 net228 and3
xi342 net221 net217 net219 net218 net220 net222 and3
xi341 net215 net211 net213 net212 net214 net216 and3
xi340 net209 net205 net207 net206 net208 net210 and3
xi339 net203 net199 net201 net200 net202 net204 and3
xi338 net197 net193 net195 net194 net196 net198 and3
xi337 net191 net187 net189 net188 net190 net192 and3
xi336 net185 net181 net183 net182 net184 net186 and3
xi335 net179 net175 net177 net176 net178 net180 and3
xi334 net173 net169 net171 net170 net172 net174 and3
xi333 net167 net163 net165 net164 net166 net168 and3
xi332 net161 net157 net159 net158 net160 net162 and3
xi331 net155 net151 net153 net152 net154 net156 and3
xi330 net149 net145 net147 net146 net148 net150 and3
xi329 net143 net139 net141 net140 net142 net144 and3
xi328 net137 net133 net135 net134 net136 net138 and3
xi327 net131 net127 net129 net128 net130 net132 and3
xi326 net125 net121 net123 net122 net124 net126 and3
xi325 net119 net115 net117 net116 net118 net120 and3
xi324 net113 net109 net111 net110 net112 net114 and3
xi323 net107 net103 net105 net104 net106 net108 and3
xi322 net101 net97 net99 net98 net100 net102 and3
xi321 net95 net91 net93 net92 net94 net96 and3
xi320 net89 net85 net87 net86 net88 net90 and3
xi319 net83 net79 net81 net80 net82 net84 and3
xi318 net77 net73 net75 net74 net76 net78 and3
xi317 net71 net67 net69 net68 net70 net72 and3
xi316 net65 net61 net63 net62 net64 net66 and3
xi315 net59 net55 net57 net56 net58 net60 and3
xi314 net53 net49 net51 net50 net52 net54 and3
xi313 net47 net43 net45 net44 net46 net48 and3
xi312 net41 net37 net39 net38 net40 net42 and3
xi311 net35 net31 net33 net32 net34 net36 and3
xi310 net29 net25 net27 net26 net28 net30 and3
xi309 net23 net19 net21 net20 net22 net24 and3
xi308 net17 net13 net15 net14 net16 net18 and3
xi307 net11 net7 net9 net8 net10 net12 and3
xi306 net5 net1 net3 net2 net4 net6 and3
xi305 net2447 net2443 net2445 net2444 net2446 net2448 and3
xi304 net2441 net2437 net2439 net2438 net2440 net2442 and3
xi303 net2435 net2431 net2433 net2432 net2434 net2436 and3
xi302 net2429 net2425 net2427 net2426 net2428 net2430 and3
xi301 net2423 net2419 net2421 net2420 net2422 net2424 and3
xi300 net2417 net2413 net2415 net2414 net2416 net2418 and3
xi299 net2411 net2407 net2409 net2408 net2410 net2412 and3
xi298 net2405 net2401 net2403 net2402 net2404 net2406 and3
xi297 net2399 net2395 net2397 net2396 net2398 net2400 and3
xi296 net2393 net2389 net2391 net2390 net2392 net2394 and3
xi295 net2387 net2383 net2385 net2384 net2386 net2388 and3
xi294 net2381 net2377 net2379 net2378 net2380 net2382 and3
xi293 net2375 net2371 net2373 net2372 net2374 net2376 and3
xi292 net2369 net2365 net2367 net2366 net2368 net2370 and3
xi291 net2363 net2359 net2361 net2360 net2362 net2364 and3
xi290 net2357 net2353 net2355 net2354 net2356 net2358 and3
xi289 net2351 net2347 net2349 net2348 net2350 net2352 and3
xi288 net2345 net2341 net2343 net2342 net2344 net2346 and3
xi287 net2339 net2335 net2337 net2336 net2338 net2340 and3
xi286 net2333 net2329 net2331 net2330 net2332 net2334 and3
xi285 net2327 net2323 net2325 net2324 net2326 net2328 and3
xi284 net2321 net2317 net2319 net2318 net2320 net2322 and3
xi283 net2315 net2311 net2313 net2312 net2314 net2316 and3
xi282 net2309 net2305 net2307 net2306 net2308 net2310 and3
xi281 net2303 net2299 net2301 net2300 net2302 net2304 and3
xi280 net2297 net2293 net2295 net2294 net2296 net2298 and3
xi279 net2291 net2287 net2289 net2288 net2290 net2292 and3
xi278 net2285 net2281 net2283 net2282 net2284 net2286 and3
xi277 net2279 net2275 net2277 net2276 net2278 net2280 and3
xi276 net2273 net2269 net2271 net2270 net2272 net2274 and3
xi275 net2267 net2263 net2265 net2264 net2266 net2268 and3
xi274 net2261 net2257 net2259 net2258 net2260 net2262 and3
xi273 net2255 net2251 net2253 net2252 net2254 net2256 and3
xi272 net2249 net2245 net2247 net2246 net2248 net2250 and3
xi271 net2243 net2239 net2241 net2240 net2242 net2244 and3
xi270 net2237 net2233 net2235 net2234 net2236 net2238 and3
xi269 net2231 net2227 net2229 net2228 net2230 net2232 and3
xi268 net2225 net2221 net2223 net2222 net2224 net2226 and3
xi267 net2219 net2215 net2217 net2216 net2218 net2220 and3
xi266 net2213 net2209 net2211 net2210 net2212 net2214 and3
xi265 net2207 net2203 net2205 net2204 net2206 net2208 and3
xi264 net2201 net2197 net2199 net2198 net2200 net2202 and3
xi263 net2195 net2191 net2193 net2192 net2194 net2196 and3
xi262 net2189 net2185 net2187 net2186 net2188 net2190 and3
xi261 net2183 net2179 net2181 net2180 net2182 net2184 and3
xi260 net2177 net2173 net2175 net2174 net2176 net2178 and3
xi259 net2171 net2167 net2169 net2168 net2170 net2172 and3
xi258 net2165 net2161 net2163 net2162 net2164 net2166 and3
xi257 net2159 net2155 net2157 net2156 net2158 net2160 and3
xi256 net2153 net2149 net2151 net2150 net2152 net2154 and3
xi255 net2147 net2143 net2145 net2144 net2146 net2148 and3
xi254 net2141 net2137 net2139 net2138 net2140 net2142 and3
xi253 net2135 net2131 net2133 net2132 net2134 net2136 and3
xi252 net2129 net2125 net2127 net2126 net2128 net2130 and3
xi251 net2123 net2119 net2121 net2120 net2122 net2124 and3
xi250 net2117 net2113 net2115 net2114 net2116 net2118 and3
xi249 net2111 net2107 net2109 net2108 net2110 net2112 and3
xi248 net2105 net2101 net2103 net2102 net2104 net2106 and3
xi247 net2099 net2095 net2097 net2096 net2098 net2100 and3
xi246 net2093 net2089 net2091 net2090 net2092 net2094 and3
xi245 net2087 net2083 net2085 net2084 net2086 net2088 and3
xi244 net2081 net2077 net2079 net2078 net2080 net2082 and3
xi243 net2075 net2071 net2073 net2072 net2074 net2076 and3
xi242 net2069 net2065 net2067 net2066 net2068 net2070 and3
xi241 net2063 net2059 net2061 net2060 net2062 net2064 and3
xi240 net2057 net2053 net2055 net2054 net2056 net2058 and3
xi239 net2051 net2047 net2049 net2048 net2050 net2052 and3
xi238 net2045 net2041 net2043 net2042 net2044 net2046 and3
xi237 net2039 net2035 net2037 net2036 net2038 net2040 and3
xi236 net2033 net2029 net2031 net2030 net2032 net2034 and3
xi235 net2027 net2023 net2025 net2024 net2026 net2028 and3
xi234 net2021 net2017 net2019 net2018 net2020 net2022 and3
xi233 net2015 net2011 net2013 net2012 net2014 net2016 and3
xi232 net2009 net2005 net2007 net2006 net2008 net2010 and3
xi231 net2003 net1999 net2001 net2000 net2002 net2004 and3
xi230 net1997 net1993 net1995 net1994 net1996 net1998 and3
xi229 net1991 net1987 net1989 net1988 net1990 net1992 and3
xi228 net1985 net1981 net1983 net1982 net1984 net1986 and3
xi227 net1979 net1975 net1977 net1976 net1978 net1980 and3
xi226 net1973 net1969 net1971 net1970 net1972 net1974 and3
xi225 net1967 net1963 net1965 net1964 net1966 net1968 and3
xi224 net1961 net1957 net1959 net1958 net1960 net1962 and3
xi223 net1955 net1951 net1953 net1952 net1954 net1956 and3
xi222 net1949 net1945 net1947 net1946 net1948 net1950 and3
xi221 net1943 net1939 net1941 net1940 net1942 net1944 and3
xi220 net1937 net1933 net1935 net1934 net1936 net1938 and3
xi219 net1931 net1927 net1929 net1928 net1930 net1932 and3
xi218 net1925 net1921 net1923 net1922 net1924 net1926 and3
xi217 net1919 net1915 net1917 net1916 net1918 net1920 and3
xi216 net1913 net1909 net1911 net1910 net1912 net1914 and3
xi215 net1907 net1903 net1905 net1904 net1906 net1908 and3
xi214 net1901 net1897 net1899 net1898 net1900 net1902 and3
xi213 net1895 net1891 net1893 net1892 net1894 net1896 and3
xi212 net1889 net1885 net1887 net1886 net1888 net1890 and3
xi211 net1883 net1879 net1881 net1880 net1882 net1884 and3
xi210 net1877 net1873 net1875 net1874 net1876 net1878 and3
xi209 net1871 net1867 net1869 net1868 net1870 net1872 and3
xi208 net1865 net1861 net1863 net1862 net1864 net1866 and3
xi207 net1859 net1855 net1857 net1856 net1858 net1860 and3
xi206 net1853 net1849 net1851 net1850 net1852 net1854 and3
xi205 net1847 net1843 net1845 net1844 net1846 net1848 and3
xi204 net1841 net1837 net1839 net1838 net1840 net1842 and3
xi203 net1835 net1831 net1833 net1832 net1834 net1836 and3
xi202 net1829 net1825 net1827 net1826 net1828 net1830 and3
xi201 net1823 net1819 net1821 net1820 net1822 net1824 and3
xi200 net1817 net1813 net1815 net1814 net1816 net1818 and3
xi199 net1811 net1807 net1809 net1808 net1810 net1812 and3
xi198 net1805 net1801 net1803 net1802 net1804 net1806 and3
xi197 net1799 net1795 net1797 net1796 net1798 net1800 and3
xi196 net1793 net1789 net1791 net1790 net1792 net1794 and3
xi195 net1787 net1783 net1785 net1784 net1786 net1788 and3
xi194 net1781 net1777 net1779 net1778 net1780 net1782 and3
xi193 net1775 net1771 net1773 net1772 net1774 net1776 and3
xi192 net1769 net1765 net1767 net1766 net1768 net1770 and3
xi191 net1763 net1759 net1761 net1760 net1762 net1764 and3
xi190 net1757 net1753 net1755 net1754 net1756 net1758 and3
xi189 net1751 net1747 net1749 net1748 net1750 net1752 and3
xi188 net1745 net1741 net1743 net1742 net1744 net1746 and3
xi187 net1739 net1735 net1737 net1736 net1738 net1740 and3
xi186 net1733 net1729 net1731 net1730 net1732 net1734 and3
xi185 net1727 net1723 net1725 net1724 net1726 net1728 and3
xi184 net1721 net1717 net1719 net1718 net1720 net1722 and3
xi183 net1715 net1711 net1713 net1712 net1714 net1716 and3
xi182 net1709 net1705 net1707 net1706 net1708 net1710 and3
xi181 net1703 net1699 net1701 net1700 net1702 net1704 and3
xi180 net1697 net1693 net1695 net1694 net1696 net1698 and3
xi179 net1691 net1687 net1689 net1688 net1690 net1692 and3
xi178 net1685 net1681 net1683 net1682 net1684 net1686 and3
xi177 net1679 net1675 net1677 net1676 net1678 net1680 and3
xi176 net1673 net1669 net1671 net1670 net1672 net1674 and3
xi175 net1667 net1663 net1665 net1664 net1666 net1668 and3
xi174 net1661 net1657 net1659 net1658 net1660 net1662 and3
xi173 net1655 net1651 net1653 net1652 net1654 net1656 and3
xi172 net1649 net1645 net1647 net1646 net1648 net1650 and3
xi171 net1643 net1639 net1641 net1640 net1642 net1644 and3
xi170 net1637 net1633 net1635 net1634 net1636 net1638 and3
xi169 net1631 net1627 net1629 net1628 net1630 net1632 and3
xi168 net1625 net1621 net1623 net1622 net1624 net1626 and3
xi167 net1619 net1615 net1617 net1616 net1618 net1620 and3
xi166 net1613 net1609 net1611 net1610 net1612 net1614 and3
xi165 net1607 net1603 net1605 net1604 net1606 net1608 and3
xi164 net1601 net1597 net1599 net1598 net1600 net1602 and3
xi163 net1595 net1591 net1593 net1592 net1594 net1596 and3
xi162 net1589 net1585 net1587 net1586 net1588 net1590 and3
xi161 net1583 net1579 net1581 net1580 net1582 net1584 and3
xi160 net1577 net1573 net1575 net1574 net1576 net1578 and3
xi159 net1571 net1567 net1569 net1568 net1570 net1572 and3
xi158 net1565 net1561 net1563 net1562 net1564 net1566 and3
xi157 net1559 net1555 net1557 net1556 net1558 net1560 and3
xi156 net1553 net1549 net1551 net1550 net1552 net1554 and3
xi155 net1547 net1543 net1545 net1544 net1546 net1548 and3
xi154 net1541 net1537 net1539 net1538 net1540 net1542 and3
xi153 net1535 net1531 net1533 net1532 net1534 net1536 and3
xi152 net1529 net1525 net1527 net1526 net1528 net1530 and3
xi151 net1523 net1519 net1521 net1520 net1522 net1524 and3
xi150 net1517 net1513 net1515 net1514 net1516 net1518 and3
xi149 net1511 net1507 net1509 net1508 net1510 net1512 and3
xi148 net1505 net1501 net1503 net1502 net1504 net1506 and3
xi147 net1499 net1495 net1497 net1496 net1498 net1500 and3
xi146 net1493 net1489 net1491 net1490 net1492 net1494 and3
xi145 net1487 net1483 net1485 net1484 net1486 net1488 and3
xi144 net1481 net1477 net1479 net1478 net1480 net1482 and3
xi143 net1475 net1471 net1473 net1472 net1474 net1476 and3
xi142 net1469 net1465 net1467 net1466 net1468 net1470 and3
xi141 net1463 net1459 net1461 net1460 net1462 net1464 and3
xi140 net1457 net1453 net1455 net1454 net1456 net1458 and3
xi139 net1451 net1447 net1449 net1448 net1450 net1452 and3
xi138 net1445 net1441 net1443 net1442 net1444 net1446 and3
xi137 net1439 net1435 net1437 net1436 net1438 net1440 and3
xi136 net1433 net1429 net1431 net1430 net1432 net1434 and3
xi135 net1427 net1423 net1425 net1424 net1426 net1428 and3
xi134 net1421 net1417 net1419 net1418 net1420 net1422 and3
xi133 net1415 net1411 net1413 net1412 net1414 net1416 and3
xi132 net1409 net1405 net1407 net1406 net1408 net1410 and3
xi131 net1403 net1399 net1401 net1400 net1402 net1404 and3
xi130 net1397 net1393 net1395 net1394 net1396 net1398 and3
xi129 net1391 net1387 net1389 net1388 net1390 net1392 and3
xi128 net1385 net1381 net1383 net1382 net1384 net1386 and3
xi127 net1379 net1375 net1377 net1376 net1378 net1380 and3
xi126 net1373 net1369 net1371 net1370 net1372 net1374 and3
xi125 net1367 net1363 net1365 net1364 net1366 net1368 and3
xi124 net1361 net1357 net1359 net1358 net1360 net1362 and3
xi123 net1355 net1351 net1353 net1352 net1354 net1356 and3
xi122 net1349 net1345 net1347 net1346 net1348 net1350 and3
xi121 net1343 net1339 net1341 net1340 net1342 net1344 and3
xi120 net1337 net1333 net1335 net1334 net1336 net1338 and3
xi119 net1331 net1327 net1329 net1328 net1330 net1332 and3
xi118 net1325 net1321 net1323 net1322 net1324 net1326 and3
xi117 net1319 net1315 net1317 net1316 net1318 net1320 and3
xi116 net1313 net1309 net1311 net1310 net1312 net1314 and3
xi115 net1307 net1303 net1305 net1304 net1306 net1308 and3
xi114 net1301 net1297 net1299 net1298 net1300 net1302 and3
xi113 net1295 net1291 net1293 net1292 net1294 net1296 and3
xi112 net1289 net1285 net1287 net1286 net1288 net1290 and3
xi111 net1283 net1279 net1281 net1280 net1282 net1284 and3
xi110 net1277 net1273 net1275 net1274 net1276 net1278 and3
xi109 net1271 net1267 net1269 net1268 net1270 net1272 and3
xi108 net1265 net1261 net1263 net1262 net1264 net1266 and3
xi107 net1259 net1255 net1257 net1256 net1258 net1260 and3
xi106 net1253 net1249 net1251 net1250 net1252 net1254 and3
xi105 net1247 net1243 net1245 net1244 net1246 net1248 and3
xi104 net1241 net1237 net1239 net1238 net1240 net1242 and3
xi103 net1235 net1231 net1233 net1232 net1234 net1236 and3
xi102 net1229 net1225 net1227 net1226 net1228 net1230 and3
xi101 net3111 net3107 net3109 net3108 net3110 net3112 and3
xi100 net3105 net3101 net3103 net3102 net3104 net3106 and3
xi99 net3099 net3095 net3097 net3096 net3098 net3100 and3
xi98 net3093 net3089 net3091 net3090 net3092 net3094 and3
xi97 net3087 net3083 net3085 net3084 net3086 net3088 and3
xi96 net3081 net3077 net3079 net3078 net3080 net3082 and3
xi95 net3075 net3071 net3073 net3072 net3074 net3076 and3
xi94 net3069 net3065 net3067 net3066 net3068 net3070 and3
xi93 net3063 net3059 net3061 net3060 net3062 net3064 and3
xi92 net3057 net3053 net3055 net3054 net3056 net3058 and3
xi91 net3051 net3047 net3049 net3048 net3050 net3052 and3
xi90 net3045 net3041 net3043 net3042 net3044 net3046 and3
xi89 net3039 net3035 net3037 net3036 net3038 net3040 and3
xi88 net3033 net3029 net3031 net3030 net3032 net3034 and3
xi87 net3027 net3023 net3025 net3024 net3026 net3028 and3
xi86 net3021 net3017 net3019 net3018 net3020 net3022 and3
xi85 net3015 net3011 net3013 net3012 net3014 net3016 and3
xi84 net3009 net3005 net3007 net3006 net3008 net3010 and3
xi83 net3003 net2999 net3001 net3000 net3002 net3004 and3
xi82 net2997 net2993 net2995 net2994 net2996 net2998 and3
xi81 net2991 net2987 net2989 net2988 net2990 net2992 and3
xi80 net2985 net2981 net2983 net2982 net2984 net2986 and3
xi79 net2979 net2975 net2977 net2976 net2978 net2980 and3
xi78 net2973 net2969 net2971 net2970 net2972 net2974 and3
xi77 net2967 net2963 net2965 net2964 net2966 net2968 and3
xi76 net2961 net2957 net2959 net2958 net2960 net2962 and3
xi75 net2955 net2951 net2953 net2952 net2954 net2956 and3
xi74 net2949 net2945 net2947 net2946 net2948 net2950 and3
xi73 net2943 net2939 net2941 net2940 net2942 net2944 and3
xi72 net2937 net2933 net2935 net2934 net2936 net2938 and3
xi71 net2931 net2927 net2929 net2928 net2930 net2932 and3
xi70 net2925 net2921 net2923 net2922 net2924 net2926 and3
xi69 net2919 net2915 net2917 net2916 net2918 net2920 and3
xi68 net2913 net2909 net2911 net2910 net2912 net2914 and3
xi67 net2907 net2903 net2905 net2904 net2906 net2908 and3
xi66 net2901 net2897 net2899 net2898 net2900 net2902 and3
xi65 net2895 net2891 net2893 net2892 net2894 net2896 and3
xi64 net2889 net2885 net2887 net2886 net2888 net2890 and3
xi63 net2883 net2879 net2881 net2880 net2882 net2884 and3
xi62 net2877 net2873 net2875 net2874 net2876 net2878 and3
xi61 net2871 net2867 net2869 net2868 net2870 net2872 and3
xi60 net2865 net2861 net2863 net2862 net2864 net2866 and3
xi59 net2859 net2855 net2857 net2856 net2858 net2860 and3
xi58 net2853 net2849 net2851 net2850 net2852 net2854 and3
xi57 net2847 net2843 net2845 net2844 net2846 net2848 and3
xi56 net2841 net2837 net2839 net2838 net2840 net2842 and3
xi55 net2835 net2831 net2833 net2832 net2834 net2836 and3
xi54 net2829 net2825 net2827 net2826 net2828 net2830 and3
xi53 net2823 net2819 net2821 net2820 net2822 net2824 and3
xi52 net2817 net2813 net2815 net2814 net2816 net2818 and3
xi51 net2811 net2807 net2809 net2808 net2810 net2812 and3
xi50 net2805 net2801 net2803 net2802 net2804 net2806 and3
xi49 net2799 net2795 net2797 net2796 net2798 net2800 and3
xi48 net2793 net2789 net2791 net2790 net2792 net2794 and3
xi47 net2787 net2783 net2785 net2784 net2786 net2788 and3
xi46 net2781 net2777 net2779 net2778 net2780 net2782 and3
xi45 net2775 net2771 net2773 net2772 net2774 net2776 and3
xi44 net2769 net2765 net2767 net2766 net2768 net2770 and3
xi43 net2763 net2759 net2761 net2760 net2762 net2764 and3
xi42 net2757 net2753 net2755 net2754 net2756 net2758 and3
xi41 net2751 net2747 net2749 net2748 net2750 net2752 and3
xi40 net2745 net2741 net2743 net2742 net2744 net2746 and3
xi39 net2739 net2735 net2737 net2736 net2738 net2740 and3
xi38 net2733 net2729 net2731 net2730 net2732 net2734 and3
xi37 net2727 net2723 net2725 net2724 net2726 net2728 and3
xi36 net2721 net2717 net2719 net2718 net2720 net2722 and3
xi35 net2715 net2711 net2713 net2712 net2714 net2716 and3
xi34 net2709 net2705 net2707 net2706 net2708 net2710 and3
xi33 net2703 net2699 net2701 net2700 net2702 net2704 and3
xi32 net2697 net2693 net2695 net2694 net2696 net2698 and3
xi31 net2691 net2687 net2689 net2688 net2690 net2692 and3
xi30 net2685 net2681 net2683 net2682 net2684 net2686 and3
xi29 net2679 net2675 net2677 net2676 net2678 net2680 and3
xi28 net2673 net2669 net2671 net2670 net2672 net2674 and3
xi27 net2667 net2663 net2665 net2664 net2666 net2668 and3
xi26 net2661 net2657 net2659 net2658 net2660 net2662 and3
xi25 net2655 net2651 net2653 net2652 net2654 net2656 and3
xi24 net2649 net2645 net2647 net2646 net2648 net2650 and3
xi23 net2643 net2639 net2641 net2640 net2642 net2644 and3
xi22 net2637 net2633 net2635 net2634 net2636 net2638 and3
xi21 net2631 net2627 net2629 net2628 net2630 net2632 and3
xi20 net2625 net2621 net2623 net2622 net2624 net2626 and3
xi19 net2619 net2615 net2617 net2616 net2618 net2620 and3
xi18 net2613 net2609 net2611 net2610 net2612 net2614 and3
xi17 net2607 net2603 net2605 net2604 net2606 net2608 and3
xi16 net2601 net2597 net2599 net2598 net2600 net2602 and3
xi15 net2595 net2591 net2593 net2592 net2594 net2596 and3
xi14 net2589 net2585 net2587 net2586 net2588 net2590 and3
xi13 net2583 net2579 net2581 net2580 net2582 net2584 and3
xi12 net2577 net2573 net2575 net2574 net2576 net2578 and3
xi11 net2571 net2567 net2569 net2568 net2570 net2572 and3
xi10 net2565 net2561 net2563 net2562 net2564 net2566 and3
xi9 net2559 net2555 net2557 net2556 net2558 net2560 and3
xi8 net2553 net2549 net2551 net2550 net2552 net2554 and3
xi7 net2547 net2543 net2545 net2544 net2546 net2548 and3
xi6 net2541 net2537 net2539 net2538 net2540 net2542 and3
xi5 net2535 net2531 net2533 net2532 net2534 net2536 and3
xi4 net2529 net2525 net2527 net2526 net2528 net2530 and3
xi3 net2523 net2519 net2521 net2520 net2522 net2524 and3
.END

