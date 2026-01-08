** Generated for: hspiceD
** Generated on: Nov 24 23:34:56 2025
** Design library name: NandiniSRAM
** Design cell name: rowDecoder512
** Design view name: schematic
.GLOBAL vss! vdd!

** Library name: NandiniSRAM
** Cell name: inverter
** View name: schematic
.subckt inverter_schematic a zn
xm0 zn a vss! vss! nch_svt_mac l=16e-9 nfin=1 w=10e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm1 zn a vdd! vdd! pch_svt_mac l=16e-9 nfin=1 w=10e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
.ends inverter_schematic
** End of subcircuit definition.

** Library name: NandiniSRAM
** Cell name: Inv8
** View name: schematic
.subckt Inv8 a zn
xm0 zn a vss! vss! nch_svt_mac l=16e-9 nfin=8 w=346e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm1 zn a vdd! vdd! pch_svt_mac l=16e-9 nfin=8 w=346e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
.ends Inv8
** End of subcircuit definition.

** Library name: NandiniSRAM
** Cell name: and3_inv8
** View name: schematic
.subckt and3_inv8 a1 a2 a3 zn
xi1 a zn Inv8
xm3 a a1 net11 vss! nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm4 net11 a2 net1 vss! nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm5 net1 a3 vss! vss! nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm2 a a3 vdd! vdd! pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm1 a a2 vdd! vdd! pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm0 a a1 vdd! vdd! pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
.ends and3_inv8
** End of subcircuit definition.

** Library name: NandiniSRAM
** Cell name: subblock2
** View name: schematic
.subckt subblock2_schematic a3 a4 a5 pd1_0 pd1_1 pd1_2 pd1_3 pd1_4 pd1_5 pd1_6 pd1_7
xi33 a5 a5b inverter_schematic
xi34 a4 a4b inverter_schematic
xi35 a3 a3b inverter_schematic
xi45 a5b a4b a3 pd1_6 and3_inv8
xi46 a5b a4 a3b pd1_5 and3_inv8
xi50 a5 a4 a3b pd1_1 and3_inv8
xi49 a5 a4b a3 pd1_2 and3_inv8
xi48 a5 a4b a3b pd1_3 and3_inv8
xi47 a5b a4 a3 pd1_4 and3_inv8
xi44 a5b a4b a3b pd1_7 and3_inv8
xi51 a5 a4 a3 pd1_0 and3_inv8
.ends subblock2_schematic
** End of subcircuit definition.

** Library name: NandiniSRAM
** Cell name: and4
** View name: schematic
.subckt and4_schematic a1 a2 a3 a4 zn
xi4 net4 zn Inv8
xm3 net4 a1 net2 vss! nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm4 net2 a2 net3 vss! nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm5 net3 a3 vss! vss! nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm7 vss! a4 vss! vss! nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm6 net4 a4 vdd! vdd! pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm2 net4 a3 vdd! vdd! pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm1 net4 a2 vdd! vdd! pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm0 net4 a1 vdd! vdd! pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
.ends and4_schematic
** End of subcircuit definition.

** Library name: NandiniSRAM
** Cell name: subblock1
** View name: schematic
.subckt subblock1_schematic a0 a1 a2 clk pd0_0 pd0_1 pd0_2 pd0_3 pd0_4 pd0_5 pd0_6 pd0_7
xi26 a0 a1b a2b clk pd0_6 and4_schematic
xi25 a0b a1b a2b clk pd0_7 and4_schematic
xi31 a0b a1 a2 clk pd0_1 and4_schematic
xi32 a0 a1 a2 clk pd0_0 and4_schematic
xi29 a0b a1b a2 clk pd0_3 and4_schematic
xi30 a0 a1b a2 clk pd0_2 and4_schematic
xi28 a0 a1 a2b clk pd0_4 and4_schematic
xi27 a0b a1 a2b clk pd0_5 and4_schematic
xi23 a1 a1b inverter_schematic
xi22 a2 a2b inverter_schematic
xi24 a0 a0b inverter_schematic
.ends subblock1_schematic
** End of subcircuit definition.

** Library name: NandiniSRAM
** Cell name: subblock3
** View name: schematic
.subckt subblock3_schematic a6 a7 a8 pd2_0 pd2_1 pd2_2 pd2_3 pd2_4 pd2_5 pd2_6 pd2_7
xi12 a8b a7b a6 pd2_6 and3_inv8
xi11 a8b a7b a6b pd2_7 and3_inv8
xi13 a8b a7 a6b pd2_5 and3_inv8
xi14 a8b a7 a6 pd2_4 and3_inv8
xi15 a8 a7b a6b pd2_3 and3_inv8
xi16 a8 a7b a6 pd2_2 and3_inv8
xi17 a8 a7 a6b pd2_1 and3_inv8
xi18 a8 a7 a6 pd2_0 and3_inv8
xi8 a8 a8b inverter_schematic
xi9 a7 a7b inverter_schematic
xi10 a6 a6b inverter_schematic
.ends subblock3_schematic
** End of subcircuit definition.

** Library name: NandiniSRAM
** Cell name: inv2
** View name: schematic
.subckt inv2 a zn
xm0 zn a vss! vss! nch_svt_mac l=16e-9 nfin=2 w=58e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm1 zn a vdd! vdd! pch_svt_mac l=16e-9 nfin=2 w=58e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
.ends inv2
** End of subcircuit definition.

** Library name: NandiniSRAM
** Cell name: and3
** View name: schematic
.subckt and3_schematic a1 a2 a3 zn
xm5 net2 a3 vss! vss! nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm3 a a1 net1 vss! nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm4 net1 a2 net2 vss! nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm2 a a3 vdd! vdd! pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm1 a a2 vdd! vdd! pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm0 a a1 vdd! vdd! pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xi5 a zn inv2
.ends and3_schematic
** End of subcircuit definition.

** Library name: NandiniSRAM
** Cell name: inv4
** View name: schematic
.subckt inv4 a zn
xm0 zn a vss! vss! nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm1 zn a vdd! vdd! pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
.ends inv4
** End of subcircuit definition.

** Library name: NandiniSRAM
** Cell name: rowDecoder512
** View name: schematic
xi0 a3 a4 a5 net15 net14 net13 net16 net8 net2 net17 net18 subblock2_schematic
xi1 a0 a1 a2 clk net7 net6 net5 net4 net3 net11 net10 net9 subblock1_schematic
xi2 a6 a7 a8 net19 net20 net21 net22 net23 net1 net12 net24 subblock3_schematic
xi_and_511 net19 net15 net7 net536 and3_schematic
xi_and_510 net19 net15 net6 net535 and3_schematic
xi_and_509 net19 net15 net5 net534 and3_schematic
xi_and_508 net19 net15 net4 net533 and3_schematic
xi_and_507 net19 net15 net3 net532 and3_schematic
xi_and_506 net19 net15 net11 net531 and3_schematic
xi_and_505 net19 net15 net10 net530 and3_schematic
xi_and_504 net19 net15 net9 net529 and3_schematic
xi_and_503 net19 net14 net7 net528 and3_schematic
xi_and_502 net19 net14 net6 net527 and3_schematic
xi_and_501 net19 net14 net5 net526 and3_schematic
xi_and_500 net19 net14 net4 net525 and3_schematic
xi_and_499 net19 net14 net3 net524 and3_schematic
xi_and_498 net19 net14 net11 net523 and3_schematic
xi_and_497 net19 net14 net10 net522 and3_schematic
xi_and_496 net19 net14 net9 net521 and3_schematic
xi_and_495 net19 net13 net7 net520 and3_schematic
xi_and_494 net19 net13 net6 net519 and3_schematic
xi_and_493 net19 net13 net5 net518 and3_schematic
xi_and_492 net19 net13 net4 net517 and3_schematic
xi_and_491 net19 net13 net3 net516 and3_schematic
xi_and_490 net19 net13 net11 net515 and3_schematic
xi_and_489 net19 net13 net10 net514 and3_schematic
xi_and_488 net19 net13 net9 net513 and3_schematic
xi_and_487 net19 net16 net7 net512 and3_schematic
xi_and_486 net19 net16 net6 net511 and3_schematic
xi_and_485 net19 net16 net5 net510 and3_schematic
xi_and_484 net19 net16 net4 net509 and3_schematic
xi_and_483 net19 net16 net3 net508 and3_schematic
xi_and_482 net19 net16 net11 net507 and3_schematic
xi_and_481 net19 net16 net10 net506 and3_schematic
xi_and_480 net19 net16 net9 net505 and3_schematic
xi_and_479 net19 net8 net7 net504 and3_schematic
xi_and_478 net19 net8 net6 net503 and3_schematic
xi_and_477 net19 net8 net5 net502 and3_schematic
xi_and_476 net19 net8 net4 net501 and3_schematic
xi_and_475 net19 net8 net3 net500 and3_schematic
xi_and_474 net19 net8 net11 net499 and3_schematic
xi_and_473 net19 net8 net10 net498 and3_schematic
xi_and_472 net19 net8 net9 net497 and3_schematic
xi_and_471 net19 net2 net7 net496 and3_schematic
xi_and_470 net19 net2 net6 net495 and3_schematic
xi_and_469 net19 net2 net5 net494 and3_schematic
xi_and_468 net19 net2 net4 net493 and3_schematic
xi_and_467 net19 net2 net3 net492 and3_schematic
xi_and_466 net19 net2 net11 net491 and3_schematic
xi_and_465 net19 net2 net10 net490 and3_schematic
xi_and_464 net19 net2 net9 net489 and3_schematic
xi_and_463 net19 net17 net7 net488 and3_schematic
xi_and_462 net19 net17 net6 net487 and3_schematic
xi_and_461 net19 net17 net5 net486 and3_schematic
xi_and_460 net19 net17 net4 net485 and3_schematic
xi_and_459 net19 net17 net3 net484 and3_schematic
xi_and_458 net19 net17 net11 net483 and3_schematic
xi_and_457 net19 net17 net10 net482 and3_schematic
xi_and_456 net19 net17 net9 net481 and3_schematic
xi_and_455 net19 net18 net7 net480 and3_schematic
xi_and_454 net19 net18 net6 net479 and3_schematic
xi_and_453 net19 net18 net5 net478 and3_schematic
xi_and_452 net19 net18 net4 net477 and3_schematic
xi_and_451 net19 net18 net3 net476 and3_schematic
xi_and_450 net19 net18 net11 net475 and3_schematic
xi_and_449 net19 net18 net10 net474 and3_schematic
xi_and_448 net19 net18 net9 net473 and3_schematic
xi_and_447 net20 net15 net7 net472 and3_schematic
xi_and_446 net20 net15 net6 net471 and3_schematic
xi_and_445 net20 net15 net5 net470 and3_schematic
xi_and_444 net20 net15 net4 net469 and3_schematic
xi_and_443 net20 net15 net3 net468 and3_schematic
xi_and_442 net20 net15 net11 net467 and3_schematic
xi_and_441 net20 net15 net10 net466 and3_schematic
xi_and_440 net20 net15 net9 net465 and3_schematic
xi_and_439 net20 net14 net7 net464 and3_schematic
xi_and_438 net20 net14 net6 net463 and3_schematic
xi_and_437 net20 net14 net5 net462 and3_schematic
xi_and_436 net20 net14 net4 net461 and3_schematic
xi_and_435 net20 net14 net3 net460 and3_schematic
xi_and_434 net20 net14 net11 net459 and3_schematic
xi_and_433 net20 net14 net10 net458 and3_schematic
xi_and_432 net20 net14 net9 net457 and3_schematic
xi_and_431 net20 net13 net7 net456 and3_schematic
xi_and_430 net20 net13 net6 net455 and3_schematic
xi_and_429 net20 net13 net5 net454 and3_schematic
xi_and_428 net20 net13 net4 net453 and3_schematic
xi_and_427 net20 net13 net3 net452 and3_schematic
xi_and_426 net20 net13 net11 net451 and3_schematic
xi_and_425 net20 net13 net10 net450 and3_schematic
xi_and_424 net20 net13 net9 net449 and3_schematic
xi_and_423 net20 net16 net7 net448 and3_schematic
xi_and_422 net20 net16 net6 net447 and3_schematic
xi_and_421 net20 net16 net5 net446 and3_schematic
xi_and_420 net20 net16 net4 net445 and3_schematic
xi_and_419 net20 net16 net3 net444 and3_schematic
xi_and_418 net20 net16 net11 net443 and3_schematic
xi_and_417 net20 net16 net10 net442 and3_schematic
xi_and_416 net20 net16 net9 net441 and3_schematic
xi_and_415 net20 net8 net7 net440 and3_schematic
xi_and_414 net20 net8 net6 net439 and3_schematic
xi_and_413 net20 net8 net5 net438 and3_schematic
xi_and_412 net20 net8 net4 net437 and3_schematic
xi_and_411 net20 net8 net3 net436 and3_schematic
xi_and_410 net20 net8 net11 net435 and3_schematic
xi_and_409 net20 net8 net10 net434 and3_schematic
xi_and_408 net20 net8 net9 net433 and3_schematic
xi_and_407 net20 net2 net7 net432 and3_schematic
xi_and_406 net20 net2 net6 net431 and3_schematic
xi_and_405 net20 net2 net5 net430 and3_schematic
xi_and_404 net20 net2 net4 net429 and3_schematic
xi_and_403 net20 net2 net3 net428 and3_schematic
xi_and_402 net20 net2 net11 net427 and3_schematic
xi_and_401 net20 net2 net10 net426 and3_schematic
xi_and_400 net20 net2 net9 net425 and3_schematic
xi_and_399 net20 net17 net7 net424 and3_schematic
xi_and_398 net20 net17 net6 net423 and3_schematic
xi_and_397 net20 net17 net5 net422 and3_schematic
xi_and_396 net20 net17 net4 net421 and3_schematic
xi_and_395 net20 net17 net3 net420 and3_schematic
xi_and_394 net20 net17 net11 net419 and3_schematic
xi_and_393 net20 net17 net10 net418 and3_schematic
xi_and_392 net20 net17 net9 net417 and3_schematic
xi_and_391 net20 net18 net7 net416 and3_schematic
xi_and_390 net20 net18 net6 net415 and3_schematic
xi_and_389 net20 net18 net5 net414 and3_schematic
xi_and_388 net20 net18 net4 net413 and3_schematic
xi_and_387 net20 net18 net3 net412 and3_schematic
xi_and_386 net20 net18 net11 net411 and3_schematic
xi_and_385 net20 net18 net10 net410 and3_schematic
xi_and_384 net20 net18 net9 net409 and3_schematic
xi_and_383 net21 net15 net7 net408 and3_schematic
xi_and_382 net21 net15 net6 net407 and3_schematic
xi_and_381 net21 net15 net5 net406 and3_schematic
xi_and_380 net21 net15 net4 net405 and3_schematic
xi_and_379 net21 net15 net3 net404 and3_schematic
xi_and_378 net21 net15 net11 net403 and3_schematic
xi_and_377 net21 net15 net10 net402 and3_schematic
xi_and_376 net21 net15 net9 net401 and3_schematic
xi_and_375 net21 net14 net7 net400 and3_schematic
xi_and_374 net21 net14 net6 net399 and3_schematic
xi_and_373 net21 net14 net5 net398 and3_schematic
xi_and_372 net21 net14 net4 net397 and3_schematic
xi_and_371 net21 net14 net3 net396 and3_schematic
xi_and_370 net21 net14 net11 net395 and3_schematic
xi_and_369 net21 net14 net10 net394 and3_schematic
xi_and_368 net21 net14 net9 net393 and3_schematic
xi_and_367 net21 net13 net7 net392 and3_schematic
xi_and_366 net21 net13 net6 net391 and3_schematic
xi_and_365 net21 net13 net5 net390 and3_schematic
xi_and_364 net21 net13 net4 net389 and3_schematic
xi_and_363 net21 net13 net3 net388 and3_schematic
xi_and_362 net21 net13 net11 net387 and3_schematic
xi_and_361 net21 net13 net10 net386 and3_schematic
xi_and_360 net21 net13 net9 net385 and3_schematic
xi_and_359 net21 net16 net7 net384 and3_schematic
xi_and_358 net21 net16 net6 net383 and3_schematic
xi_and_357 net21 net16 net5 net382 and3_schematic
xi_and_356 net21 net16 net4 net381 and3_schematic
xi_and_355 net21 net16 net3 net380 and3_schematic
xi_and_354 net21 net16 net11 net379 and3_schematic
xi_and_353 net21 net16 net10 net378 and3_schematic
xi_and_352 net21 net16 net9 net377 and3_schematic
xi_and_351 net21 net8 net7 net376 and3_schematic
xi_and_350 net21 net8 net6 net375 and3_schematic
xi_and_349 net21 net8 net5 net374 and3_schematic
xi_and_348 net21 net8 net4 net373 and3_schematic
xi_and_347 net21 net8 net3 net372 and3_schematic
xi_and_346 net21 net8 net11 net371 and3_schematic
xi_and_345 net21 net8 net10 net370 and3_schematic
xi_and_344 net21 net8 net9 net369 and3_schematic
xi_and_343 net21 net2 net7 net368 and3_schematic
xi_and_342 net21 net2 net6 net367 and3_schematic
xi_and_341 net21 net2 net5 net366 and3_schematic
xi_and_340 net21 net2 net4 net365 and3_schematic
xi_and_339 net21 net2 net3 net364 and3_schematic
xi_and_338 net21 net2 net11 net363 and3_schematic
xi_and_337 net21 net2 net10 net362 and3_schematic
xi_and_336 net21 net2 net9 net361 and3_schematic
xi_and_335 net21 net17 net7 net360 and3_schematic
xi_and_334 net21 net17 net6 net359 and3_schematic
xi_and_333 net21 net17 net5 net358 and3_schematic
xi_and_332 net21 net17 net4 net357 and3_schematic
xi_and_331 net21 net17 net3 net356 and3_schematic
xi_and_330 net21 net17 net11 net355 and3_schematic
xi_and_329 net21 net17 net10 net354 and3_schematic
xi_and_328 net21 net17 net9 net353 and3_schematic
xi_and_327 net21 net18 net7 net352 and3_schematic
xi_and_326 net21 net18 net6 net351 and3_schematic
xi_and_325 net21 net18 net5 net350 and3_schematic
xi_and_324 net21 net18 net4 net349 and3_schematic
xi_and_323 net21 net18 net3 net348 and3_schematic
xi_and_322 net21 net18 net11 net347 and3_schematic
xi_and_321 net21 net18 net10 net346 and3_schematic
xi_and_320 net21 net18 net9 net345 and3_schematic
xi_and_319 net22 net15 net7 net344 and3_schematic
xi_and_318 net22 net15 net6 net343 and3_schematic
xi_and_317 net22 net15 net5 net342 and3_schematic
xi_and_316 net22 net15 net4 net341 and3_schematic
xi_and_315 net22 net15 net3 net340 and3_schematic
xi_and_314 net22 net15 net11 net339 and3_schematic
xi_and_313 net22 net15 net10 net338 and3_schematic
xi_and_312 net22 net15 net9 net337 and3_schematic
xi_and_311 net22 net14 net7 net336 and3_schematic
xi_and_310 net22 net14 net6 net335 and3_schematic
xi_and_309 net22 net14 net5 net334 and3_schematic
xi_and_308 net22 net14 net4 net333 and3_schematic
xi_and_307 net22 net14 net3 net332 and3_schematic
xi_and_306 net22 net14 net11 net331 and3_schematic
xi_and_305 net22 net14 net10 net330 and3_schematic
xi_and_304 net22 net14 net9 net329 and3_schematic
xi_and_303 net22 net13 net7 net328 and3_schematic
xi_and_302 net22 net13 net6 net327 and3_schematic
xi_and_301 net22 net13 net5 net326 and3_schematic
xi_and_300 net22 net13 net4 net325 and3_schematic
xi_and_299 net22 net13 net3 net324 and3_schematic
xi_and_298 net22 net13 net11 net323 and3_schematic
xi_and_297 net22 net13 net10 net322 and3_schematic
xi_and_296 net22 net13 net9 net321 and3_schematic
xi_and_295 net22 net16 net7 net320 and3_schematic
xi_and_294 net22 net16 net6 net319 and3_schematic
xi_and_293 net22 net16 net5 net318 and3_schematic
xi_and_292 net22 net16 net4 net317 and3_schematic
xi_and_291 net22 net16 net3 net316 and3_schematic
xi_and_290 net22 net16 net11 net315 and3_schematic
xi_and_289 net22 net16 net10 net314 and3_schematic
xi_and_288 net22 net16 net9 net313 and3_schematic
xi_and_287 net22 net8 net7 net312 and3_schematic
xi_and_286 net22 net8 net6 net311 and3_schematic
xi_and_285 net22 net8 net5 net310 and3_schematic
xi_and_284 net22 net8 net4 net309 and3_schematic
xi_and_283 net22 net8 net3 net308 and3_schematic
xi_and_282 net22 net8 net11 net307 and3_schematic
xi_and_281 net22 net8 net10 net306 and3_schematic
xi_and_280 net22 net8 net9 net305 and3_schematic
xi_and_279 net22 net2 net7 net304 and3_schematic
xi_and_278 net22 net2 net6 net303 and3_schematic
xi_and_277 net22 net2 net5 net302 and3_schematic
xi_and_276 net22 net2 net4 net301 and3_schematic
xi_and_275 net22 net2 net3 net300 and3_schematic
xi_and_274 net22 net2 net11 net299 and3_schematic
xi_and_273 net22 net2 net10 net298 and3_schematic
xi_and_272 net22 net2 net9 net297 and3_schematic
xi_and_271 net22 net17 net7 net296 and3_schematic
xi_and_270 net22 net17 net6 net295 and3_schematic
xi_and_269 net22 net17 net5 net294 and3_schematic
xi_and_268 net22 net17 net4 net293 and3_schematic
xi_and_267 net22 net17 net3 net292 and3_schematic
xi_and_266 net22 net17 net11 net291 and3_schematic
xi_and_265 net22 net17 net10 net290 and3_schematic
xi_and_264 net22 net17 net9 net289 and3_schematic
xi_and_263 net22 net18 net7 net288 and3_schematic
xi_and_262 net22 net18 net6 net287 and3_schematic
xi_and_261 net22 net18 net5 net286 and3_schematic
xi_and_260 net22 net18 net4 net285 and3_schematic
xi_and_259 net22 net18 net3 net284 and3_schematic
xi_and_258 net22 net18 net11 net283 and3_schematic
xi_and_257 net22 net18 net10 net282 and3_schematic
xi_and_256 net22 net18 net9 net281 and3_schematic
xi_and_255 net23 net15 net7 net280 and3_schematic
xi_and_254 net23 net15 net6 net279 and3_schematic
xi_and_253 net23 net15 net5 net278 and3_schematic
xi_and_252 net23 net15 net4 net277 and3_schematic
xi_and_251 net23 net15 net3 net276 and3_schematic
xi_and_250 net23 net15 net11 net275 and3_schematic
xi_and_249 net23 net15 net10 net274 and3_schematic
xi_and_248 net23 net15 net9 net273 and3_schematic
xi_and_247 net23 net14 net7 net272 and3_schematic
xi_and_246 net23 net14 net6 net271 and3_schematic
xi_and_245 net23 net14 net5 net270 and3_schematic
xi_and_244 net23 net14 net4 net269 and3_schematic
xi_and_243 net23 net14 net3 net268 and3_schematic
xi_and_242 net23 net14 net11 net267 and3_schematic
xi_and_241 net23 net14 net10 net266 and3_schematic
xi_and_240 net23 net14 net9 net265 and3_schematic
xi_and_239 net23 net13 net7 net264 and3_schematic
xi_and_238 net23 net13 net6 net263 and3_schematic
xi_and_237 net23 net13 net5 net262 and3_schematic
xi_and_236 net23 net13 net4 net261 and3_schematic
xi_and_235 net23 net13 net3 net260 and3_schematic
xi_and_234 net23 net13 net11 net259 and3_schematic
xi_and_233 net23 net13 net10 net258 and3_schematic
xi_and_232 net23 net13 net9 net257 and3_schematic
xi_and_231 net23 net16 net7 net256 and3_schematic
xi_and_230 net23 net16 net6 net255 and3_schematic
xi_and_229 net23 net16 net5 net254 and3_schematic
xi_and_228 net23 net16 net4 net253 and3_schematic
xi_and_227 net23 net16 net3 net252 and3_schematic
xi_and_226 net23 net16 net11 net251 and3_schematic
xi_and_225 net23 net16 net10 net250 and3_schematic
xi_and_224 net23 net16 net9 net249 and3_schematic
xi_and_223 net23 net8 net7 net248 and3_schematic
xi_and_222 net23 net8 net6 net247 and3_schematic
xi_and_221 net23 net8 net5 net246 and3_schematic
xi_and_220 net23 net8 net4 net245 and3_schematic
xi_and_219 net23 net8 net3 net244 and3_schematic
xi_and_218 net23 net8 net11 net243 and3_schematic
xi_and_217 net23 net8 net10 net242 and3_schematic
xi_and_216 net23 net8 net9 net241 and3_schematic
xi_and_215 net23 net2 net7 net240 and3_schematic
xi_and_214 net23 net2 net6 net239 and3_schematic
xi_and_213 net23 net2 net5 net238 and3_schematic
xi_and_212 net23 net2 net4 net237 and3_schematic
xi_and_211 net23 net2 net3 net236 and3_schematic
xi_and_210 net23 net2 net11 net235 and3_schematic
xi_and_209 net23 net2 net10 net234 and3_schematic
xi_and_208 net23 net2 net9 net233 and3_schematic
xi_and_207 net23 net17 net7 net232 and3_schematic
xi_and_206 net23 net17 net6 net231 and3_schematic
xi_and_205 net23 net17 net5 net230 and3_schematic
xi_and_204 net23 net17 net4 net229 and3_schematic
xi_and_203 net23 net17 net3 net228 and3_schematic
xi_and_202 net23 net17 net11 net227 and3_schematic
xi_and_201 net23 net17 net10 net226 and3_schematic
xi_and_200 net23 net17 net9 net225 and3_schematic
xi_and_199 net23 net18 net7 net224 and3_schematic
xi_and_198 net23 net18 net6 net223 and3_schematic
xi_and_197 net23 net18 net5 net222 and3_schematic
xi_and_196 net23 net18 net4 net221 and3_schematic
xi_and_195 net23 net18 net3 net220 and3_schematic
xi_and_194 net23 net18 net11 net219 and3_schematic
xi_and_193 net23 net18 net10 net218 and3_schematic
xi_and_192 net23 net18 net9 net217 and3_schematic
xi_and_191 net1 net15 net7 net216 and3_schematic
xi_and_190 net1 net15 net6 net215 and3_schematic
xi_and_189 net1 net15 net5 net214 and3_schematic
xi_and_188 net1 net15 net4 net213 and3_schematic
xi_and_187 net1 net15 net3 net212 and3_schematic
xi_and_186 net1 net15 net11 net211 and3_schematic
xi_and_185 net1 net15 net10 net210 and3_schematic
xi_and_184 net1 net15 net9 net209 and3_schematic
xi_and_183 net1 net14 net7 net208 and3_schematic
xi_and_182 net1 net14 net6 net207 and3_schematic
xi_and_181 net1 net14 net5 net206 and3_schematic
xi_and_180 net1 net14 net4 net205 and3_schematic
xi_and_179 net1 net14 net3 net204 and3_schematic
xi_and_178 net1 net14 net11 net203 and3_schematic
xi_and_177 net1 net14 net10 net202 and3_schematic
xi_and_176 net1 net14 net9 net201 and3_schematic
xi_and_175 net1 net13 net7 net200 and3_schematic
xi_and_174 net1 net13 net6 net199 and3_schematic
xi_and_173 net1 net13 net5 net198 and3_schematic
xi_and_172 net1 net13 net4 net197 and3_schematic
xi_and_171 net1 net13 net3 net196 and3_schematic
xi_and_170 net1 net13 net11 net195 and3_schematic
xi_and_169 net1 net13 net10 net194 and3_schematic
xi_and_168 net1 net13 net9 net193 and3_schematic
xi_and_167 net1 net16 net7 net192 and3_schematic
xi_and_166 net1 net16 net6 net191 and3_schematic
xi_and_165 net1 net16 net5 net190 and3_schematic
xi_and_164 net1 net16 net4 net189 and3_schematic
xi_and_163 net1 net16 net3 net188 and3_schematic
xi_and_162 net1 net16 net11 net187 and3_schematic
xi_and_161 net1 net16 net10 net186 and3_schematic
xi_and_160 net1 net16 net9 net185 and3_schematic
xi_and_159 net1 net8 net7 net184 and3_schematic
xi_and_158 net1 net8 net6 net183 and3_schematic
xi_and_157 net1 net8 net5 net182 and3_schematic
xi_and_156 net1 net8 net4 net181 and3_schematic
xi_and_155 net1 net8 net3 net180 and3_schematic
xi_and_154 net1 net8 net11 net179 and3_schematic
xi_and_153 net1 net8 net10 net178 and3_schematic
xi_and_152 net1 net8 net9 net177 and3_schematic
xi_and_151 net1 net2 net7 net176 and3_schematic
xi_and_150 net1 net2 net6 net175 and3_schematic
xi_and_149 net1 net2 net5 net174 and3_schematic
xi_and_148 net1 net2 net4 net173 and3_schematic
xi_and_147 net1 net2 net3 net172 and3_schematic
xi_and_146 net1 net2 net11 net171 and3_schematic
xi_and_145 net1 net2 net10 net170 and3_schematic
xi_and_144 net1 net2 net9 net169 and3_schematic
xi_and_143 net1 net17 net7 net168 and3_schematic
xi_and_142 net1 net17 net6 net167 and3_schematic
xi_and_141 net1 net17 net5 net166 and3_schematic
xi_and_140 net1 net17 net4 net165 and3_schematic
xi_and_139 net1 net17 net3 net164 and3_schematic
xi_and_138 net1 net17 net11 net163 and3_schematic
xi_and_137 net1 net17 net10 net162 and3_schematic
xi_and_136 net1 net17 net9 net161 and3_schematic
xi_and_135 net1 net18 net7 net160 and3_schematic
xi_and_134 net1 net18 net6 net159 and3_schematic
xi_and_133 net1 net18 net5 net158 and3_schematic
xi_and_132 net1 net18 net4 net157 and3_schematic
xi_and_131 net1 net18 net3 net156 and3_schematic
xi_and_130 net1 net18 net11 net155 and3_schematic
xi_and_129 net1 net18 net10 net154 and3_schematic
xi_and_128 net1 net18 net9 net153 and3_schematic
xi_and_127 net12 net15 net7 net152 and3_schematic
xi_and_126 net12 net15 net6 net151 and3_schematic
xi_and_125 net12 net15 net5 net150 and3_schematic
xi_and_124 net12 net15 net4 net149 and3_schematic
xi_and_123 net12 net15 net3 net148 and3_schematic
xi_and_122 net12 net15 net11 net147 and3_schematic
xi_and_121 net12 net15 net10 net146 and3_schematic
xi_and_120 net12 net15 net9 net145 and3_schematic
xi_and_119 net12 net14 net7 net144 and3_schematic
xi_and_118 net12 net14 net6 net143 and3_schematic
xi_and_117 net12 net14 net5 net142 and3_schematic
xi_and_116 net12 net14 net4 net141 and3_schematic
xi_and_115 net12 net14 net3 net140 and3_schematic
xi_and_114 net12 net14 net11 net139 and3_schematic
xi_and_113 net12 net14 net10 net138 and3_schematic
xi_and_112 net12 net14 net9 net137 and3_schematic
xi_and_111 net12 net13 net7 net136 and3_schematic
xi_and_110 net12 net13 net6 net135 and3_schematic
xi_and_109 net12 net13 net5 net134 and3_schematic
xi_and_108 net12 net13 net4 net133 and3_schematic
xi_and_107 net12 net13 net3 net132 and3_schematic
xi_and_106 net12 net13 net11 net131 and3_schematic
xi_and_105 net12 net13 net10 net130 and3_schematic
xi_and_104 net12 net13 net9 net129 and3_schematic
xi_and_103 net12 net16 net7 net128 and3_schematic
xi_and_102 net12 net16 net6 net127 and3_schematic
xi_and_101 net12 net16 net5 net126 and3_schematic
xi_and_100 net12 net16 net4 net125 and3_schematic
xi_and_99 net12 net16 net3 net124 and3_schematic
xi_and_98 net12 net16 net11 net123 and3_schematic
xi_and_97 net12 net16 net10 net122 and3_schematic
xi_and_96 net12 net16 net9 net121 and3_schematic
xi_and_95 net12 net8 net7 net120 and3_schematic
xi_and_94 net12 net8 net6 net119 and3_schematic
xi_and_93 net12 net8 net5 net118 and3_schematic
xi_and_92 net12 net8 net4 net117 and3_schematic
xi_and_91 net12 net8 net3 net116 and3_schematic
xi_and_90 net12 net8 net11 net115 and3_schematic
xi_and_89 net12 net8 net10 net114 and3_schematic
xi_and_88 net12 net8 net9 net113 and3_schematic
xi_and_87 net12 net2 net7 net112 and3_schematic
xi_and_86 net12 net2 net6 net111 and3_schematic
xi_and_85 net12 net2 net5 net110 and3_schematic
xi_and_84 net12 net2 net4 net109 and3_schematic
xi_and_83 net12 net2 net3 net108 and3_schematic
xi_and_82 net12 net2 net11 net107 and3_schematic
xi_and_81 net12 net2 net10 net106 and3_schematic
xi_and_80 net12 net2 net9 net105 and3_schematic
xi_and_79 net12 net17 net7 net104 and3_schematic
xi_and_78 net12 net17 net6 net103 and3_schematic
xi_and_77 net12 net17 net5 net102 and3_schematic
xi_and_76 net12 net17 net4 net101 and3_schematic
xi_and_75 net12 net17 net3 net100 and3_schematic
xi_and_74 net12 net17 net11 net99 and3_schematic
xi_and_73 net12 net17 net10 net98 and3_schematic
xi_and_72 net12 net17 net9 net97 and3_schematic
xi_and_71 net12 net18 net7 net96 and3_schematic
xi_and_70 net12 net18 net6 net95 and3_schematic
xi_and_69 net12 net18 net5 net94 and3_schematic
xi_and_68 net12 net18 net4 net93 and3_schematic
xi_and_67 net12 net18 net3 net92 and3_schematic
xi_and_66 net12 net18 net11 net91 and3_schematic
xi_and_65 net12 net18 net10 net90 and3_schematic
xi_and_64 net12 net18 net9 net89 and3_schematic
xi_and_63 net24 net15 net7 net88 and3_schematic
xi_and_62 net24 net15 net6 net87 and3_schematic
xi_and_61 net24 net15 net5 net86 and3_schematic
xi_and_60 net24 net15 net4 net85 and3_schematic
xi_and_59 net24 net15 net3 net84 and3_schematic
xi_and_58 net24 net15 net11 net83 and3_schematic
xi_and_57 net24 net15 net10 net82 and3_schematic
xi_and_56 net24 net15 net9 net81 and3_schematic
xi_and_55 net24 net14 net7 net80 and3_schematic
xi_and_54 net24 net14 net6 net79 and3_schematic
xi_and_53 net24 net14 net5 net78 and3_schematic
xi_and_52 net24 net14 net4 net77 and3_schematic
xi_and_51 net24 net14 net3 net76 and3_schematic
xi_and_50 net24 net14 net11 net75 and3_schematic
xi_and_49 net24 net14 net10 net74 and3_schematic
xi_and_48 net24 net14 net9 net73 and3_schematic
xi_and_47 net24 net13 net7 net72 and3_schematic
xi_and_46 net24 net13 net6 net71 and3_schematic
xi_and_45 net24 net13 net5 net70 and3_schematic
xi_and_44 net24 net13 net4 net69 and3_schematic
xi_and_43 net24 net13 net3 net68 and3_schematic
xi_and_42 net24 net13 net11 net67 and3_schematic
xi_and_41 net24 net13 net10 net66 and3_schematic
xi_and_40 net24 net13 net9 net65 and3_schematic
xi_and_39 net24 net16 net7 net64 and3_schematic
xi_and_38 net24 net16 net6 net63 and3_schematic
xi_and_37 net24 net16 net5 net62 and3_schematic
xi_and_36 net24 net16 net4 net61 and3_schematic
xi_and_35 net24 net16 net3 net60 and3_schematic
xi_and_34 net24 net16 net11 net59 and3_schematic
xi_and_33 net24 net16 net10 net58 and3_schematic
xi_and_32 net24 net16 net9 net57 and3_schematic
xi_and_31 net24 net8 net7 net56 and3_schematic
xi_and_30 net24 net8 net6 net55 and3_schematic
xi_and_29 net24 net8 net5 net54 and3_schematic
xi_and_28 net24 net8 net4 net53 and3_schematic
xi_and_27 net24 net8 net3 net52 and3_schematic
xi_and_26 net24 net8 net11 net51 and3_schematic
xi_and_25 net24 net8 net10 net50 and3_schematic
xi_and_24 net24 net8 net9 net49 and3_schematic
xi_and_23 net24 net2 net7 net48 and3_schematic
xi_and_22 net24 net2 net6 net47 and3_schematic
xi_and_21 net24 net2 net5 net46 and3_schematic
xi_and_20 net24 net2 net4 net45 and3_schematic
xi_and_19 net24 net2 net3 net44 and3_schematic
xi_and_18 net24 net2 net11 net43 and3_schematic
xi_and_17 net24 net2 net10 net42 and3_schematic
xi_and_16 net24 net2 net9 net41 and3_schematic
xi_and_15 net24 net17 net7 net40 and3_schematic
xi_and_14 net24 net17 net6 net39 and3_schematic
xi_and_13 net24 net17 net5 net38 and3_schematic
xi_and_12 net24 net17 net4 net37 and3_schematic
xi_and_11 net24 net17 net3 net36 and3_schematic
xi_and_10 net24 net17 net11 net35 and3_schematic
xi_and_9 net24 net17 net10 net34 and3_schematic
xi_and_8 net24 net17 net9 net33 and3_schematic
xi_and_7 net24 net18 net7 net32 and3_schematic
xi_and_6 net24 net18 net6 net31 and3_schematic
xi_and_5 net24 net18 net5 net30 and3_schematic
xi_and_4 net24 net18 net4 net29 and3_schematic
xi_and_3 net24 net18 net3 net28 and3_schematic
xi_and_2 net24 net18 net11 net27 and3_schematic
xi_and_1 net24 net18 net10 net26 and3_schematic
xi_and_0 net24 net18 net9 net25 and3_schematic
xi2114 net505 net1153 inv4
xi2047 net536 net1152 inv4
xi2045 net536 net1151 inv4
xi2044 net535 net1150 inv4
xi2042 net535 net1149 inv4
xi2040 net534 net1148 inv4
xi2038 net534 net1147 inv4
xi2035 net533 net1146 inv4
xi2033 net533 net1145 inv4
xi2032 net532 net1144 inv4
xi2030 net532 net1143 inv4
xi2027 net531 net1142 inv4
xi2025 net531 net1141 inv4
xi2023 net530 net1204 inv4
xi2021 net530 net1203 inv4
xi2020 net529 net1202 inv4
xi2018 net529 net1201 inv4
xi2016 net528 net1200 inv4
xi2014 net528 net1199 inv4
xi2011 net527 net1198 inv4
xi2009 net527 net1197 inv4
xi2007 net526 net1196 inv4
xi2005 net526 net1195 inv4
xi2004 net525 net1194 inv4
xi2002 net525 net1193 inv4
xi1999 net524 net1192 inv4
xi1997 net524 net1191 inv4
xi1996 net523 net1190 inv4
xi1994 net523 net1189 inv4
xi1992 net522 net1188 inv4
xi1990 net522 net1187 inv4
xi1987 net521 net1186 inv4
xi1985 net521 net1185 inv4
xi1984 net520 net1184 inv4
xi1982 net520 net1183 inv4
xi1979 net519 net1182 inv4
xi1977 net519 net1181 inv4
xi1975 net518 net1180 inv4
xi1973 net518 net1179 inv4
xi1972 net517 net1178 inv4
xi1970 net517 net1177 inv4
xi1967 net516 net1176 inv4
xi1965 net516 net1175 inv4
xi1964 net515 net1174 inv4
xi1962 net515 net1173 inv4
xi1960 net514 net1172 inv4
xi1958 net514 net1171 inv4
xi1955 net513 net1170 inv4
xi1953 net513 net1169 inv4
xi1951 net512 net1168 inv4
xi1949 net512 net1167 inv4
xi1948 net511 net1166 inv4
xi1946 net511 net1165 inv4
xi1944 net510 net1164 inv4
xi1942 net510 net1163 inv4
xi1939 net509 net1162 inv4
xi1937 net509 net1161 inv4
xi1936 net508 net1160 inv4
xi1934 net508 net1159 inv4
xi1931 net507 net1158 inv4
xi1929 net507 net1157 inv4
xi1927 net506 net1156 inv4
xi1925 net506 net1155 inv4
xi1924 net505 net1154 inv4
xi1921 net457 net1255 inv4
xi1920 net458 net1254 inv4
xi1918 net458 net1253 inv4
xi1916 net459 net1252 inv4
xi1914 net459 net1251 inv4
xi1911 net460 net1250 inv4
xi1909 net460 net1249 inv4
xi1908 net461 net1248 inv4
xi1906 net461 net1247 inv4
xi1903 net462 net1246 inv4
xi1901 net462 net1245 inv4
xi1899 net463 net1244 inv4
xi1897 net463 net1243 inv4
xi1896 net464 net1242 inv4
xi1894 net464 net1241 inv4
xi1892 net465 net1240 inv4
xi1890 net465 net1239 inv4
xi1887 net466 net1238 inv4
xi1885 net466 net1237 inv4
xi1883 net467 net1236 inv4
xi1881 net467 net1235 inv4
xi1880 net468 net1234 inv4
xi1878 net468 net1233 inv4
xi1875 net469 net1232 inv4
xi1873 net469 net1231 inv4
xi1872 net470 net1230 inv4
xi1870 net470 net1229 inv4
xi1868 net471 net1228 inv4
xi1866 net471 net1227 inv4
xi1863 net472 net1226 inv4
xi1861 net472 net1225 inv4
xi1860 net473 net1224 inv4
xi1858 net473 net1223 inv4
xi1855 net474 net1222 inv4
xi1853 net474 net1221 inv4
xi1851 net475 net1220 inv4
xi1849 net475 net1219 inv4
xi1848 net476 net1218 inv4
xi1846 net476 net1217 inv4
xi1843 net477 net1216 inv4
xi1841 net477 net1215 inv4
xi1840 net478 net1214 inv4
xi1838 net478 net1213 inv4
xi1836 net479 net1212 inv4
xi1834 net479 net1211 inv4
xi1831 net480 net1210 inv4
xi1829 net480 net1209 inv4
xi1827 net481 net1208 inv4
xi1825 net481 net1207 inv4
xi1824 net482 net1206 inv4
xi1822 net482 net1205 inv4
xi1820 net483 net1306 inv4
xi1818 net483 net1305 inv4
xi1815 net484 net1304 inv4
xi1813 net484 net1303 inv4
xi1812 net485 net1302 inv4
xi1810 net485 net1301 inv4
xi1807 net486 net1300 inv4
xi1805 net486 net1299 inv4
xi1803 net487 net1298 inv4
xi1801 net487 net1297 inv4
xi1800 net488 net1296 inv4
xi1798 net488 net1295 inv4
xi1795 net489 net1294 inv4
xi1794 net489 net1293 inv4
xi1792 net490 net1292 inv4
xi1790 net490 net1291 inv4
xi1788 net491 net1290 inv4
xi1786 net491 net1289 inv4
xi1783 net492 net1288 inv4
xi1781 net492 net1287 inv4
xi1780 net493 net1286 inv4
xi1778 net493 net1285 inv4
xi1775 net494 net1284 inv4
xi1773 net494 net1283 inv4
xi1771 net495 net1282 inv4
xi1769 net495 net1281 inv4
xi1768 net496 net1280 inv4
xi1766 net496 net1279 inv4
xi1764 net497 net1278 inv4
xi1762 net497 net1277 inv4
xi1759 net498 net1276 inv4
xi1757 net498 net1275 inv4
xi1755 net499 net1274 inv4
xi1753 net499 net1273 inv4
xi1752 net500 net1272 inv4
xi1750 net500 net1271 inv4
xi1747 net501 net1270 inv4
xi1745 net501 net1269 inv4
xi1744 net502 net1268 inv4
xi1742 net502 net1267 inv4
xi1740 net503 net1266 inv4
xi1738 net503 net1265 inv4
xi1735 net504 net1264 inv4
xi1733 net504 net1263 inv4
xi1731 net457 net1262 inv4
xi1730 net409 net1261 inv4
xi1728 net456 net1260 inv4
xi1726 net456 net1259 inv4
xi1723 net455 net1258 inv4
xi1721 net455 net1257 inv4
xi1719 net454 net1256 inv4
xi1717 net454 net1357 inv4
xi1716 net453 net1356 inv4
xi1714 net453 net1355 inv4
xi1711 net452 net1354 inv4
xi1709 net452 net1353 inv4
xi1708 net451 net1352 inv4
xi1706 net451 net1351 inv4
xi1704 net450 net1350 inv4
xi1702 net450 net1349 inv4
xi1699 net449 net1348 inv4
xi1697 net449 net1347 inv4
xi1695 net448 net1346 inv4
xi1693 net448 net1345 inv4
xi1692 net447 net1344 inv4
xi1690 net447 net1343 inv4
xi1688 net446 net1342 inv4
xi1686 net446 net1341 inv4
xi1683 net445 net1340 inv4
xi1681 net445 net1339 inv4
xi1680 net444 net1338 inv4
xi1678 net444 net1337 inv4
xi1675 net443 net1336 inv4
xi1673 net443 net1335 inv4
xi1671 net442 net1334 inv4
xi1669 net442 net1333 inv4
xi1667 net441 net1332 inv4
xi1666 net441 net1331 inv4
xi1663 net440 net1330 inv4
xi1661 net440 net1329 inv4
xi1660 net439 net1328 inv4
xi1658 net439 net1327 inv4
xi1656 net438 net1326 inv4
xi1654 net438 net1325 inv4
xi1651 net437 net1324 inv4
xi1649 net437 net1323 inv4
xi1648 net436 net1322 inv4
xi1646 net436 net1321 inv4
xi1643 net435 net1320 inv4
xi1641 net435 net1319 inv4
xi1639 net434 net1318 inv4
xi1637 net434 net1317 inv4
xi1636 net433 net1316 inv4
xi1634 net433 net1315 inv4
xi1632 net432 net1314 inv4
xi1630 net432 net1313 inv4
xi1627 net431 net1312 inv4
xi1625 net431 net1311 inv4
xi1623 net430 net1310 inv4
xi1621 net430 net1309 inv4
xi1620 net429 net1308 inv4
xi1618 net429 net1307 inv4
xi1615 net428 net1408 inv4
xi1613 net428 net1407 inv4
xi1612 net427 net1406 inv4
xi1610 net427 net1405 inv4
xi1608 net426 net1404 inv4
xi1606 net426 net1403 inv4
xi1603 net425 net1402 inv4
xi1601 net425 net1401 inv4
xi1600 net424 net1400 inv4
xi1598 net424 net1399 inv4
xi1595 net423 net1398 inv4
xi1593 net423 net1397 inv4
xi1591 net422 net1396 inv4
xi1589 net422 net1395 inv4
xi1588 net421 net1394 inv4
xi1586 net421 net1393 inv4
xi1583 net420 net1392 inv4
xi1581 net420 net1391 inv4
xi1580 net419 net1390 inv4
xi1578 net419 net1389 inv4
xi1576 net418 net1388 inv4
xi1574 net418 net1387 inv4
xi1571 net417 net1386 inv4
xi1569 net417 net1385 inv4
xi1567 net416 net1384 inv4
xi1565 net416 net1383 inv4
xi1564 net415 net1382 inv4
xi1562 net415 net1381 inv4
xi1560 net414 net1380 inv4
xi1558 net414 net1379 inv4
xi1555 net413 net1378 inv4
xi1553 net413 net1377 inv4
xi1552 net412 net1376 inv4
xi1550 net412 net1375 inv4
xi1547 net411 net1374 inv4
xi1545 net411 net1373 inv4
xi1543 net410 net1372 inv4
xi1541 net410 net1371 inv4
xi1540 net409 net1370 inv4
xi1537 net361 net1369 inv4
xi1536 net362 net1368 inv4
xi1534 net362 net1367 inv4
xi1532 net363 net1366 inv4
xi1530 net363 net1365 inv4
xi1527 net364 net1364 inv4
xi1525 net364 net1363 inv4
xi1524 net365 net1362 inv4
xi1522 net365 net1361 inv4
xi1519 net366 net1360 inv4
xi1517 net366 net1359 inv4
xi1515 net367 net1358 inv4
xi1513 net367 net1459 inv4
xi1512 net368 net1458 inv4
xi1510 net368 net1457 inv4
xi1508 net369 net1456 inv4
xi1506 net369 net1455 inv4
xi1503 net370 net1454 inv4
xi1501 net370 net1453 inv4
xi1499 net371 net1452 inv4
xi1497 net371 net1451 inv4
xi1496 net372 net1450 inv4
xi1494 net372 net1449 inv4
xi1491 net373 net1448 inv4
xi1489 net373 net1447 inv4
xi1488 net374 net1446 inv4
xi1486 net374 net1445 inv4
xi1484 net375 net1444 inv4
xi1482 net375 net1443 inv4
xi1479 net376 net1442 inv4
xi1477 net376 net1441 inv4
xi1476 net377 net1440 inv4
xi1474 net377 net1439 inv4
xi1471 net378 net1438 inv4
xi1469 net378 net1437 inv4
xi1467 net379 net1436 inv4
xi1465 net379 net1435 inv4
xi1464 net380 net1434 inv4
xi1462 net380 net1433 inv4
xi1459 net381 net1432 inv4
xi1457 net381 net1431 inv4
xi1456 net382 net1430 inv4
xi1454 net382 net1429 inv4
xi1452 net383 net1428 inv4
xi1450 net383 net1427 inv4
xi1447 net384 net1426 inv4
xi1445 net384 net1425 inv4
xi1443 net385 net1424 inv4
xi1441 net385 net1423 inv4
xi1440 net386 net1422 inv4
xi1438 net386 net1421 inv4
xi1436 net387 net1420 inv4
xi1434 net387 net1419 inv4
xi1431 net388 net1418 inv4
xi1429 net388 net1417 inv4
xi1428 net389 net1416 inv4
xi1426 net389 net1415 inv4
xi1423 net390 net1414 inv4
xi1421 net390 net1413 inv4
xi1419 net391 net1412 inv4
xi1417 net391 net1411 inv4
xi1416 net392 net1410 inv4
xi1414 net392 net1409 inv4
xi1411 net393 net1510 inv4
xi1410 net393 net1509 inv4
xi1408 net394 net1508 inv4
xi1406 net394 net1507 inv4
xi1404 net395 net1506 inv4
xi1402 net395 net1505 inv4
xi1399 net396 net1504 inv4
xi1397 net396 net1503 inv4
xi1396 net397 net1502 inv4
xi1394 net397 net1501 inv4
xi1391 net398 net1500 inv4
xi1389 net398 net1499 inv4
xi1387 net399 net1498 inv4
xi1385 net399 net1497 inv4
xi1384 net400 net1496 inv4
xi1382 net400 net1495 inv4
xi1380 net401 net1494 inv4
xi1378 net401 net1493 inv4
xi1375 net402 net1492 inv4
xi1373 net402 net1491 inv4
xi1371 net403 net1490 inv4
xi1369 net403 net1489 inv4
xi1368 net404 net1488 inv4
xi1366 net404 net1487 inv4
xi1363 net405 net1486 inv4
xi1361 net405 net1485 inv4
xi1360 net406 net1484 inv4
xi1358 net406 net1483 inv4
xi1356 net407 net1482 inv4
xi1354 net407 net1481 inv4
xi1351 net408 net1480 inv4
xi1349 net408 net1479 inv4
xi1347 net361 net1478 inv4
xi1346 net313 net1477 inv4
xi1344 net360 net1476 inv4
xi1342 net360 net1475 inv4
xi1339 net359 net1474 inv4
xi1337 net359 net1473 inv4
xi1335 net358 net1472 inv4
xi1333 net358 net1471 inv4
xi1332 net357 net1470 inv4
xi1330 net357 net1469 inv4
xi1327 net356 net1468 inv4
xi1325 net356 net1467 inv4
xi1324 net355 net1466 inv4
xi1322 net355 net1465 inv4
xi1320 net354 net1464 inv4
xi1318 net354 net1463 inv4
xi1315 net353 net1462 inv4
xi1313 net353 net1461 inv4
xi1311 net352 net1460 inv4
xi1309 net352 net1560 inv4
xi1308 net351 net1559 inv4
xi1306 net351 net1558 inv4
xi1304 net350 net1557 inv4
xi1302 net350 net1556 inv4
xi1299 net349 net1555 inv4
xi1297 net349 net1554 inv4
xi1296 net348 net1553 inv4
xi1294 net348 net1552 inv4
xi1291 net347 net1551 inv4
xi1289 net347 net1550 inv4
xi1287 net346 net1549 inv4
xi1285 net346 net1548 inv4
xi1283 net345 net1547 inv4
xi1282 net345 net1546 inv4
xi1279 net344 net1545 inv4
xi1277 net344 net1544 inv4
xi1276 net343 net1543 inv4
xi1274 net343 net1542 inv4
xi1272 net342 net1541 inv4
xi1270 net342 net1540 inv4
xi1267 net341 net1539 inv4
xi1265 net341 net1538 inv4
xi1264 net340 net1537 inv4
xi1262 net340 net1536 inv4
xi1259 net339 net1535 inv4
xi1257 net339 net1534 inv4
xi1255 net338 net1533 inv4
xi1253 net338 net1532 inv4
xi1252 net337 net1531 inv4
xi1250 net337 net1530 inv4
xi1248 net336 net1529 inv4
xi1246 net336 net1528 inv4
xi1243 net335 net1527 inv4
xi1241 net335 net1526 inv4
xi1239 net334 net1525 inv4
xi1237 net334 net1524 inv4
xi1236 net333 net1523 inv4
xi1234 net333 net1522 inv4
xi1231 net332 net1521 inv4
xi1229 net332 net1520 inv4
xi1228 net331 net1519 inv4
xi1226 net331 net1518 inv4
xi1224 net330 net1517 inv4
xi1222 net330 net1516 inv4
xi1219 net329 net1515 inv4
xi1217 net329 net1514 inv4
xi1216 net328 net1513 inv4
xi1214 net328 net1512 inv4
xi1211 net327 net1511 inv4
xi1209 net327 net843 inv4
xi1207 net326 net842 inv4
xi1205 net326 net841 inv4
xi1204 net325 net840 inv4
xi1202 net325 net839 inv4
xi1199 net324 net838 inv4
xi1197 net324 net837 inv4
xi1196 net323 net836 inv4
xi1194 net323 net835 inv4
xi1192 net322 net834 inv4
xi1190 net322 net833 inv4
xi1187 net321 net832 inv4
xi1185 net321 net831 inv4
xi1183 net320 net830 inv4
xi1181 net320 net829 inv4
xi1180 net319 net828 inv4
xi1178 net319 net827 inv4
xi1176 net318 net826 inv4
xi1174 net318 net825 inv4
xi1171 net317 net824 inv4
xi1169 net317 net823 inv4
xi1168 net316 net822 inv4
xi1166 net316 net821 inv4
xi1163 net315 net820 inv4
xi1161 net315 net819 inv4
xi1159 net314 net818 inv4
xi1157 net314 net817 inv4
xi1156 net313 net816 inv4
xi1153 net265 net815 inv4
xi1152 net266 net814 inv4
xi1150 net266 net813 inv4
xi1148 net267 net812 inv4
xi1146 net267 net811 inv4
xi1143 net268 net810 inv4
xi1141 net268 net809 inv4
xi1140 net269 net808 inv4
xi1138 net269 net807 inv4
xi1135 net270 net806 inv4
xi1133 net270 net805 inv4
xi1131 net271 net804 inv4
xi1129 net271 net803 inv4
xi1128 net272 net802 inv4
xi1126 net272 net801 inv4
xi1124 net273 net800 inv4
xi1122 net273 net799 inv4
xi1119 net274 net798 inv4
xi1117 net274 net797 inv4
xi1115 net275 net796 inv4
xi1113 net275 net795 inv4
xi1112 net276 net794 inv4
xi1110 net276 net793 inv4
xi1107 net277 net742 inv4
xi1105 net277 net741 inv4
xi1104 net278 net740 inv4
xi1102 net278 net739 inv4
xi1100 net279 net738 inv4
xi1098 net279 net737 inv4
xi1095 net280 net736 inv4
xi1093 net280 net735 inv4
xi1092 net281 net734 inv4
xi1090 net281 net733 inv4
xi1087 net282 net732 inv4
xi1085 net282 net731 inv4
xi1083 net283 net730 inv4
xi1081 net283 net729 inv4
xi1080 net284 net728 inv4
xi1078 net284 net727 inv4
xi1075 net285 net726 inv4
xi1073 net285 net725 inv4
xi1072 net286 net724 inv4
xi1070 net286 net723 inv4
xi1068 net287 net722 inv4
xi1066 net287 net721 inv4
xi1063 net288 net720 inv4
xi1061 net288 net719 inv4
xi1059 net289 net718 inv4
xi1057 net289 net717 inv4
xi1056 net290 net716 inv4
xi1054 net290 net715 inv4
xi1052 net291 net714 inv4
xi1050 net291 net713 inv4
xi1047 net292 net712 inv4
xi1045 net292 net711 inv4
xi1044 net293 net710 inv4
xi1042 net293 net709 inv4
xi1039 net294 net708 inv4
xi1037 net294 net707 inv4
xi1035 net295 net706 inv4
xi1033 net295 net705 inv4
xi1032 net296 net704 inv4
xi1030 net296 net703 inv4
xi1027 net297 net702 inv4
xi1026 net297 net701 inv4
xi1024 net298 net700 inv4
xi1022 net298 net699 inv4
xi1020 net299 net698 inv4
xi1018 net299 net697 inv4
xi1015 net300 net696 inv4
xi1013 net300 net695 inv4
xi1012 net301 net694 inv4
xi1010 net301 net693 inv4
xi1007 net302 net692 inv4
xi1005 net302 net691 inv4
xi1003 net303 net690 inv4
xi1001 net303 net689 inv4
xi1000 net304 net688 inv4
xi998 net304 net687 inv4
xi996 net305 net686 inv4
xi994 net305 net685 inv4
xi991 net306 net684 inv4
xi989 net306 net683 inv4
xi987 net307 net682 inv4
xi985 net307 net681 inv4
xi984 net308 net680 inv4
xi982 net308 net679 inv4
xi979 net309 net678 inv4
xi977 net309 net677 inv4
xi976 net310 net676 inv4
xi974 net310 net675 inv4
xi972 net311 net674 inv4
xi970 net311 net673 inv4
xi967 net312 net672 inv4
xi965 net312 net671 inv4
xi963 net265 net670 inv4
xi962 net217 net669 inv4
xi960 net264 net668 inv4
xi958 net264 net667 inv4
xi955 net263 net666 inv4
xi953 net263 net665 inv4
xi951 net262 net664 inv4
xi949 net262 net663 inv4
xi948 net261 net662 inv4
xi946 net261 net661 inv4
xi943 net260 net660 inv4
xi941 net260 net659 inv4
xi940 net259 net658 inv4
xi938 net259 net657 inv4
xi936 net258 net656 inv4
xi934 net258 net655 inv4
xi931 net257 net654 inv4
xi929 net257 net653 inv4
xi927 net256 net652 inv4
xi925 net256 net651 inv4
xi924 net255 net650 inv4
xi922 net255 net649 inv4
xi920 net254 net648 inv4
xi918 net254 net647 inv4
xi915 net253 net646 inv4
xi913 net253 net645 inv4
xi912 net252 net644 inv4
xi910 net252 net643 inv4
xi907 net251 net642 inv4
xi905 net251 net641 inv4
xi903 net250 net640 inv4
xi901 net250 net792 inv4
xi899 net249 net791 inv4
xi898 net249 net790 inv4
xi895 net248 net789 inv4
xi893 net248 net788 inv4
xi892 net247 net787 inv4
xi890 net247 net786 inv4
xi888 net246 net785 inv4
xi886 net246 net784 inv4
xi883 net245 net783 inv4
xi881 net245 net782 inv4
xi880 net244 net781 inv4
xi878 net244 net780 inv4
xi875 net243 net779 inv4
xi873 net243 net778 inv4
xi871 net242 net777 inv4
xi869 net242 net776 inv4
xi868 net241 net775 inv4
xi866 net241 net774 inv4
xi864 net240 net773 inv4
xi862 net240 net772 inv4
xi859 net239 net771 inv4
xi857 net239 net770 inv4
xi855 net238 net769 inv4
xi853 net238 net768 inv4
xi852 net237 net767 inv4
xi850 net237 net766 inv4
xi847 net236 net765 inv4
xi845 net236 net764 inv4
xi844 net235 net763 inv4
xi842 net235 net762 inv4
xi840 net234 net761 inv4
xi838 net234 net760 inv4
xi835 net233 net759 inv4
xi833 net233 net758 inv4
xi832 net232 net757 inv4
xi830 net232 net756 inv4
xi827 net231 net755 inv4
xi825 net231 net754 inv4
xi823 net230 net753 inv4
xi821 net230 net752 inv4
xi820 net229 net751 inv4
xi818 net229 net750 inv4
xi815 net228 net749 inv4
xi813 net228 net748 inv4
xi812 net227 net747 inv4
xi810 net227 net746 inv4
xi808 net226 net745 inv4
xi806 net226 net744 inv4
xi803 net225 net743 inv4
xi801 net225 net588 inv4
xi799 net224 net587 inv4
xi797 net224 net586 inv4
xi796 net223 net585 inv4
xi794 net223 net584 inv4
xi792 net222 net583 inv4
xi790 net222 net582 inv4
xi787 net221 net581 inv4
xi785 net221 net580 inv4
xi784 net220 net579 inv4
xi782 net220 net578 inv4
xi779 net219 net577 inv4
xi777 net219 net576 inv4
xi775 net218 net575 inv4
xi773 net218 net574 inv4
xi772 net217 net573 inv4
xi769 net169 net572 inv4
xi768 net170 net571 inv4
xi766 net170 net570 inv4
xi764 net171 net569 inv4
xi762 net171 net568 inv4
xi759 net172 net567 inv4
xi757 net172 net566 inv4
xi756 net173 net565 inv4
xi754 net173 net564 inv4
xi751 net174 net563 inv4
xi749 net174 net562 inv4
xi747 net175 net561 inv4
xi745 net175 net560 inv4
xi744 net176 net559 inv4
xi742 net176 net558 inv4
xi740 net177 net557 inv4
xi738 net177 net556 inv4
xi735 net178 net555 inv4
xi733 net178 net554 inv4
xi731 net179 net553 inv4
xi729 net179 net552 inv4
xi728 net180 net551 inv4
xi726 net180 net550 inv4
xi723 net181 net549 inv4
xi721 net181 net548 inv4
xi720 net182 net547 inv4
xi718 net182 net546 inv4
xi716 net183 net545 inv4
xi714 net183 net544 inv4
xi711 net184 net543 inv4
xi709 net184 net542 inv4
xi708 net185 net541 inv4
xi706 net185 net540 inv4
xi703 net186 net539 inv4
xi701 net186 net538 inv4
xi699 net187 net537 inv4
xi697 net187 net639 inv4
xi696 net188 net638 inv4
xi694 net188 net637 inv4
xi691 net189 net636 inv4
xi689 net189 net635 inv4
xi688 net190 net634 inv4
xi686 net190 net633 inv4
xi684 net191 net632 inv4
xi682 net191 net631 inv4
xi679 net192 net630 inv4
xi677 net192 net629 inv4
xi675 net193 net628 inv4
xi673 net193 net627 inv4
xi672 net194 net626 inv4
xi670 net194 net625 inv4
xi668 net195 net624 inv4
xi666 net195 net623 inv4
xi663 net196 net622 inv4
xi661 net196 net621 inv4
xi660 net197 net620 inv4
xi658 net197 net619 inv4
xi655 net198 net618 inv4
xi653 net198 net617 inv4
xi651 net199 net616 inv4
xi649 net199 net615 inv4
xi648 net200 net614 inv4
xi646 net200 net613 inv4
xi643 net201 net612 inv4
xi642 net201 net611 inv4
xi640 net202 net610 inv4
xi638 net202 net609 inv4
xi636 net203 net608 inv4
xi634 net203 net607 inv4
xi631 net204 net606 inv4
xi629 net204 net605 inv4
xi628 net205 net604 inv4
xi626 net205 net603 inv4
xi623 net206 net602 inv4
xi621 net206 net601 inv4
xi619 net207 net600 inv4
xi617 net207 net599 inv4
xi616 net208 net598 inv4
xi614 net208 net597 inv4
xi612 net209 net596 inv4
xi610 net209 net595 inv4
xi607 net210 net594 inv4
xi605 net210 net593 inv4
xi603 net211 net592 inv4
xi601 net211 net591 inv4
xi600 net212 net590 inv4
xi598 net212 net589 inv4
xi595 net213 net884 inv4
xi593 net213 net883 inv4
xi592 net214 net882 inv4
xi590 net214 net881 inv4
xi588 net215 net880 inv4
xi586 net215 net879 inv4
xi583 net216 net878 inv4
xi581 net216 net877 inv4
xi579 net169 net876 inv4
xi578 net121 net875 inv4
xi576 net168 net874 inv4
xi574 net168 net873 inv4
xi571 net167 net872 inv4
xi569 net167 net871 inv4
xi567 net166 net870 inv4
xi565 net166 net869 inv4
xi564 net165 net868 inv4
xi562 net165 net867 inv4
xi559 net164 net866 inv4
xi557 net164 net865 inv4
xi556 net163 net864 inv4
xi554 net163 net863 inv4
xi552 net162 net862 inv4
xi550 net162 net861 inv4
xi547 net161 net860 inv4
xi545 net161 net859 inv4
xi543 net160 net858 inv4
xi541 net160 net857 inv4
xi540 net159 net856 inv4
xi538 net159 net855 inv4
xi536 net158 net854 inv4
xi534 net158 net853 inv4
xi531 net157 net852 inv4
xi529 net157 net851 inv4
xi528 net156 net850 inv4
xi526 net156 net849 inv4
xi523 net155 net848 inv4
xi521 net155 net847 inv4
xi519 net154 net846 inv4
xi517 net154 net845 inv4
xi515 net153 net844 inv4
xi3 net25 net886 inv4
xi4 net25 net885 inv4
xi7 net26 net938 inv4
xi9 net26 net937 inv4
xi11 net27 net936 inv4
xi13 net27 net933 inv4
xi15 net28 net935 inv4
xi17 net28 net934 inv4
xi19 net29 net932 inv4
xi21 net29 net925 inv4
xi23 net32 net931 inv4
xi25 net32 net930 inv4
xi27 net31 net929 inv4
xi29 net31 net928 inv4
xi31 net30 net927 inv4
xi33 net30 net926 inv4
xi35 net33 net924 inv4
xi37 net33 net909 inv4
xi39 net38 net923 inv4
xi41 net38 net922 inv4
xi43 net39 net921 inv4
xi45 net39 net918 inv4
xi47 net40 net920 inv4
xi49 net40 net919 inv4
xi51 net37 net917 inv4
xi53 net37 net916 inv4
xi55 net36 net915 inv4
xi57 net36 net914 inv4
xi59 net35 net913 inv4
xi61 net35 net912 inv4
xi63 net34 net911 inv4
xi65 net34 net910 inv4
xi67 net41 net908 inv4
xi69 net41 net907 inv4
xi71 net50 net906 inv4
xi73 net50 net905 inv4
xi75 net51 net904 inv4
xi77 net51 net901 inv4
xi79 net52 net903 inv4
xi81 net52 net902 inv4
xi83 net53 net900 inv4
xi85 net53 net893 inv4
xi87 net56 net899 inv4
xi89 net56 net898 inv4
xi91 net55 net897 inv4
xi93 net55 net896 inv4
xi95 net54 net895 inv4
xi97 net54 net894 inv4
xi99 net49 net892 inv4
xi101 net49 net891 inv4
xi103 net46 net889 inv4
xi105 net46 net888 inv4
xi107 net47 net887 inv4
xi109 net47 net986 inv4
xi111 net48 net988 inv4
xi113 net48 net987 inv4
xi115 net45 net890 inv4
xi117 net45 net985 inv4
xi119 net44 net984 inv4
xi121 net44 net983 inv4
xi123 net43 net982 inv4
xi125 net43 net981 inv4
xi127 net42 net980 inv4
xi129 net42 net979 inv4
xi132 net58 net978 inv4
xi134 net58 net977 inv4
xi136 net59 net976 inv4
xi138 net59 net973 inv4
xi140 net60 net975 inv4
xi142 net60 net974 inv4
xi144 net61 net972 inv4
xi146 net61 net965 inv4
xi148 net64 net971 inv4
xi150 net64 net970 inv4
xi152 net63 net969 inv4
xi154 net63 net968 inv4
xi156 net62 net967 inv4
xi158 net62 net966 inv4
xi160 net65 net964 inv4
xi162 net65 net949 inv4
xi164 net70 net963 inv4
xi166 net70 net962 inv4
xi168 net71 net961 inv4
xi170 net71 net958 inv4
xi172 net72 net960 inv4
xi174 net72 net959 inv4
xi176 net69 net957 inv4
xi178 net69 net956 inv4
xi180 net68 net955 inv4
xi182 net68 net954 inv4
xi184 net67 net953 inv4
xi186 net67 net952 inv4
xi188 net66 net951 inv4
xi190 net66 net950 inv4
xi192 net57 net948 inv4
xi194 net57 net947 inv4
xi195 net73 net946 inv4
xi197 net120 net945 inv4
xi199 net120 net944 inv4
xi202 net119 net943 inv4
xi204 net119 net942 inv4
xi206 net118 net941 inv4
xi208 net118 net940 inv4
xi209 net117 net939 inv4
xi211 net117 net1039 inv4
xi214 net116 net1038 inv4
xi216 net116 net1037 inv4
xi217 net115 net1036 inv4
xi219 net115 net1035 inv4
xi221 net114 net1034 inv4
xi223 net114 net1033 inv4
xi226 net113 net1032 inv4
xi228 net113 net1031 inv4
xi230 net112 net1030 inv4
xi232 net112 net1029 inv4
xi233 net111 net1028 inv4
xi235 net111 net1027 inv4
xi237 net110 net1026 inv4
xi239 net110 net1025 inv4
xi242 net109 net1024 inv4
xi244 net109 net1023 inv4
xi245 net108 net1022 inv4
xi247 net108 net1021 inv4
xi250 net107 net1020 inv4
xi252 net107 net1019 inv4
xi254 net106 net1018 inv4
xi256 net106 net1017 inv4
xi258 net105 net1016 inv4
xi259 net105 net1015 inv4
xi262 net104 net1014 inv4
xi264 net104 net1013 inv4
xi265 net103 net1012 inv4
xi267 net103 net1011 inv4
xi269 net102 net1010 inv4
xi271 net102 net1009 inv4
xi274 net101 net1008 inv4
xi276 net101 net1007 inv4
xi277 net100 net1006 inv4
xi279 net100 net1005 inv4
xi282 net99 net1004 inv4
xi284 net99 net1003 inv4
xi286 net98 net1002 inv4
xi288 net98 net1001 inv4
xi289 net97 net1000 inv4
xi291 net97 net999 inv4
xi293 net96 net998 inv4
xi295 net96 net997 inv4
xi298 net95 net996 inv4
xi300 net95 net995 inv4
xi302 net94 net994 inv4
xi304 net94 net993 inv4
xi305 net93 net992 inv4
xi307 net93 net991 inv4
xi310 net92 net990 inv4
xi312 net92 net989 inv4
xi313 net91 net1090 inv4
xi315 net91 net1089 inv4
xi317 net90 net1088 inv4
xi319 net90 net1087 inv4
xi322 net89 net1086 inv4
xi324 net89 net1085 inv4
xi325 net88 net1084 inv4
xi327 net88 net1083 inv4
xi330 net87 net1082 inv4
xi332 net87 net1081 inv4
xi334 net86 net1080 inv4
xi336 net86 net1079 inv4
xi337 net85 net1078 inv4
xi339 net85 net1077 inv4
xi342 net84 net1076 inv4
xi344 net84 net1075 inv4
xi345 net83 net1074 inv4
xi347 net83 net1073 inv4
xi349 net82 net1072 inv4
xi351 net82 net1071 inv4
xi354 net81 net1070 inv4
xi356 net81 net1069 inv4
xi358 net80 net1068 inv4
xi360 net80 net1067 inv4
xi361 net79 net1066 inv4
xi363 net79 net1065 inv4
xi365 net78 net1064 inv4
xi367 net78 net1063 inv4
xi370 net77 net1062 inv4
xi372 net77 net1061 inv4
xi373 net76 net1060 inv4
xi375 net76 net1059 inv4
xi378 net75 net1058 inv4
xi380 net75 net1057 inv4
xi382 net74 net1056 inv4
xi384 net74 net1055 inv4
xi385 net73 net1054 inv4
xi388 net121 net1053 inv4
xi389 net122 net1052 inv4
xi391 net122 net1051 inv4
xi393 net123 net1050 inv4
xi395 net123 net1049 inv4
xi398 net124 net1048 inv4
xi400 net124 net1047 inv4
xi401 net125 net1046 inv4
xi403 net125 net1045 inv4
xi406 net126 net1044 inv4
xi408 net126 net1043 inv4
xi410 net127 net1042 inv4
xi412 net127 net1041 inv4
xi413 net128 net1040 inv4
xi415 net128 net1139 inv4
xi417 net129 net1138 inv4
xi419 net129 net1137 inv4
xi422 net130 net1136 inv4
xi424 net130 net1135 inv4
xi426 net131 net1134 inv4
xi428 net131 net1133 inv4
xi429 net132 net1132 inv4
xi431 net132 net1131 inv4
xi434 net133 net1130 inv4
xi436 net133 net1129 inv4
xi437 net134 net1128 inv4
xi439 net134 net1127 inv4
xi441 net135 net1126 inv4
xi443 net135 net1125 inv4
xi446 net136 net1124 inv4
xi448 net136 net1123 inv4
xi449 net137 net1122 inv4
xi451 net137 net1121 inv4
xi454 net138 net1120 inv4
xi456 net138 net1119 inv4
xi458 net139 net1118 inv4
xi460 net139 net1117 inv4
xi461 net140 net1116 inv4
xi463 net140 net1115 inv4
xi466 net141 net1114 inv4
xi468 net141 net1113 inv4
xi469 net142 net1112 inv4
xi471 net142 net1111 inv4
xi473 net143 net1110 inv4
xi475 net143 net1109 inv4
xi478 net144 net1108 inv4
xi480 net144 net1107 inv4
xi482 net145 net1106 inv4
xi484 net145 net1105 inv4
xi485 net146 net1104 inv4
xi487 net146 net1103 inv4
xi489 net147 net1102 inv4
xi491 net147 net1101 inv4
xi494 net148 net1100 inv4
xi496 net148 net1099 inv4
xi497 net149 net1098 inv4
xi499 net149 net1097 inv4
xi502 net150 net1096 inv4
xi504 net150 net1095 inv4
xi506 net151 net1094 inv4
xi508 net151 net1093 inv4
xi509 net152 net1092 inv4
xi511 net152 net1091 inv4
xi514 net153 net1140 inv4
xi2113 net1153 wln<480> Inv8
xi2048 net1152 wls<511> Inv8
xi2046 net1151 wln<511> Inv8
xi2043 net1150 wls<510> Inv8
xi2041 net1149 wln<510> Inv8
xi2039 net1148 wls<509> Inv8
xi2037 net1147 wln<509> Inv8
xi2036 net1146 wls<508> Inv8
xi2034 net1145 wln<508> Inv8
xi2031 net1144 wls<507> Inv8
xi2029 net1143 wln<507> Inv8
xi2028 net1142 wls<506> Inv8
xi2026 net1141 wln<506> Inv8
xi2024 net1204 wls<505> Inv8
xi2022 net1203 wln<505> Inv8
xi2019 net1202 wls<504> Inv8
xi2017 net1201 wln<504> Inv8
xi2015 net1200 wls<503> Inv8
xi2013 net1199 wln<503> Inv8
xi2012 net1198 wls<502> Inv8
xi2010 net1197 wln<502> Inv8
xi2008 net1196 wls<501> Inv8
xi2006 net1195 wln<501> Inv8
xi2003 net1194 wls<500> Inv8
xi2001 net1193 wln<500> Inv8
xi2000 net1192 wls<499> Inv8
xi1998 net1191 wln<499> Inv8
xi1995 net1190 wls<498> Inv8
xi1993 net1189 wln<498> Inv8
xi1991 net1188 wls<497> Inv8
xi1989 net1187 wln<497> Inv8
xi1988 net1186 wls<496> Inv8
xi1986 net1185 wln<496> Inv8
xi1983 net1184 wls<495> Inv8
xi1981 net1183 wln<495> Inv8
xi1980 net1182 wls<494> Inv8
xi1978 net1181 wln<494> Inv8
xi1976 net1180 wls<493> Inv8
xi1974 net1179 wln<493> Inv8
xi1971 net1178 wls<492> Inv8
xi1969 net1177 wln<492> Inv8
xi1968 net1176 wls<491> Inv8
xi1966 net1175 wln<491> Inv8
xi1963 net1174 wls<490> Inv8
xi1961 net1173 wln<490> Inv8
xi1959 net1172 wls<489> Inv8
xi1957 net1171 wln<489> Inv8
xi1956 net1170 wls<488> Inv8
xi1954 net1169 wln<488> Inv8
xi1952 net1168 wls<487> Inv8
xi1950 net1167 wln<487> Inv8
xi1947 net1166 wls<486> Inv8
xi1945 net1165 wln<486> Inv8
xi1943 net1164 wls<485> Inv8
xi1941 net1163 wln<485> Inv8
xi1940 net1162 wls<484> Inv8
xi1938 net1161 wln<484> Inv8
xi1935 net1160 wls<483> Inv8
xi1933 net1159 wln<483> Inv8
xi1932 net1158 wls<482> Inv8
xi1930 net1157 wln<482> Inv8
xi1928 net1156 wls<481> Inv8
xi1926 net1155 wln<481> Inv8
xi1923 net1154 wls<480> Inv8
xi1922 net1255 wls<432> Inv8
xi1919 net1254 wln<433> Inv8
xi1917 net1253 wls<433> Inv8
xi1915 net1252 wln<434> Inv8
xi1913 net1251 wls<434> Inv8
xi1912 net1250 wln<435> Inv8
xi1910 net1249 wls<435> Inv8
xi1907 net1248 wln<436> Inv8
xi1905 net1247 wls<436> Inv8
xi1904 net1246 wln<437> Inv8
xi1902 net1245 wls<437> Inv8
xi1900 net1244 wln<438> Inv8
xi1898 net1243 wls<438> Inv8
xi1895 net1242 wln<439> Inv8
xi1893 net1241 wls<439> Inv8
xi1891 net1240 wln<440> Inv8
xi1889 net1239 wls<440> Inv8
xi1888 net1238 wln<441> Inv8
xi1886 net1237 wls<441> Inv8
xi1884 net1236 wln<442> Inv8
xi1882 net1235 wls<442> Inv8
xi1879 net1234 wln<443> Inv8
xi1877 net1233 wls<443> Inv8
xi1876 net1232 wln<444> Inv8
xi1874 net1231 wls<444> Inv8
xi1871 net1230 wln<445> Inv8
xi1869 net1229 wls<445> Inv8
xi1867 net1228 wln<446> Inv8
xi1865 net1227 wls<446> Inv8
xi1864 net1226 wln<447> Inv8
xi1862 net1225 wls<447> Inv8
xi1859 net1224 wln<448> Inv8
xi1857 net1223 wls<448> Inv8
xi1856 net1222 wln<449> Inv8
xi1854 net1221 wls<449> Inv8
xi1852 net1220 wln<450> Inv8
xi1850 net1219 wls<450> Inv8
xi1847 net1218 wln<451> Inv8
xi1845 net1217 wls<451> Inv8
xi1844 net1216 wln<452> Inv8
xi1842 net1215 wls<452> Inv8
xi1839 net1214 wln<453> Inv8
xi1837 net1213 wls<453> Inv8
xi1835 net1212 wln<454> Inv8
xi1833 net1211 wls<454> Inv8
xi1832 net1210 wln<455> Inv8
xi1830 net1209 wls<455> Inv8
xi1828 net1208 wln<456> Inv8
xi1826 net1207 wls<456> Inv8
xi1823 net1206 wln<457> Inv8
xi1821 net1205 wls<457> Inv8
xi1819 net1306 wln<458> Inv8
xi1817 net1305 wls<458> Inv8
xi1816 net1304 wln<459> Inv8
xi1814 net1303 wls<459> Inv8
xi1811 net1302 wln<460> Inv8
xi1809 net1301 wls<460> Inv8
xi1808 net1300 wln<461> Inv8
xi1806 net1299 wls<461> Inv8
xi1804 net1298 wln<462> Inv8
xi1802 net1297 wls<462> Inv8
xi1799 net1296 wln<463> Inv8
xi1797 net1295 wls<463> Inv8
xi1796 net1294 wln<464> Inv8
xi1793 net1293 wls<464> Inv8
xi1791 net1292 wln<465> Inv8
xi1789 net1291 wls<465> Inv8
xi1787 net1290 wln<466> Inv8
xi1785 net1289 wls<466> Inv8
xi1784 net1288 wln<467> Inv8
xi1782 net1287 wls<467> Inv8
xi1779 net1286 wln<468> Inv8
xi1777 net1285 wls<468> Inv8
xi1776 net1284 wln<469> Inv8
xi1774 net1283 wls<469> Inv8
xi1772 net1282 wln<470> Inv8
xi1770 net1281 wls<470> Inv8
xi1767 net1280 wln<471> Inv8
xi1765 net1279 wls<471> Inv8
xi1763 net1278 wln<472> Inv8
xi1761 net1277 wls<472> Inv8
xi1760 net1276 wln<473> Inv8
xi1758 net1275 wls<473> Inv8
xi1756 net1274 wln<474> Inv8
xi1754 net1273 wls<474> Inv8
xi1751 net1272 wln<475> Inv8
xi1749 net1271 wls<475> Inv8
xi1748 net1270 wln<476> Inv8
xi1746 net1269 wls<476> Inv8
xi1743 net1268 wln<477> Inv8
xi1741 net1267 wls<477> Inv8
xi1739 net1266 wln<478> Inv8
xi1737 net1265 wls<478> Inv8
xi1736 net1264 wln<479> Inv8
xi1734 net1263 wls<479> Inv8
xi1732 net1262 wln<432> Inv8
xi1729 net1261 wln<384> Inv8
xi1727 net1260 wls<431> Inv8
xi1725 net1259 wln<431> Inv8
xi1724 net1258 wls<430> Inv8
xi1722 net1257 wln<430> Inv8
xi1720 net1256 wls<429> Inv8
xi1718 net1357 wln<429> Inv8
xi1715 net1356 wls<428> Inv8
xi1713 net1355 wln<428> Inv8
xi1712 net1354 wls<427> Inv8
xi1710 net1353 wln<427> Inv8
xi1707 net1352 wls<426> Inv8
xi1705 net1351 wln<426> Inv8
xi1703 net1350 wls<425> Inv8
xi1701 net1349 wln<425> Inv8
xi1700 net1348 wls<424> Inv8
xi1698 net1347 wln<424> Inv8
xi1696 net1346 wls<423> Inv8
xi1694 net1345 wln<423> Inv8
xi1691 net1344 wls<422> Inv8
xi1689 net1343 wln<422> Inv8
xi1687 net1342 wls<421> Inv8
xi1685 net1341 wln<421> Inv8
xi1684 net1340 wls<420> Inv8
xi1682 net1339 wln<420> Inv8
xi1679 net1338 wls<419> Inv8
xi1677 net1337 wln<419> Inv8
xi1676 net1336 wls<418> Inv8
xi1674 net1335 wln<418> Inv8
xi1672 net1334 wls<417> Inv8
xi1670 net1333 wln<417> Inv8
xi1668 net1332 wls<416> Inv8
xi1665 net1331 wln<416> Inv8
xi1664 net1330 wls<415> Inv8
xi1662 net1329 wln<415> Inv8
xi1659 net1328 wls<414> Inv8
xi1657 net1327 wln<414> Inv8
xi1655 net1326 wls<413> Inv8
xi1653 net1325 wln<413> Inv8
xi1652 net1324 wls<412> Inv8
xi1650 net1323 wln<412> Inv8
xi1647 net1322 wls<411> Inv8
xi1645 net1321 wln<411> Inv8
xi1644 net1320 wls<410> Inv8
xi1642 net1319 wln<410> Inv8
xi1640 net1318 wls<409> Inv8
xi1638 net1317 wln<409> Inv8
xi1635 net1316 wls<408> Inv8
xi1633 net1315 wln<408> Inv8
xi1631 net1314 wls<407> Inv8
xi1629 net1313 wln<407> Inv8
xi1628 net1312 wls<406> Inv8
xi1626 net1311 wln<406> Inv8
xi1624 net1310 wls<405> Inv8
xi1622 net1309 wln<405> Inv8
xi1619 net1308 wls<404> Inv8
xi1617 net1307 wln<404> Inv8
xi1616 net1408 wls<403> Inv8
xi1614 net1407 wln<403> Inv8
xi1611 net1406 wls<402> Inv8
xi1609 net1405 wln<402> Inv8
xi1607 net1404 wls<401> Inv8
xi1605 net1403 wln<401> Inv8
xi1604 net1402 wls<400> Inv8
xi1602 net1401 wln<400> Inv8
xi1599 net1400 wls<399> Inv8
xi1597 net1399 wln<399> Inv8
xi1596 net1398 wls<398> Inv8
xi1594 net1397 wln<398> Inv8
xi1592 net1396 wls<397> Inv8
xi1590 net1395 wln<397> Inv8
xi1587 net1394 wls<396> Inv8
xi1585 net1393 wln<396> Inv8
xi1584 net1392 wls<395> Inv8
xi1582 net1391 wln<395> Inv8
xi1579 net1390 wls<394> Inv8
xi1577 net1389 wln<394> Inv8
xi1575 net1388 wls<393> Inv8
xi1573 net1387 wln<393> Inv8
xi1572 net1386 wls<392> Inv8
xi1570 net1385 wln<392> Inv8
xi1568 net1384 wls<391> Inv8
xi1566 net1383 wln<391> Inv8
xi1563 net1382 wls<390> Inv8
xi1561 net1381 wln<390> Inv8
xi1559 net1380 wls<389> Inv8
xi1557 net1379 wln<389> Inv8
xi1556 net1378 wls<388> Inv8
xi1554 net1377 wln<388> Inv8
xi1551 net1376 wls<387> Inv8
xi1549 net1375 wln<387> Inv8
xi1548 net1374 wls<386> Inv8
xi1546 net1373 wln<386> Inv8
xi1544 net1372 wls<385> Inv8
xi1542 net1371 wln<385> Inv8
xi1539 net1370 wls<384> Inv8
xi1538 net1369 wls<336> Inv8
xi1535 net1368 wln<337> Inv8
xi1533 net1367 wls<337> Inv8
xi1531 net1366 wln<338> Inv8
xi1529 net1365 wls<338> Inv8
xi1528 net1364 wln<339> Inv8
xi1526 net1363 wls<339> Inv8
xi1523 net1362 wln<340> Inv8
xi1521 net1361 wls<340> Inv8
xi1520 net1360 wln<341> Inv8
xi1518 net1359 wls<341> Inv8
xi1516 net1358 wln<342> Inv8
xi1514 net1459 wls<342> Inv8
xi1511 net1458 wln<343> Inv8
xi1509 net1457 wls<343> Inv8
xi1507 net1456 wln<344> Inv8
xi1505 net1455 wls<344> Inv8
xi1504 net1454 wln<345> Inv8
xi1502 net1453 wls<345> Inv8
xi1500 net1452 wln<346> Inv8
xi1498 net1451 wls<346> Inv8
xi1495 net1450 wln<347> Inv8
xi1493 net1449 wls<347> Inv8
xi1492 net1448 wln<348> Inv8
xi1490 net1447 wls<348> Inv8
xi1487 net1446 wln<349> Inv8
xi1485 net1445 wls<349> Inv8
xi1483 net1444 wln<350> Inv8
xi1481 net1443 wls<350> Inv8
xi1480 net1442 wln<351> Inv8
xi1478 net1441 wls<351> Inv8
xi1475 net1440 wln<352> Inv8
xi1473 net1439 wls<352> Inv8
xi1472 net1438 wln<353> Inv8
xi1470 net1437 wls<353> Inv8
xi1468 net1436 wln<354> Inv8
xi1466 net1435 wls<354> Inv8
xi1463 net1434 wln<355> Inv8
xi1461 net1433 wls<355> Inv8
xi1460 net1432 wln<356> Inv8
xi1458 net1431 wls<356> Inv8
xi1455 net1430 wln<357> Inv8
xi1453 net1429 wls<357> Inv8
xi1451 net1428 wln<358> Inv8
xi1449 net1427 wls<358> Inv8
xi1448 net1426 wln<359> Inv8
xi1446 net1425 wls<359> Inv8
xi1444 net1424 wln<360> Inv8
xi1442 net1423 wls<360> Inv8
xi1439 net1422 wln<361> Inv8
xi1437 net1421 wls<361> Inv8
xi1435 net1420 wln<362> Inv8
xi1433 net1419 wls<362> Inv8
xi1432 net1418 wln<363> Inv8
xi1430 net1417 wls<363> Inv8
xi1427 net1416 wln<364> Inv8
xi1425 net1415 wls<364> Inv8
xi1424 net1414 wln<365> Inv8
xi1422 net1413 wls<365> Inv8
xi1420 net1412 wln<366> Inv8
xi1418 net1411 wls<366> Inv8
xi1415 net1410 wln<367> Inv8
xi1413 net1409 wls<367> Inv8
xi1412 net1510 wln<368> Inv8
xi1409 net1509 wls<368> Inv8
xi1407 net1508 wln<369> Inv8
xi1405 net1507 wls<369> Inv8
xi1403 net1506 wln<370> Inv8
xi1401 net1505 wls<370> Inv8
xi1400 net1504 wln<371> Inv8
xi1398 net1503 wls<371> Inv8
xi1395 net1502 wln<372> Inv8
xi1393 net1501 wls<372> Inv8
xi1392 net1500 wln<373> Inv8
xi1390 net1499 wls<373> Inv8
xi1388 net1498 wln<374> Inv8
xi1386 net1497 wls<374> Inv8
xi1383 net1496 wln<375> Inv8
xi1381 net1495 wls<375> Inv8
xi1379 net1494 wln<376> Inv8
xi1377 net1493 wls<376> Inv8
xi1376 net1492 wln<377> Inv8
xi1374 net1491 wls<377> Inv8
xi1372 net1490 wln<378> Inv8
xi1370 net1489 wls<378> Inv8
xi1367 net1488 wln<379> Inv8
xi1365 net1487 wls<379> Inv8
xi1364 net1486 wln<380> Inv8
xi1362 net1485 wls<380> Inv8
xi1359 net1484 wln<381> Inv8
xi1357 net1483 wls<381> Inv8
xi1355 net1482 wln<382> Inv8
xi1353 net1481 wls<382> Inv8
xi1352 net1480 wln<383> Inv8
xi1350 net1479 wls<383> Inv8
xi1348 net1478 wln<336> Inv8
xi1345 net1477 wln<288> Inv8
xi1343 net1476 wls<335> Inv8
xi1341 net1475 wln<335> Inv8
xi1340 net1474 wls<334> Inv8
xi1338 net1473 wln<334> Inv8
xi1336 net1472 wls<333> Inv8
xi1334 net1471 wln<333> Inv8
xi1331 net1470 wls<332> Inv8
xi1329 net1469 wln<332> Inv8
xi1328 net1468 wls<331> Inv8
xi1326 net1467 wln<331> Inv8
xi1323 net1466 wls<330> Inv8
xi1321 net1465 wln<330> Inv8
xi1319 net1464 wls<329> Inv8
xi1317 net1463 wln<329> Inv8
xi1316 net1462 wls<328> Inv8
xi1314 net1461 wln<328> Inv8
xi1312 net1460 wls<327> Inv8
xi1310 net1560 wln<327> Inv8
xi1307 net1559 wls<326> Inv8
xi1305 net1558 wln<326> Inv8
xi1303 net1557 wls<325> Inv8
xi1301 net1556 wln<325> Inv8
xi1300 net1555 wls<324> Inv8
xi1298 net1554 wln<324> Inv8
xi1295 net1553 wls<323> Inv8
xi1293 net1552 wln<323> Inv8
xi1292 net1551 wls<322> Inv8
xi1290 net1550 wln<322> Inv8
xi1288 net1549 wls<321> Inv8
xi1286 net1548 wln<321> Inv8
xi1284 net1547 wls<320> Inv8
xi1281 net1546 wln<320> Inv8
xi1280 net1545 wls<319> Inv8
xi1278 net1544 wln<319> Inv8
xi1275 net1543 wls<318> Inv8
xi1273 net1542 wln<318> Inv8
xi1271 net1541 wls<317> Inv8
xi1269 net1540 wln<317> Inv8
xi1268 net1539 wls<316> Inv8
xi1266 net1538 wln<316> Inv8
xi1263 net1537 wls<315> Inv8
xi1261 net1536 wln<315> Inv8
xi1260 net1535 wls<314> Inv8
xi1258 net1534 wln<314> Inv8
xi1256 net1533 wls<313> Inv8
xi1254 net1532 wln<313> Inv8
xi1251 net1531 wls<312> Inv8
xi1249 net1530 wln<312> Inv8
xi1247 net1529 wls<311> Inv8
xi1245 net1528 wln<311> Inv8
xi1244 net1527 wls<310> Inv8
xi1242 net1526 wln<310> Inv8
xi1240 net1525 wls<309> Inv8
xi1238 net1524 wln<309> Inv8
xi1235 net1523 wls<308> Inv8
xi1233 net1522 wln<308> Inv8
xi1232 net1521 wls<307> Inv8
xi1230 net1520 wln<307> Inv8
xi1227 net1519 wls<306> Inv8
xi1225 net1518 wln<306> Inv8
xi1223 net1517 wls<305> Inv8
xi1221 net1516 wln<305> Inv8
xi1220 net1515 wls<304> Inv8
xi1218 net1514 wln<304> Inv8
xi1215 net1513 wls<303> Inv8
xi1213 net1512 wln<303> Inv8
xi1212 net1511 wls<302> Inv8
xi1210 net843 wln<302> Inv8
xi1208 net842 wls<301> Inv8
xi1206 net841 wln<301> Inv8
xi1203 net840 wls<300> Inv8
xi1201 net839 wln<300> Inv8
xi1200 net838 wls<299> Inv8
xi1198 net837 wln<299> Inv8
xi1195 net836 wls<298> Inv8
xi1193 net835 wln<298> Inv8
xi1191 net834 wls<297> Inv8
xi1189 net833 wln<297> Inv8
xi1188 net832 wls<296> Inv8
xi1186 net831 wln<296> Inv8
xi1184 net830 wls<295> Inv8
xi1182 net829 wln<295> Inv8
xi1179 net828 wls<294> Inv8
xi1177 net827 wln<294> Inv8
xi1175 net826 wls<293> Inv8
xi1173 net825 wln<293> Inv8
xi1172 net824 wls<292> Inv8
xi1170 net823 wln<292> Inv8
xi1167 net822 wls<291> Inv8
xi1165 net821 wln<291> Inv8
xi1164 net820 wls<290> Inv8
xi1162 net819 wln<290> Inv8
xi1160 net818 wls<289> Inv8
xi1158 net817 wln<289> Inv8
xi1155 net816 wls<288> Inv8
xi1154 net815 wls<240> Inv8
xi1151 net814 wln<241> Inv8
xi1149 net813 wls<241> Inv8
xi1147 net812 wln<242> Inv8
xi1145 net811 wls<242> Inv8
xi1144 net810 wln<243> Inv8
xi1142 net809 wls<243> Inv8
xi1139 net808 wln<244> Inv8
xi1137 net807 wls<244> Inv8
xi1136 net806 wln<245> Inv8
xi1134 net805 wls<245> Inv8
xi1132 net804 wln<246> Inv8
xi1130 net803 wls<246> Inv8
xi1127 net802 wln<247> Inv8
xi1125 net801 wls<247> Inv8
xi1123 net800 wln<248> Inv8
xi1121 net799 wls<248> Inv8
xi1120 net798 wln<249> Inv8
xi1118 net797 wls<249> Inv8
xi1116 net796 wln<250> Inv8
xi1114 net795 wls<250> Inv8
xi1111 net794 wln<251> Inv8
xi1109 net793 wls<251> Inv8
xi1108 net742 wln<252> Inv8
xi1106 net741 wls<252> Inv8
xi1103 net740 wln<253> Inv8
xi1101 net739 wls<253> Inv8
xi1099 net738 wln<254> Inv8
xi1097 net737 wls<254> Inv8
xi1096 net736 wln<255> Inv8
xi1094 net735 wls<255> Inv8
xi1091 net734 wln<256> Inv8
xi1089 net733 wls<256> Inv8
xi1088 net732 wln<257> Inv8
xi1086 net731 wls<257> Inv8
xi1084 net730 wln<258> Inv8
xi1082 net729 wls<258> Inv8
xi1079 net728 wln<259> Inv8
xi1077 net727 wls<259> Inv8
xi1076 net726 wln<260> Inv8
xi1074 net725 wls<260> Inv8
xi1071 net724 wln<261> Inv8
xi1069 net723 wls<261> Inv8
xi1067 net722 wln<262> Inv8
xi1065 net721 wls<262> Inv8
xi1064 net720 wln<263> Inv8
xi1062 net719 wls<263> Inv8
xi1060 net718 wln<264> Inv8
xi1058 net717 wls<264> Inv8
xi1055 net716 wln<265> Inv8
xi1053 net715 wls<265> Inv8
xi1051 net714 wln<266> Inv8
xi1049 net713 wls<266> Inv8
xi1048 net712 wln<267> Inv8
xi1046 net711 wls<267> Inv8
xi1043 net710 wln<268> Inv8
xi1041 net709 wls<268> Inv8
xi1040 net708 wln<269> Inv8
xi1038 net707 wls<269> Inv8
xi1036 net706 wln<270> Inv8
xi1034 net705 wls<270> Inv8
xi1031 net704 wln<271> Inv8
xi1029 net703 wls<271> Inv8
xi1028 net702 wln<272> Inv8
xi1025 net701 wls<272> Inv8
xi1023 net700 wln<273> Inv8
xi1021 net699 wls<273> Inv8
xi1019 net698 wln<274> Inv8
xi1017 net697 wls<274> Inv8
xi1016 net696 wln<275> Inv8
xi1014 net695 wls<275> Inv8
xi1011 net694 wln<276> Inv8
xi1009 net693 wls<276> Inv8
xi1008 net692 wln<277> Inv8
xi1006 net691 wls<277> Inv8
xi1004 net690 wln<278> Inv8
xi1002 net689 wls<278> Inv8
xi999 net688 wln<279> Inv8
xi997 net687 wls<279> Inv8
xi995 net686 wln<280> Inv8
xi993 net685 wls<280> Inv8
xi992 net684 wln<281> Inv8
xi990 net683 wls<281> Inv8
xi988 net682 wln<282> Inv8
xi986 net681 wls<282> Inv8
xi983 net680 wln<283> Inv8
xi981 net679 wls<283> Inv8
xi980 net678 wln<284> Inv8
xi978 net677 wls<284> Inv8
xi975 net676 wln<285> Inv8
xi973 net675 wls<285> Inv8
xi971 net674 wln<286> Inv8
xi969 net673 wls<286> Inv8
xi968 net672 wln<287> Inv8
xi966 net671 wls<287> Inv8
xi964 net670 wln<240> Inv8
xi961 net669 wln<192> Inv8
xi959 net668 wls<239> Inv8
xi957 net667 wln<239> Inv8
xi956 net666 wls<238> Inv8
xi954 net665 wln<238> Inv8
xi952 net664 wls<237> Inv8
xi950 net663 wln<237> Inv8
xi947 net662 wls<236> Inv8
xi945 net661 wln<236> Inv8
xi944 net660 wls<235> Inv8
xi942 net659 wln<235> Inv8
xi939 net658 wls<234> Inv8
xi937 net657 wln<234> Inv8
xi935 net656 wls<233> Inv8
xi933 net655 wln<233> Inv8
xi932 net654 wls<232> Inv8
xi930 net653 wln<232> Inv8
xi928 net652 wls<231> Inv8
xi926 net651 wln<231> Inv8
xi923 net650 wls<230> Inv8
xi921 net649 wln<230> Inv8
xi919 net648 wls<229> Inv8
xi917 net647 wln<229> Inv8
xi916 net646 wls<228> Inv8
xi914 net645 wln<228> Inv8
xi911 net644 wls<227> Inv8
xi909 net643 wln<227> Inv8
xi908 net642 wls<226> Inv8
xi906 net641 wln<226> Inv8
xi904 net640 wls<225> Inv8
xi902 net792 wln<225> Inv8
xi900 net791 wls<224> Inv8
xi897 net790 wln<224> Inv8
xi896 net789 wls<223> Inv8
xi894 net788 wln<223> Inv8
xi891 net787 wls<222> Inv8
xi889 net786 wln<222> Inv8
xi887 net785 wls<221> Inv8
xi885 net784 wln<221> Inv8
xi884 net783 wls<220> Inv8
xi882 net782 wln<220> Inv8
xi879 net781 wls<219> Inv8
xi877 net780 wln<219> Inv8
xi876 net779 wls<218> Inv8
xi874 net778 wln<218> Inv8
xi872 net777 wls<217> Inv8
xi870 net776 wln<217> Inv8
xi867 net775 wls<216> Inv8
xi865 net774 wln<216> Inv8
xi863 net773 wls<215> Inv8
xi861 net772 wln<215> Inv8
xi860 net771 wls<214> Inv8
xi858 net770 wln<214> Inv8
xi856 net769 wls<213> Inv8
xi854 net768 wln<213> Inv8
xi851 net767 wls<212> Inv8
xi849 net766 wln<212> Inv8
xi848 net765 wls<211> Inv8
xi846 net764 wln<211> Inv8
xi843 net763 wls<210> Inv8
xi841 net762 wln<210> Inv8
xi839 net761 wls<209> Inv8
xi837 net760 wln<209> Inv8
xi836 net759 wls<208> Inv8
xi834 net758 wln<208> Inv8
xi831 net757 wls<207> Inv8
xi829 net756 wln<207> Inv8
xi828 net755 wls<206> Inv8
xi826 net754 wln<206> Inv8
xi824 net753 wls<205> Inv8
xi822 net752 wln<205> Inv8
xi819 net751 wls<204> Inv8
xi817 net750 wln<204> Inv8
xi816 net749 wls<203> Inv8
xi814 net748 wln<203> Inv8
xi811 net747 wls<202> Inv8
xi809 net746 wln<202> Inv8
xi807 net745 wls<201> Inv8
xi805 net744 wln<201> Inv8
xi804 net743 wls<200> Inv8
xi802 net588 wln<200> Inv8
xi800 net587 wls<199> Inv8
xi798 net586 wln<199> Inv8
xi795 net585 wls<198> Inv8
xi793 net584 wln<198> Inv8
xi791 net583 wls<197> Inv8
xi789 net582 wln<197> Inv8
xi788 net581 wls<196> Inv8
xi786 net580 wln<196> Inv8
xi783 net579 wls<195> Inv8
xi781 net578 wln<195> Inv8
xi780 net577 wls<194> Inv8
xi778 net576 wln<194> Inv8
xi776 net575 wls<193> Inv8
xi774 net574 wln<193> Inv8
xi771 net573 wls<192> Inv8
xi770 net572 wls<144> Inv8
xi767 net571 wln<145> Inv8
xi765 net570 wls<145> Inv8
xi763 net569 wln<146> Inv8
xi761 net568 wls<146> Inv8
xi760 net567 wln<147> Inv8
xi758 net566 wls<147> Inv8
xi755 net565 wln<148> Inv8
xi753 net564 wls<148> Inv8
xi752 net563 wln<149> Inv8
xi750 net562 wls<149> Inv8
xi748 net561 wln<150> Inv8
xi746 net560 wls<150> Inv8
xi743 net559 wln<151> Inv8
xi741 net558 wls<151> Inv8
xi739 net557 wln<152> Inv8
xi737 net556 wls<152> Inv8
xi736 net555 wln<153> Inv8
xi734 net554 wls<153> Inv8
xi732 net553 wln<154> Inv8
xi730 net552 wls<154> Inv8
xi727 net551 wln<155> Inv8
xi725 net550 wls<155> Inv8
xi724 net549 wln<156> Inv8
xi722 net548 wls<156> Inv8
xi719 net547 wln<157> Inv8
xi717 net546 wls<157> Inv8
xi715 net545 wln<158> Inv8
xi713 net544 wls<158> Inv8
xi712 net543 wln<159> Inv8
xi710 net542 wls<159> Inv8
xi707 net541 wln<160> Inv8
xi705 net540 wls<160> Inv8
xi704 net539 wln<161> Inv8
xi702 net538 wls<161> Inv8
xi700 net537 wln<162> Inv8
xi698 net639 wls<162> Inv8
xi695 net638 wln<163> Inv8
xi693 net637 wls<163> Inv8
xi692 net636 wln<164> Inv8
xi690 net635 wls<164> Inv8
xi687 net634 wln<165> Inv8
xi685 net633 wls<165> Inv8
xi683 net632 wln<166> Inv8
xi681 net631 wls<166> Inv8
xi680 net630 wln<167> Inv8
xi678 net629 wls<167> Inv8
xi676 net628 wln<168> Inv8
xi674 net627 wls<168> Inv8
xi671 net626 wln<169> Inv8
xi669 net625 wls<169> Inv8
xi667 net624 wln<170> Inv8
xi665 net623 wls<170> Inv8
xi664 net622 wln<171> Inv8
xi662 net621 wls<171> Inv8
xi659 net620 wln<172> Inv8
xi657 net619 wls<172> Inv8
xi656 net618 wln<173> Inv8
xi654 net617 wls<173> Inv8
xi652 net616 wln<174> Inv8
xi650 net615 wls<174> Inv8
xi647 net614 wln<175> Inv8
xi645 net613 wls<175> Inv8
xi644 net612 wln<176> Inv8
xi641 net611 wls<176> Inv8
xi639 net610 wln<177> Inv8
xi637 net609 wls<177> Inv8
xi635 net608 wln<178> Inv8
xi633 net607 wls<178> Inv8
xi632 net606 wln<179> Inv8
xi630 net605 wls<179> Inv8
xi627 net604 wln<180> Inv8
xi625 net603 wls<180> Inv8
xi624 net602 wln<181> Inv8
xi622 net601 wls<181> Inv8
xi620 net600 wln<182> Inv8
xi618 net599 wls<182> Inv8
xi615 net598 wln<183> Inv8
xi613 net597 wls<183> Inv8
xi611 net596 wln<184> Inv8
xi609 net595 wls<184> Inv8
xi608 net594 wln<185> Inv8
xi606 net593 wls<185> Inv8
xi604 net592 wln<186> Inv8
xi602 net591 wls<186> Inv8
xi599 net590 wln<187> Inv8
xi597 net589 wls<187> Inv8
xi596 net884 wln<188> Inv8
xi594 net883 wls<188> Inv8
xi591 net882 wln<189> Inv8
xi589 net881 wls<189> Inv8
xi587 net880 wln<190> Inv8
xi585 net879 wls<190> Inv8
xi584 net878 wln<191> Inv8
xi582 net877 wls<191> Inv8
xi580 net876 wln<144> Inv8
xi577 net875 wln<96> Inv8
xi575 net874 wls<143> Inv8
xi573 net873 wln<143> Inv8
xi572 net872 wls<142> Inv8
xi570 net871 wln<142> Inv8
xi568 net870 wls<141> Inv8
xi566 net869 wln<141> Inv8
xi563 net868 wls<140> Inv8
xi561 net867 wln<140> Inv8
xi560 net866 wls<139> Inv8
xi558 net865 wln<139> Inv8
xi555 net864 wls<138> Inv8
xi553 net863 wln<138> Inv8
xi551 net862 wls<137> Inv8
xi549 net861 wln<137> Inv8
xi548 net860 wls<136> Inv8
xi546 net859 wln<136> Inv8
xi544 net858 wls<135> Inv8
xi542 net857 wln<135> Inv8
xi539 net856 wls<134> Inv8
xi537 net855 wln<134> Inv8
xi535 net854 wls<133> Inv8
xi533 net853 wln<133> Inv8
xi532 net852 wls<132> Inv8
xi530 net851 wln<132> Inv8
xi527 net850 wls<131> Inv8
xi525 net849 wln<131> Inv8
xi524 net848 wls<130> Inv8
xi522 net847 wln<130> Inv8
xi520 net846 wls<129> Inv8
xi518 net845 wln<129> Inv8
xi516 net844 wls<128> Inv8
xi5 net886 wln<0> Inv8
xi6 net885 wls<0> Inv8
xi8 net938 wln<1> Inv8
xi10 net937 wls<1> Inv8
xi12 net936 wln<2> Inv8
xi14 net935 wls<3> Inv8
xi16 net934 wln<3> Inv8
xi18 net933 wls<2> Inv8
xi20 net932 wln<4> Inv8
xi22 net929 wls<6> Inv8
xi24 net931 wln<7> Inv8
xi26 net930 wls<7> Inv8
xi28 net928 wln<6> Inv8
xi30 net927 wls<5> Inv8
xi32 net926 wln<5> Inv8
xi34 net925 wls<4> Inv8
xi36 net924 wln<8> Inv8
xi38 net917 wls<12> Inv8
xi40 net923 wln<13> Inv8
xi42 net922 wls<13> Inv8
xi44 net921 wln<14> Inv8
xi46 net920 wls<15> Inv8
xi48 net919 wln<15> Inv8
xi50 net918 wls<14> Inv8
xi52 net916 wln<12> Inv8
xi54 net913 wls<10> Inv8
xi56 net915 wln<11> Inv8
xi58 net914 wls<11> Inv8
xi60 net912 wln<10> Inv8
xi62 net911 wls<9> Inv8
xi64 net910 wln<9> Inv8
xi66 net909 wls<8> Inv8
xi68 net908 wln<16> Inv8
xi70 net892 wls<24> Inv8
xi72 net906 wln<25> Inv8
xi74 net905 wls<25> Inv8
xi76 net904 wln<26> Inv8
xi78 net903 wls<27> Inv8
xi80 net902 wln<27> Inv8
xi82 net901 wls<26> Inv8
xi84 net900 wln<28> Inv8
xi86 net897 wls<30> Inv8
xi88 net899 wln<31> Inv8
xi90 net898 wls<31> Inv8
xi92 net896 wln<30> Inv8
xi94 net895 wls<29> Inv8
xi96 net894 wln<29> Inv8
xi98 net893 wls<28> Inv8
xi100 net891 wln<24> Inv8
xi102 net890 wls<20> Inv8
xi104 net889 wln<21> Inv8
xi106 net888 wls<21> Inv8
xi108 net887 wln<22> Inv8
xi110 net988 wls<23> Inv8
xi112 net987 wln<23> Inv8
xi114 net986 wls<22> Inv8
xi116 net985 wln<20> Inv8
xi118 net982 wls<18> Inv8
xi120 net984 wln<19> Inv8
xi122 net983 wls<19> Inv8
xi124 net981 wln<18> Inv8
xi126 net980 wls<17> Inv8
xi128 net979 wln<17> Inv8
xi130 net907 wls<16> Inv8
xi131 net948 wls<32> Inv8
xi133 net978 wln<33> Inv8
xi135 net977 wls<33> Inv8
xi137 net976 wln<34> Inv8
xi139 net975 wls<35> Inv8
xi141 net974 wln<35> Inv8
xi143 net973 wls<34> Inv8
xi145 net972 wln<36> Inv8
xi147 net969 wls<38> Inv8
xi149 net971 wln<39> Inv8
xi151 net970 wls<39> Inv8
xi153 net968 wln<38> Inv8
xi155 net967 wls<37> Inv8
xi157 net966 wln<37> Inv8
xi159 net965 wls<36> Inv8
xi161 net964 wln<40> Inv8
xi163 net957 wls<44> Inv8
xi165 net963 wln<45> Inv8
xi167 net962 wls<45> Inv8
xi169 net961 wln<46> Inv8
xi171 net960 wls<47> Inv8
xi173 net959 wln<47> Inv8
xi175 net958 wls<46> Inv8
xi177 net956 wln<44> Inv8
xi179 net953 wls<42> Inv8
xi181 net955 wln<43> Inv8
xi183 net954 wls<43> Inv8
xi185 net952 wln<42> Inv8
xi187 net951 wls<41> Inv8
xi189 net950 wln<41> Inv8
xi191 net949 wls<40> Inv8
xi193 net947 wln<32> Inv8
xi196 net946 wln<48> Inv8
xi198 net945 wls<95> Inv8
xi200 net944 wln<95> Inv8
xi201 net943 wls<94> Inv8
xi203 net942 wln<94> Inv8
xi205 net941 wls<93> Inv8
xi207 net940 wln<93> Inv8
xi210 net939 wls<92> Inv8
xi212 net1039 wln<92> Inv8
xi213 net1038 wls<91> Inv8
xi215 net1037 wln<91> Inv8
xi218 net1036 wls<90> Inv8
xi220 net1035 wln<90> Inv8
xi222 net1034 wls<89> Inv8
xi224 net1033 wln<89> Inv8
xi225 net1032 wls<88> Inv8
xi227 net1031 wln<88> Inv8
xi229 net1030 wls<87> Inv8
xi231 net1029 wln<87> Inv8
xi234 net1028 wls<86> Inv8
xi236 net1027 wln<86> Inv8
xi238 net1026 wls<85> Inv8
xi240 net1025 wln<85> Inv8
xi241 net1024 wls<84> Inv8
xi243 net1023 wln<84> Inv8
xi246 net1022 wls<83> Inv8
xi248 net1021 wln<83> Inv8
xi249 net1020 wls<82> Inv8
xi251 net1019 wln<82> Inv8
xi253 net1018 wls<81> Inv8
xi255 net1017 wln<81> Inv8
xi257 net1016 wls<80> Inv8
xi260 net1015 wln<80> Inv8
xi261 net1014 wls<79> Inv8
xi263 net1013 wln<79> Inv8
xi266 net1012 wls<78> Inv8
xi268 net1011 wln<78> Inv8
xi270 net1010 wls<77> Inv8
xi272 net1009 wln<77> Inv8
xi273 net1008 wls<76> Inv8
xi275 net1007 wln<76> Inv8
xi278 net1006 wls<75> Inv8
xi280 net1005 wln<75> Inv8
xi281 net1004 wls<74> Inv8
xi283 net1003 wln<74> Inv8
xi285 net1002 wls<73> Inv8
xi287 net1001 wln<73> Inv8
xi290 net1000 wls<72> Inv8
xi292 net999 wln<72> Inv8
xi294 net998 wls<71> Inv8
xi296 net997 wln<71> Inv8
xi297 net996 wls<70> Inv8
xi299 net995 wln<70> Inv8
xi301 net994 wls<69> Inv8
xi303 net993 wln<69> Inv8
xi306 net992 wls<68> Inv8
xi308 net991 wln<68> Inv8
xi309 net990 wls<67> Inv8
xi311 net989 wln<67> Inv8
xi314 net1090 wls<66> Inv8
xi316 net1089 wln<66> Inv8
xi318 net1088 wls<65> Inv8
xi320 net1087 wln<65> Inv8
xi321 net1086 wls<64> Inv8
xi323 net1085 wln<64> Inv8
xi326 net1084 wls<63> Inv8
xi328 net1083 wln<63> Inv8
xi329 net1082 wls<62> Inv8
xi331 net1081 wln<62> Inv8
xi333 net1080 wls<61> Inv8
xi335 net1079 wln<61> Inv8
xi338 net1078 wls<60> Inv8
xi340 net1077 wln<60> Inv8
xi341 net1076 wls<59> Inv8
xi343 net1075 wln<59> Inv8
xi346 net1074 wls<58> Inv8
xi348 net1073 wln<58> Inv8
xi350 net1072 wls<57> Inv8
xi352 net1071 wln<57> Inv8
xi353 net1070 wls<56> Inv8
xi355 net1069 wln<56> Inv8
xi357 net1068 wls<55> Inv8
xi359 net1067 wln<55> Inv8
xi362 net1066 wls<54> Inv8
xi364 net1065 wln<54> Inv8
xi366 net1064 wls<53> Inv8
xi368 net1063 wln<53> Inv8
xi369 net1062 wls<52> Inv8
xi371 net1061 wln<52> Inv8
xi374 net1060 wls<51> Inv8
xi376 net1059 wln<51> Inv8
xi377 net1058 wls<50> Inv8
xi379 net1057 wln<50> Inv8
xi381 net1056 wls<49> Inv8
xi383 net1055 wln<49> Inv8
xi386 net1054 wls<48> Inv8
xi387 net1053 wls<96> Inv8
xi390 net1052 wln<97> Inv8
xi392 net1051 wls<97> Inv8
xi394 net1050 wln<98> Inv8
xi396 net1049 wls<98> Inv8
xi397 net1048 wln<99> Inv8
xi399 net1047 wls<99> Inv8
xi402 net1046 wln<100> Inv8
xi404 net1045 wls<100> Inv8
xi405 net1044 wln<101> Inv8
xi407 net1043 wls<101> Inv8
xi409 net1042 wln<102> Inv8
xi411 net1041 wls<102> Inv8
xi414 net1040 wln<103> Inv8
xi416 net1139 wls<103> Inv8
xi418 net1138 wln<104> Inv8
xi420 net1137 wls<104> Inv8
xi421 net1136 wln<105> Inv8
xi423 net1135 wls<105> Inv8
xi425 net1134 wln<106> Inv8
xi427 net1133 wls<106> Inv8
xi430 net1132 wln<107> Inv8
xi432 net1131 wls<107> Inv8
xi433 net1130 wln<108> Inv8
xi435 net1129 wls<108> Inv8
xi438 net1128 wln<109> Inv8
xi440 net1127 wls<109> Inv8
xi442 net1126 wln<110> Inv8
xi444 net1125 wls<110> Inv8
xi445 net1124 wln<111> Inv8
xi447 net1123 wls<111> Inv8
xi450 net1122 wln<112> Inv8
xi452 net1121 wls<112> Inv8
xi453 net1120 wln<113> Inv8
xi455 net1119 wls<113> Inv8
xi457 net1118 wln<114> Inv8
xi459 net1117 wls<114> Inv8
xi462 net1116 wln<115> Inv8
xi464 net1115 wls<115> Inv8
xi465 net1114 wln<116> Inv8
xi467 net1113 wls<116> Inv8
xi470 net1112 wln<117> Inv8
xi472 net1111 wls<117> Inv8
xi474 net1110 wln<118> Inv8
xi476 net1109 wls<118> Inv8
xi477 net1108 wln<119> Inv8
xi479 net1107 wls<119> Inv8
xi481 net1106 wln<120> Inv8
xi483 net1105 wls<120> Inv8
xi486 net1104 wln<121> Inv8
xi488 net1103 wls<121> Inv8
xi490 net1102 wln<122> Inv8
xi492 net1101 wls<122> Inv8
xi493 net1100 wln<123> Inv8
xi495 net1099 wls<123> Inv8
xi498 net1098 wln<124> Inv8
xi500 net1097 wls<124> Inv8
xi501 net1096 wln<125> Inv8
xi503 net1095 wls<125> Inv8
xi505 net1094 wln<126> Inv8
xi507 net1093 wls<126> Inv8
xi510 net1092 wln<127> Inv8
xi512 net1091 wls<127> Inv8
xi513 net1140 wln<128> Inv8
.END

