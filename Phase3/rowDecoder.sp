** Generated for: hspiceD
** Generated on: Dec  7 20:15:50 2025
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
** Cell name: inv4
** View name: schematic
.subckt inv4 a zn
xm0 zn a vss! vss! nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm1 zn a vdd! vdd! pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
.ends inv4
** End of subcircuit definition.

** Library name: NandiniSRAM
** Cell name: and3_inv8
** View name: schematic
.subckt and3_inv8 a1 a2 a3 zn
xi2 a zn inv4
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
.subckt subblock2_schematic ga3 ga4 ga5 pd1_0 pd1_1 pd1_2 pd1_3 pd1_4 pd1_5 pd1_6 pd1_7
xi54 a5b a5 inverter_schematic
xi53 a4b a4 inverter_schematic
xi52 a3b a3 inverter_schematic
xi33 ga5 a5b inverter_schematic
xi34 ga4 a4b inverter_schematic
xi35 ga3 a3b inverter_schematic
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
xi5 net4 zn inv4
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
.subckt subblock1_schematic ga0 ga1 ga2 gclk pd0_0 pd0_1 pd0_2 pd0_3 pd0_4 pd0_5 pd0_6 pd0_7
xi26 a0 a1b a2b clk pd0_6 and4_schematic
xi25 a0b a1b a2b clk pd0_7 and4_schematic
xi31 a0b a1 a2 clk pd0_1 and4_schematic
xi32 a0 a1 a2 clk pd0_0 and4_schematic
xi29 a0b a1b a2 clk pd0_3 and4_schematic
xi30 a0 a1b a2 clk pd0_2 and4_schematic
xi28 a0 a1 a2b clk pd0_4 and4_schematic
xi27 a0b a1 a2b clk pd0_5 and4_schematic
xi37 net2 clk inverter_schematic
xi36 a0b a0 inverter_schematic
xi35 a1b a1 inverter_schematic
xi34 a2b a2 inverter_schematic
xi33 gclk net2 inverter_schematic
xi23 ga1 a1b inverter_schematic
xi22 ga2 a2b inverter_schematic
xi24 ga0 a0b inverter_schematic
.ends subblock1_schematic
** End of subcircuit definition.

** Library name: NandiniSRAM
** Cell name: subblock3
** View name: schematic
.subckt subblock3_schematic ga6 ga7 ga8 pd2_0 pd2_1 pd2_2 pd2_3 pd2_4 pd2_5 pd2_6 pd2_7
xi12 a8b a7b a6 pd2_6 and3_inv8
xi11 a8b a7b a6b pd2_7 and3_inv8
xi13 a8b a7 a6b pd2_5 and3_inv8
xi14 a8b a7 a6 pd2_4 and3_inv8
xi15 a8 a7b a6b pd2_3 and3_inv8
xi16 a8 a7b a6 pd2_2 and3_inv8
xi17 a8 a7 a6b pd2_1 and3_inv8
xi18 a8 a7 a6 pd2_0 and3_inv8
xi21 a6b a6 inverter_schematic
xi8 ga8 a8b inverter_schematic
xi9 ga7 a7b inverter_schematic
xi20 a7b a7 inverter_schematic
xi19 a8b a8 inverter_schematic
xi10 ga6 a6b inverter_schematic
.ends subblock3_schematic
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
xi6 a zn inverter_schematic
.ends and3_schematic
** End of subcircuit definition.

** Library name: NandiniSRAM
** Cell name: Inv16
** View name: schematic
.subckt Inv16 a zn
xm0 zn a vss! vss! nch_svt_mac l=16e-9 nfin=16 w=730e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm1 zn a vdd! vdd! pch_svt_mac l=16e-9 nfin=16 w=730e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
.ends Inv16
** End of subcircuit definition.

** Library name: NandiniSRAM
** Cell name: rowDecoder512
** View name: schematic
xi2116 ga3 ga4 ga5 net15 net14 net13 net16 net8 net2 net17 net18 subblock2_schematic
xi2115 ga0 ga1 ga2 gclk net7 net6 net5 net4 net3 net11 net10 net9 subblock1_schematic
xi2117 ga6 ga7 ga8 net19 net20 net21 net22 net23 net1 net12 net24 subblock3_schematic
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
xi3091 net502 net761 inv4
xi3087 net506 net787 inv4
xi3083 net510 net781 inv4
xi3079 net514 net773 inv4
xi3075 net518 net779 inv4
xi3071 net522 net763 inv4
xi3067 net526 net769 inv4
xi3063 net530 net771 inv4
xi3059 net534 net791 inv4
xi3055 net494 net990 inv4
xi3051 net490 net988 inv4
xi3047 net486 net835 inv4
xi3043 net482 net833 inv4
xi3039 net478 net816 inv4
xi3035 net474 net814 inv4
xi3031 net470 net1003 inv4
xi3027 net466 net1005 inv4
xi3023 net462 net827 inv4
xi2691 net344 net700 inv4
xi2687 net340 net699 inv4
xi2683 net336 net1086 inv4
xi2679 net332 net561 inv4
xi2675 net328 net558 inv4
xi2671 net324 net1088 inv4
xi2667 net320 net1090 inv4
xi2663 net316 net556 inv4
xi2659 net312 net1082 inv4
xi2655 net308 net565 inv4
xi2651 net304 net563 inv4
xi2647 net300 net1084 inv4
xi2411 net192 net1058 inv4
xi2407 net188 net633 inv4
xi2403 net184 net1050 inv4
xi2399 net180 net651 inv4
xi2395 net176 net647 inv4
xi2391 net172 net1052 inv4
xi2387 net168 net655 inv4
xi2383 net164 net1048 inv4
xi2379 net160 net1046 inv4
xi2375 net156 net659 inv4
xi2371 net89 net953 inv4
xi2367 net93 net956 inv4
xi2363 net97 net960 inv4
xi2359 net101 net957 inv4
xi2355 net105 net968 inv4
xi2351 net109 net965 inv4
xi2347 net113 net961 inv4
xi2343 net117 net964 inv4
xi2339 net121 net924 inv4
xi2335 net125 net978 inv4
xi2331 net129 net974 inv4
xi2327 net133 net977 inv4
xi2323 net137 net969 inv4
xi2319 net141 net972 inv4
xi2119 net26 net538 inv4
xi3090 net503 net758 inv4
xi3086 net507 net762 inv4
xi3082 net511 net784 inv4
xi3078 net515 net780 inv4
xi3074 net519 net776 inv4
xi3070 net523 net772 inv4
xi3066 net527 net766 inv4
xi3062 net531 net770 inv4
xi3058 net535 net789 inv4
xi3054 net493 net991 inv4
xi3050 net489 net986 inv4
xi3046 net485 net836 inv4
xi3042 net481 net832 inv4
xi3038 net477 net817 inv4
xi2648 net301 net1083 inv4
xi2644 net297 net562 inv4
xi2408 net189 net635 inv4
xi2404 net185 net1059 inv4
xi2400 net181 net649 inv4
xi2396 net177 net1049 inv4
xi2392 net173 net1051 inv4
xi2388 net169 net645 inv4
xi2384 net165 net1047 inv4
xi2380 net161 net653 inv4
xi2376 net157 net657 inv4
xi2372 net153 net1045 inv4
xi2368 net92 net954 inv4
xi2364 net96 net955 inv4
xi2360 net100 net959 inv4
xi2356 net104 net958 inv4
xi2352 net108 net967 inv4
xi2348 net112 net966 inv4
xi2344 net116 net962 inv4
xi2340 net120 net963 inv4
xi2336 net124 net923 inv4
xi2332 net128 net922 inv4
xi2328 net132 net975 inv4
xi2324 net136 net976 inv4
xi2320 net140 net970 inv4
xi2652 net305 net1081 inv4
xi2656 net309 net564 inv4
xi2660 net313 net1091 inv4
xi2664 net317 net557 inv4
xi2668 net321 net559 inv4
xi2672 net325 net1089 inv4
xi2676 net329 net1085 inv4
xi2680 net333 net560 inv4
xi2684 net337 net1087 inv4
xi2688 net341 net1093 inv4
xi3022 net461 net828 inv4
xi3026 net465 net1006 inv4
xi3030 net469 net1002 inv4
xi3034 net473 net813 inv4
xi2219 net77 net918 inv4
xi2220 net82 net720 inv4
xi2123 net28 net537 inv4
xi2221 net85 net917 inv4
xi2222 net87 net723 inv4
xi2223 net88 net916 inv4
xi2224 net86 net722 inv4
xi2225 net84 net915 inv4
xi2128 net30 net703 inv4
xi2226 net83 net725 inv4
xi2129 net32 net842 inv4
xi2130 net31 net704 inv4
xi2227 net81 net914 inv4
xi2131 net29 net841 inv4
xi2228 net74 net724 inv4
xi2229 net65 net913 inv4
xi2230 net67 net727 inv4
xi2231 net68 net912 inv4
xi2232 net70 net726 inv4
xi2233 net72 net911 inv4
xi2234 net71 net729 inv4
xi2235 net69 net910 inv4
xi2236 net66 net728 inv4
xi2237 net61 net909 inv4
xi2140 net34 net705 inv4
xi2238 net63 net731 inv4
xi2141 net37 net840 inv4
xi2239 net64 net908 inv4
xi2142 net39 net707 inv4
xi2240 net62 net730 inv4
xi2143 net40 net839 inv4
xi2144 net38 net706 inv4
xi2241 net60 net907 inv4
xi2145 net36 net838 inv4
xi2242 net59 net732 inv4
xi2243 net57 net906 inv4
xi2146 net35 net708 inv4
xi2147 net33 net837 inv4
xi2164 net42 net709 inv4
xi2165 net49 net905 inv4
xi2166 net51 net711 inv4
xi2167 net52 net903 inv4
xi2168 net54 net710 inv4
xi2169 net56 net902 inv4
xi2170 net55 net713 inv4
xi2171 net53 net901 inv4
xi2172 net50 net712 inv4
xi2173 net45 net900 inv4
xi2174 net47 net715 inv4
xi2175 net48 net899 inv4
xi2176 net46 net714 inv4
xi2177 net44 net898 inv4
xi2178 net43 net716 inv4
xi2179 net41 net897 inv4
xi2589 net255 net1064 inv4
xi2588 net256 net601 inv4
xi2587 net257 net591 inv4
xi2586 net258 net598 inv4
xi2585 net259 net1066 inv4
xi2584 net260 net593 inv4
xi2583 net261 net597 inv4
xi2582 net262 net596 inv4
xi2581 net263 net1065 inv4
xi2580 net264 net595 inv4
xi2579 net265 net581 inv4
xi2578 net266 net594 inv4
xi2577 net267 net590 inv4
xi2576 net268 net583 inv4
xi2575 net269 net587 inv4
xi2574 net270 net1068 inv4
xi2573 net271 net592 inv4
xi2572 net272 net585 inv4
xi2571 net273 net589 inv4
xi2570 net274 net1067 inv4
xi2569 net275 net606 inv4
xi2568 net276 net1062 inv4
xi2567 net277 net548 inv4
xi2566 net278 net608 inv4
xi2565 net279 net607 inv4
xi2564 net280 net605 inv4
xi2435 net216 net981 inv4
xi2434 net215 net1060 inv4
xi2433 net214 net619 inv4
xi2432 net213 net1061 inv4
xi2431 net212 net980 inv4
xi2430 net211 net979 inv4
xi2429 net210 net933 inv4
xi2428 net209 net1055 inv4
xi2427 net208 net1054 inv4
xi2426 net207 net934 inv4
xi2425 net206 net935 inv4
xi2424 net205 net641 inv4
xi2423 net204 net643 inv4
xi2422 net203 net936 inv4
xi2421 net202 net932 inv4
xi2420 net201 net1053 inv4
xi2419 net200 net637 inv4
xi2418 net199 net929 inv4
xi2417 net198 net930 inv4
xi2416 net197 net1057 inv4
xi2415 net196 net1056 inv4
xi2414 net195 net931 inv4
xi2413 net194 net928 inv4
xi2412 net193 net639 inv4
xi2218 net79 net721 inv4
xi2315 net145 net973 inv4
xi2314 net146 net744 inv4
xi2217 net80 net919 inv4
xi2216 net78 net718 inv4
xi2313 net147 net734 inv4
xi2215 net76 net920 inv4
xi2312 net148 net733 inv4
xi2214 net75 net719 inv4
xi2311 net149 net927 inv4
xi2213 net73 net921 inv4
xi2310 net150 net926 inv4
xi2212 net58 net717 inv4
xi2309 net151 net925 inv4
xi2308 net152 net735 inv4
xi2590 net254 net600 inv4
xi2918 net417 net1007 inv4
xi2591 net253 net599 inv4
xi2592 net252 net603 inv4
xi2593 net251 net1063 inv4
xi2594 net250 net1069 inv4
xi2595 net249 net604 inv4
xi2596 net248 net569 inv4
xi2597 net247 net584 inv4
xi2598 net246 net1072 inv4
xi2599 net245 net571 inv4
xi2600 net244 net567 inv4
xi2601 net243 net582 inv4
xi2602 net242 net1071 inv4
xi2603 net241 net664 inv4
xi2604 net240 net575 inv4
xi2605 net239 net586 inv4
xi2606 net238 net1070 inv4
xi2607 net237 net573 inv4
xi2608 net236 net577 inv4
xi2609 net235 net588 inv4
xi2610 net234 net1073 inv4
xi2611 net233 net579 inv4
xi2612 net232 net658 inv4
xi2613 net231 net578 inv4
xi2614 net230 net1074 inv4
xi2615 net229 net656 inv4
xi2616 net228 net660 inv4
xi2617 net227 net580 inv4
xi2618 net226 net1075 inv4
xi2619 net225 net662 inv4
xi2620 net224 net652 inv4
xi2621 net223 net576 inv4
xi2622 net222 net1076 inv4
xi2623 net221 net654 inv4
xi2624 net220 net650 inv4
xi2625 net219 net574 inv4
xi2626 net218 net602 inv4
xi2627 net217 net648 inv4
xi2628 net281 net1077 inv4
xi2629 net282 net689 inv4
xi2630 net283 net646 inv4
xi2631 net284 net572 inv4
xi2632 net285 net570 inv4
xi2633 net286 net644 inv4
xi2634 net287 net642 inv4
xi2635 net288 net1078 inv4
xi2636 net289 net566 inv4
xi2637 net290 net640 inv4
xi2638 net291 net634 inv4
xi2639 net292 net1080 inv4
xi2640 net293 net1079 inv4
xi2641 net294 net636 inv4
xi2642 net295 net638 inv4
xi2643 net296 net568 inv4
xi2876 net352 net797 inv4
xi2877 net351 net798 inv4
xi2878 net350 net796 inv4
xi2879 net349 net799 inv4
xi2880 net348 net795 inv4
xi2881 net347 net794 inv4
xi2882 net346 net893 inv4
xi2883 net345 net793 inv4
xi2884 net451 net1038 inv4
xi2885 net450 net1037 inv4
xi2886 net449 net1039 inv4
xi2887 net448 net1041 inv4
xi2888 net447 net1040 inv4
xi2889 net446 net1042 inv4
xi2890 net445 net1019 inv4
xi2891 net444 net1020 inv4
xi2892 net443 net1016 inv4
xi2893 net442 net1017 inv4
xi2894 net441 net1015 inv4
xi2895 net440 net1018 inv4
xi2896 net439 net1014 inv4
xi2897 net438 net1013 inv4
xi2898 net437 net1021 inv4
xi2899 net436 net1012 inv4
xi2900 net435 net1026 inv4
xi2901 net434 net1027 inv4
xi2902 net433 net1025 inv4
xi2903 net432 net1028 inv4
xi2904 net431 net1024 inv4
xi2905 net430 net1023 inv4
xi2906 net429 net1029 inv4
xi2907 net428 net1022 inv4
xi2908 net427 net1032 inv4
xi2909 net426 net1031 inv4
xi2910 net425 net1033 inv4
xi2911 net424 net1030 inv4
xi2912 net423 net1034 inv4
xi2913 net422 net1035 inv4
xi2914 net421 net1011 inv4
xi2915 net420 net1036 inv4
xi2916 net419 net1008 inv4
xi2917 net418 net1009 inv4
xi3129 net495 net801 inv4
xi3128 net501 net805 inv4
xi2875 net353 net849 inv4
xi2874 net354 net800 inv4
xi2873 net355 net848 inv4
xi2872 net356 net847 inv4
xi2871 net357 net843 inv4
xi2870 net358 net846 inv4
xi2869 net359 net844 inv4
xi2868 net360 net845 inv4
xi2983 net458 net823 inv4
xi2867 net361 net865 inv4
xi2866 net362 net850 inv4
xi2982 net452 net819 inv4
xi2865 net363 net864 inv4
xi2981 net453 net821 inv4
xi2980 net454 net820 inv4
xi2864 net364 net863 inv4
xi2979 net455 net825 inv4
xi2863 net365 net859 inv4
xi2978 net456 net822 inv4
xi2862 net366 net862 inv4
xi2977 net457 net824 inv4
xi2861 net367 net860 inv4
xi2860 net368 net861 inv4
xi2859 net369 net851 inv4
xi2858 net370 net858 inv4
xi2857 net371 net852 inv4
xi2856 net372 net853 inv4
xi2855 net373 net857 inv4
xi2854 net374 net854 inv4
xi2853 net375 net856 inv4
xi2852 net376 net855 inv4
xi2851 net377 net892 inv4
xi2850 net378 net866 inv4
xi2849 net379 net891 inv4
xi2848 net380 net890 inv4
xi2847 net381 net885 inv4
xi2846 net382 net889 inv4
xi2962 net414 net998 inv4
xi2845 net383 net887 inv4
xi2961 net413 net996 inv4
xi2960 net412 net999 inv4
xi2844 net384 net888 inv4
xi2959 net411 net994 inv4
xi2843 net385 net877 inv4
xi2842 net386 net884 inv4
xi2958 net410 net995 inv4
xi2841 net387 net878 inv4
xi2957 net409 net993 inv4
xi2956 net415 net997 inv4
xi2840 net388 net879 inv4
xi2839 net389 net883 inv4
xi2838 net390 net880 inv4
xi2837 net391 net882 inv4
xi2836 net392 net881 inv4
xi2835 net393 net867 inv4
xi2834 net394 net876 inv4
xi2833 net395 net868 inv4
xi2832 net396 net869 inv4
xi2831 net397 net873 inv4
xi2830 net398 net870 inv4
xi2829 net399 net872 inv4
xi2828 net400 net871 inv4
xi2827 net401 net875 inv4
xi2826 net402 net874 inv4
xi2825 net403 net1111 inv4
xi2824 net404 net904 inv4
xi2823 net405 net609 inv4
xi2822 net406 net896 inv4
xi2821 net407 net894 inv4
xi2820 net408 net895 inv4
xi2919 net416 net1010 inv4
xi3130 net496 net803 inv4
xi3131 net497 net802 inv4
xi3132 net498 net807 inv4
xi3133 net499 net804 inv4
xi3134 net500 net806 inv4
xi3089 net504 net760 inv4
xi3085 net508 net786 inv4
xi3081 net512 net782 inv4
xi3077 net516 net774 inv4
xi3073 net520 net778 inv4
xi3069 net524 net764 inv4
xi3065 net528 net768 inv4
xi3061 net532 net792 inv4
xi3057 net536 net788 inv4
xi3053 net492 net989 inv4
xi3049 net488 net809 inv4
xi3045 net484 net834 inv4
xi3041 net480 net811 inv4
xi3037 net476 net815 inv4
xi3033 net472 net1000 inv4
xi3029 net468 net1004 inv4
xi3025 net464 net830 inv4
xi3021 net460 net826 inv4
xi2689 net342 net555 inv4
xi2685 net338 net620 inv4
xi2681 net334 net622 inv4
xi2677 net330 net697 inv4
xi2673 net326 net695 inv4
xi2669 net322 net693 inv4
xi2665 net318 net691 inv4
xi2661 net314 net624 inv4
xi2657 net310 net630 inv4
xi2653 net306 net628 inv4
xi2649 net302 net626 inv4
xi2645 net298 net632 inv4
xi2409 net190 net984 inv4
xi2405 net186 net937 inv4
xi2401 net182 net943 inv4
xi2397 net178 net941 inv4
xi2393 net174 net939 inv4
xi2389 net170 net945 inv4
xi2385 net166 net947 inv4
xi2381 net162 net949 inv4
xi2377 net158 net951 inv4
xi2373 net154 net982 inv4
xi2369 net91 net661 inv4
xi2365 net95 net663 inv4
xi2361 net99 net757 inv4
xi2357 net103 net665 inv4
xi2353 net107 net751 inv4
xi2349 net111 net753 inv4
xi2345 net115 net702 inv4
xi2341 net119 net755 inv4
xi2337 net123 net736 inv4
xi2333 net127 net738 inv4
xi2329 net131 net742 inv4
xi2325 net135 net740 inv4
xi2321 net139 net749 inv4
xi2317 net143 net747 inv4
xi3088 net505 net759 inv4
xi3084 net509 net785 inv4
xi3080 net513 net783 inv4
xi3076 net517 net775 inv4
xi3072 net521 net777 inv4
xi3068 net525 net765 inv4
xi3064 net529 net767 inv4
xi3060 net533 net790 inv4
xi3052 net491 net987 inv4
xi3048 net487 net810 inv4
xi3044 net483 net808 inv4
xi3040 net479 net831 inv4
xi3036 net475 net818 inv4
xi3032 net471 net812 inv4
xi3028 net467 net1001 inv4
xi3024 net463 net992 inv4
xi3020 net459 net829 inv4
xi2690 net343 net1092 inv4
xi2686 net339 net698 inv4
xi2682 net335 net621 inv4
xi2678 net331 net623 inv4
xi2674 net327 net694 inv4
xi2670 net323 net696 inv4
xi2666 net319 net692 inv4
xi2662 net315 net690 inv4
xi2658 net311 net629 inv4
xi2654 net307 net631 inv4
xi2650 net303 net627 inv4
xi2646 net299 net625 inv4
xi2410 net191 net985 inv4
xi2406 net187 net983 inv4
xi2402 net183 net942 inv4
xi2398 net179 net944 inv4
xi2394 net175 net940 inv4
xi2390 net171 net938 inv4
xi2386 net167 net948 inv4
xi2382 net163 net946 inv4
xi2378 net159 net950 inv4
xi2374 net155 net952 inv4
xi2370 net90 net737 inv4
xi2366 net94 net1044 inv4
xi2362 net98 net1043 inv4
xi2358 net102 net756 inv4
xi2354 net106 net701 inv4
xi2350 net110 net750 inv4
xi2346 net114 net752 inv4
xi2326 net134 net743 inv4
xi2322 net138 net745 inv4
xi2318 net142 net746 inv4
xi2316 net144 net971 inv4
xi2342 net118 net754 inv4
xi2338 net122 net748 inv4
xi2334 net126 net739 inv4
xi2330 net130 net741 inv4
xi3 net25 net886 inv4
xi2120 net27 net539 inv4
xi2118 net538 wl<1> Inv16
xi3107 net763 wl<497> Inv16
xi3103 net769 wl<501> Inv16
xi3099 net771 wl<505> Inv16
xi3095 net791 wl<509> Inv16
xi3019 net990 wl<469> Inv16
xi3015 net988 wl<465> Inv16
xi3011 net835 wl<461> Inv16
xi3007 net833 wl<457> Inv16
xi3003 net816 wl<453> Inv16
xi2999 net814 wl<449> Inv16
xi2995 net1003 wl<445> Inv16
xi2759 net888 wl<359> Inv16
xi2755 net646 wl<258> Inv16
xi2751 net559 wl<296> Inv16
xi2747 net1089 wl<300> Inv16
xi2743 net1085 wl<304> Inv16
xi2739 net560 wl<308> Inv16
xi2735 net1087 wl<312> Inv16
xi2731 net1093 wl<316> Inv16
xi2727 net557 wl<292> Inv16
xi2723 net1091 wl<288> Inv16
xi2719 net564 wl<284> Inv16
xi2715 net1081 wl<280> Inv16
xi2711 net1083 wl<276> Inv16
xi2707 net562 wl<272> Inv16
xi2703 net1079 wl<268> Inv16
xi2699 net566 wl<264> Inv16
xi2695 net570 wl<260> Inv16
xi3106 net772 wl<498> Inv16
xi3102 net766 wl<502> Inv16
xi3098 net770 wl<506> Inv16
xi3094 net789 wl<510> Inv16
xi2185 net730 wl<37> Inv16
xi2282 net702 wl<90> Inv16
xi3010 net836 wl<460> Inv16
xi2692 net689 wl<257> Inv16
xi2696 net644 wl<261> Inv16
xi2700 net640 wl<265> Inv16
xi2704 net636 wl<269> Inv16
xi2708 net632 wl<273> Inv16
xi2712 net626 wl<277> Inv16
xi2716 net628 wl<281> Inv16
xi2720 net630 wl<285> Inv16
xi2724 net624 wl<289> Inv16
xi2728 net700 wl<319> Inv16
xi2732 net699 wl<315> Inv16
xi2736 net1086 wl<311> Inv16
xi2740 net561 wl<307> Inv16
xi2744 net558 wl<303> Inv16
xi2748 net1088 wl<299> Inv16
xi2752 net1090 wl<295> Inv16
xi2756 net794 wl<322> Inv16
xi2992 net1001 wl<442> Inv16
xi2996 net812 wl<446> Inv16
xi3000 net818 wl<450> Inv16
xi3004 net831 wl<454> Inv16
xi3008 net808 wl<458> Inv16
xi3014 net986 wl<464> Inv16
xi3018 net991 wl<468> Inv16
xi2122 net537 wl<3> Inv16
xi2124 net841 wl<4> Inv16
xi2125 net703 wl<5> Inv16
xi2126 net704 wl<6> Inv16
xi2127 net842 wl<7> Inv16
xi2132 net837 wl<8> Inv16
xi2133 net705 wl<9> Inv16
xi2134 net708 wl<10> Inv16
xi2135 net838 wl<11> Inv16
xi2136 net840 wl<12> Inv16
xi2137 net706 wl<13> Inv16
xi2138 net707 wl<14> Inv16
xi2139 net839 wl<15> Inv16
xi2244 net661 wl<66> Inv16
xi2148 net897 wl<16> Inv16
xi2245 net953 wl<64> Inv16
xi2149 net709 wl<17> Inv16
xi2246 net738 wl<102> Inv16
xi2150 net716 wl<18> Inv16
xi2247 net922 wl<103> Inv16
xi2151 net898 wl<19> Inv16
xi2248 net974 wl<104> Inv16
xi2249 net741 wl<105> Inv16
xi2152 net900 wl<20> Inv16
xi2250 net742 wl<106> Inv16
xi2153 net714 wl<21> Inv16
xi2154 net715 wl<22> Inv16
xi2251 net975 wl<107> Inv16
xi2155 net899 wl<23> Inv16
xi2252 net977 wl<108> Inv16
xi2253 net743 wl<109> Inv16
xi2156 net905 wl<24> Inv16
xi2254 net740 wl<110> Inv16
xi2157 net712 wl<25> Inv16
xi2255 net976 wl<111> Inv16
xi2158 net711 wl<26> Inv16
xi2256 net969 wl<112> Inv16
xi2159 net903 wl<27> Inv16
xi2160 net901 wl<28> Inv16
xi2257 net745 wl<113> Inv16
xi2161 net710 wl<29> Inv16
xi2258 net749 wl<114> Inv16
xi2259 net970 wl<115> Inv16
xi2162 net713 wl<30> Inv16
xi2260 net972 wl<116> Inv16
xi2163 net902 wl<31> Inv16
xi2261 net746 wl<117> Inv16
xi2262 net747 wl<118> Inv16
xi2263 net971 wl<119> Inv16
xi2264 net973 wl<120> Inv16
xi2265 net744 wl<121> Inv16
xi2266 net734 wl<122> Inv16
xi2267 net733 wl<123> Inv16
xi2268 net927 wl<124> Inv16
xi2269 net926 wl<125> Inv16
xi2270 net925 wl<126> Inv16
xi2271 net735 wl<127> Inv16
xi2272 net978 wl<100> Inv16
xi2273 net923 wl<99> Inv16
xi2274 net736 wl<98> Inv16
xi2275 net748 wl<97> Inv16
xi2276 net924 wl<96> Inv16
xi2277 net963 wl<95> Inv16
xi2180 net906 wl<32> Inv16
xi2278 net755 wl<94> Inv16
xi2181 net717 wl<33> Inv16
xi2279 net754 wl<93> Inv16
xi2182 net732 wl<34> Inv16
xi2280 net964 wl<92> Inv16
xi2183 net907 wl<35> Inv16
xi2184 net909 wl<36> Inv16
xi2281 net962 wl<91> Inv16
xi2473 net1060 wl<190> Inv16
xi2472 net981 wl<191> Inv16
xi2471 net635 wl<164> Inv16
xi2470 net633 wl<163> Inv16
xi2469 net983 wl<162> Inv16
xi2468 net937 wl<161> Inv16
xi2467 net1059 wl<160> Inv16
xi2466 net1050 wl<159> Inv16
xi2465 net942 wl<158> Inv16
xi2464 net943 wl<157> Inv16
xi2463 net649 wl<156> Inv16
xi2462 net651 wl<155> Inv16
xi2461 net944 wl<154> Inv16
xi2460 net941 wl<153> Inv16
xi2459 net1049 wl<152> Inv16
xi2458 net647 wl<151> Inv16
xi2457 net940 wl<150> Inv16
xi2456 net939 wl<149> Inv16
xi2455 net1051 wl<148> Inv16
xi2454 net1052 wl<147> Inv16
xi2453 net938 wl<146> Inv16
xi2452 net945 wl<145> Inv16
xi2451 net645 wl<144> Inv16
xi2450 net655 wl<143> Inv16
xi2449 net948 wl<142> Inv16
xi2448 net947 wl<141> Inv16
xi2447 net1047 wl<140> Inv16
xi2563 net602 wl<193> Inv16
xi2446 net1048 wl<139> Inv16
xi2562 net600 wl<229> Inv16
xi2445 net946 wl<138> Inv16
xi2561 net650 wl<195> Inv16
xi2560 net654 wl<196> Inv16
xi2444 net949 wl<137> Inv16
xi2559 net1076 wl<197> Inv16
xi2443 net653 wl<136> Inv16
xi2442 net1046 wl<135> Inv16
xi2558 net576 wl<198> Inv16
xi2441 net950 wl<134> Inv16
xi2557 net652 wl<199> Inv16
xi2556 net662 wl<200> Inv16
xi2440 net951 wl<133> Inv16
xi2555 net1075 wl<201> Inv16
xi2439 net657 wl<132> Inv16
xi2554 net580 wl<202> Inv16
xi2438 net659 wl<131> Inv16
xi2553 net660 wl<203> Inv16
xi2437 net984 wl<165> Inv16
xi2436 net982 wl<129> Inv16
xi2552 net656 wl<204> Inv16
xi2551 net1074 wl<205> Inv16
xi2550 net578 wl<206> Inv16
xi2549 net658 wl<207> Inv16
xi2548 net579 wl<208> Inv16
xi2547 net1073 wl<209> Inv16
xi2546 net588 wl<210> Inv16
xi2545 net577 wl<211> Inv16
xi2544 net573 wl<212> Inv16
xi2543 net1070 wl<213> Inv16
xi2542 net586 wl<214> Inv16
xi2541 net575 wl<215> Inv16
xi2540 net664 wl<216> Inv16
xi2539 net1071 wl<217> Inv16
xi2538 net582 wl<218> Inv16
xi2537 net567 wl<219> Inv16
xi2536 net571 wl<220> Inv16
xi2535 net1072 wl<221> Inv16
xi2534 net584 wl<222> Inv16
xi2533 net569 wl<223> Inv16
xi2532 net604 wl<224> Inv16
xi2531 net1069 wl<225> Inv16
xi2530 net1063 wl<226> Inv16
xi2529 net603 wl<227> Inv16
xi2528 net599 wl<228> Inv16
xi2211 net916 wl<63> Inv16
xi2307 net737 wl<65> Inv16
xi2210 net723 wl<62> Inv16
xi2209 net722 wl<61> Inv16
xi2306 net739 wl<101> Inv16
xi2208 net917 wl<60> Inv16
xi2305 net954 wl<67> Inv16
xi2304 net956 wl<68> Inv16
xi2207 net915 wl<59> Inv16
xi2303 net1044 wl<69> Inv16
xi2206 net725 wl<58> Inv16
xi2302 net663 wl<70> Inv16
xi2205 net720 wl<57> Inv16
xi2301 net955 wl<71> Inv16
xi2204 net914 wl<56> Inv16
xi2203 net919 wl<55> Inv16
xi2300 net960 wl<72> Inv16
xi2202 net721 wl<54> Inv16
xi2299 net1043 wl<73> Inv16
xi2201 net718 wl<53> Inv16
xi2298 net757 wl<74> Inv16
xi2200 net918 wl<52> Inv16
xi2297 net959 wl<75> Inv16
xi2296 net957 wl<76> Inv16
xi2199 net920 wl<51> Inv16
xi2295 net756 wl<77> Inv16
xi2198 net719 wl<50> Inv16
xi2294 net665 wl<78> Inv16
xi2197 net724 wl<49> Inv16
xi2293 net958 wl<79> Inv16
xi2196 net921 wl<48> Inv16
xi2195 net911 wl<47> Inv16
xi2292 net968 wl<80> Inv16
xi2194 net729 wl<46> Inv16
xi2291 net701 wl<81> Inv16
xi2290 net751 wl<82> Inv16
xi2193 net726 wl<45> Inv16
xi2289 net967 wl<83> Inv16
xi2192 net910 wl<44> Inv16
xi2191 net912 wl<43> Inv16
xi2288 net965 wl<84> Inv16
xi2190 net727 wl<42> Inv16
xi2287 net750 wl<85> Inv16
xi2189 net728 wl<41> Inv16
xi2286 net753 wl<86> Inv16
xi2188 net913 wl<40> Inv16
xi2285 net966 wl<87> Inv16
xi2284 net961 wl<88> Inv16
xi2187 net908 wl<39> Inv16
xi2283 net752 wl<89> Inv16
xi2186 net731 wl<38> Inv16
xi2474 net619 wl<189> Inv16
xi2802 net864 wl<338> Inv16
xi2475 net1061 wl<188> Inv16
xi2476 net980 wl<187> Inv16
xi2477 net979 wl<186> Inv16
xi2478 net933 wl<185> Inv16
xi2479 net1055 wl<184> Inv16
xi2480 net1054 wl<183> Inv16
xi2481 net934 wl<182> Inv16
xi2482 net935 wl<181> Inv16
xi2483 net641 wl<180> Inv16
xi2484 net643 wl<179> Inv16
xi2485 net936 wl<178> Inv16
xi2486 net932 wl<177> Inv16
xi2487 net1053 wl<176> Inv16
xi2488 net637 wl<175> Inv16
xi2489 net929 wl<174> Inv16
xi2490 net930 wl<173> Inv16
xi2491 net1057 wl<172> Inv16
xi2492 net1056 wl<171> Inv16
xi2493 net931 wl<170> Inv16
xi2494 net928 wl<169> Inv16
xi2495 net639 wl<168> Inv16
xi2496 net1058 wl<167> Inv16
xi2497 net985 wl<166> Inv16
xi2498 net1045 wl<128> Inv16
xi2499 net952 wl<130> Inv16
xi2500 net574 wl<194> Inv16
xi2501 net648 wl<192> Inv16
xi2502 net1064 wl<230> Inv16
xi2503 net601 wl<231> Inv16
xi2504 net591 wl<232> Inv16
xi2505 net598 wl<233> Inv16
xi2506 net1066 wl<234> Inv16
xi2507 net593 wl<235> Inv16
xi2508 net597 wl<236> Inv16
xi2509 net596 wl<237> Inv16
xi2510 net1065 wl<238> Inv16
xi2511 net595 wl<239> Inv16
xi2512 net581 wl<240> Inv16
xi2513 net594 wl<241> Inv16
xi2514 net590 wl<242> Inv16
xi2515 net583 wl<243> Inv16
xi2516 net587 wl<244> Inv16
xi2517 net1068 wl<245> Inv16
xi2518 net592 wl<246> Inv16
xi2519 net585 wl<247> Inv16
xi2520 net589 wl<248> Inv16
xi2521 net1067 wl<249> Inv16
xi2522 net606 wl<250> Inv16
xi2523 net1062 wl<251> Inv16
xi2524 net548 wl<252> Inv16
xi2525 net608 wl<253> Inv16
xi2526 net607 wl<254> Inv16
xi2527 net605 wl<255> Inv16
xi2760 net877 wl<360> Inv16
xi2761 net884 wl<361> Inv16
xi2762 net878 wl<362> Inv16
xi2763 net879 wl<363> Inv16
xi2764 net883 wl<364> Inv16
xi2765 net880 wl<365> Inv16
xi2766 net882 wl<366> Inv16
xi2767 net881 wl<367> Inv16
xi2768 net867 wl<368> Inv16
xi2769 net876 wl<369> Inv16
xi2770 net868 wl<370> Inv16
xi2771 net869 wl<371> Inv16
xi2772 net873 wl<372> Inv16
xi2773 net870 wl<373> Inv16
xi2774 net872 wl<374> Inv16
xi2775 net871 wl<375> Inv16
xi2776 net875 wl<376> Inv16
xi2777 net874 wl<377> Inv16
xi2778 net1111 wl<378> Inv16
xi2779 net904 wl<379> Inv16
xi2780 net609 wl<380> Inv16
xi2781 net896 wl<381> Inv16
xi2782 net894 wl<382> Inv16
xi2783 net895 wl<383> Inv16
xi2784 net885 wl<356> Inv16
xi2785 net890 wl<355> Inv16
xi2786 net891 wl<354> Inv16
xi2787 net866 wl<353> Inv16
xi2788 net892 wl<352> Inv16
xi2789 net855 wl<351> Inv16
xi2790 net856 wl<350> Inv16
xi2791 net854 wl<349> Inv16
xi2792 net857 wl<348> Inv16
xi2793 net853 wl<347> Inv16
xi2794 net852 wl<346> Inv16
xi2795 net858 wl<345> Inv16
xi2796 net851 wl<344> Inv16
xi2797 net861 wl<343> Inv16
xi2798 net860 wl<342> Inv16
xi2799 net862 wl<341> Inv16
xi2800 net859 wl<340> Inv16
xi2801 net863 wl<339> Inv16
xi3127 net761 wl<477> Inv16
xi3126 net758 wl<478> Inv16
xi3125 net760 wl<479> Inv16
xi3124 net759 wl<480> Inv16
xi3123 net787 wl<481> Inv16
xi3122 net762 wl<482> Inv16
xi3121 net786 wl<483> Inv16
xi3120 net785 wl<484> Inv16
xi3119 net781 wl<485> Inv16
xi3118 net784 wl<486> Inv16
xi3117 net782 wl<487> Inv16
xi3116 net783 wl<488> Inv16
xi3115 net773 wl<489> Inv16
xi3114 net780 wl<490> Inv16
xi3113 net774 wl<491> Inv16
xi3112 net775 wl<492> Inv16
xi3111 net779 wl<493> Inv16
xi3110 net776 wl<494> Inv16
xi3109 net778 wl<495> Inv16
xi3108 net777 wl<496> Inv16
xi2991 net1005 wl<441> Inv16
xi2990 net1006 wl<440> Inv16
xi2989 net830 wl<439> Inv16
xi2988 net992 wl<438> Inv16
xi2987 net827 wl<437> Inv16
xi2986 net828 wl<436> Inv16
xi2985 net826 wl<435> Inv16
xi2984 net829 wl<434> Inv16
xi2976 net823 wl<433> Inv16
xi2975 net824 wl<432> Inv16
xi2974 net822 wl<431> Inv16
xi2973 net825 wl<430> Inv16
xi2972 net820 wl<429> Inv16
xi2971 net821 wl<428> Inv16
xi2970 net819 wl<427> Inv16
xi2969 net993 wl<384> Inv16
xi2968 net995 wl<385> Inv16
xi2967 net994 wl<386> Inv16
xi2966 net999 wl<387> Inv16
xi2965 net996 wl<388> Inv16
xi2964 net998 wl<389> Inv16
xi2963 net997 wl<390> Inv16
xi2955 net1010 wl<391> Inv16
xi2954 net1007 wl<392> Inv16
xi2953 net1009 wl<393> Inv16
xi2952 net1008 wl<394> Inv16
xi2951 net1036 wl<395> Inv16
xi2950 net1011 wl<396> Inv16
xi2949 net1035 wl<397> Inv16
xi2948 net1034 wl<398> Inv16
xi2947 net1030 wl<399> Inv16
xi2946 net1033 wl<400> Inv16
xi2945 net1031 wl<401> Inv16
xi2944 net1032 wl<402> Inv16
xi2943 net1022 wl<403> Inv16
xi2942 net1029 wl<404> Inv16
xi2941 net1023 wl<405> Inv16
xi2940 net1024 wl<406> Inv16
xi2939 net1028 wl<407> Inv16
xi2938 net1025 wl<408> Inv16
xi2937 net1027 wl<409> Inv16
xi2936 net1026 wl<410> Inv16
xi2819 net893 wl<321> Inv16
xi2935 net1012 wl<411> Inv16
xi2818 net889 wl<357> Inv16
xi2934 net1021 wl<412> Inv16
xi2817 net795 wl<323> Inv16
xi2933 net1013 wl<413> Inv16
xi2932 net1014 wl<414> Inv16
xi2816 net799 wl<324> Inv16
xi2931 net1018 wl<415> Inv16
xi2815 net796 wl<325> Inv16
xi2930 net1015 wl<416> Inv16
xi2814 net798 wl<326> Inv16
xi2929 net1017 wl<417> Inv16
xi2813 net797 wl<327> Inv16
xi2812 net849 wl<328> Inv16
xi2928 net1016 wl<418> Inv16
xi2811 net800 wl<329> Inv16
xi2927 net1020 wl<419> Inv16
xi2926 net1019 wl<420> Inv16
xi2810 net848 wl<330> Inv16
xi2925 net1042 wl<421> Inv16
xi2809 net847 wl<331> Inv16
xi2808 net843 wl<332> Inv16
xi2924 net1040 wl<422> Inv16
xi2807 net846 wl<333> Inv16
xi2923 net1041 wl<423> Inv16
xi2806 net844 wl<334> Inv16
xi2922 net1039 wl<424> Inv16
xi2805 net845 wl<335> Inv16
xi2921 net1037 wl<425> Inv16
xi2920 net1038 wl<426> Inv16
xi2804 net865 wl<336> Inv16
xi2803 net850 wl<337> Inv16
xi3135 net805 wl<476> Inv16
xi3136 net806 wl<475> Inv16
xi3137 net804 wl<474> Inv16
xi3138 net807 wl<473> Inv16
xi3139 net802 wl<472> Inv16
xi3140 net803 wl<471> Inv16
xi3141 net801 wl<470> Inv16
xi3105 net764 wl<499> Inv16
xi3101 net768 wl<503> Inv16
xi3097 net792 wl<507> Inv16
xi3093 net788 wl<511> Inv16
xi3017 net989 wl<467> Inv16
xi3013 net809 wl<463> Inv16
xi3009 net834 wl<459> Inv16
xi3005 net811 wl<455> Inv16
xi3001 net815 wl<451> Inv16
xi2997 net1000 wl<447> Inv16
xi2993 net1004 wl<443> Inv16
xi2757 net793 wl<320> Inv16
xi2753 net692 wl<294> Inv16
xi2749 net696 wl<298> Inv16
xi2745 net694 wl<302> Inv16
xi2741 net623 wl<306> Inv16
xi2737 net621 wl<310> Inv16
xi2733 net698 wl<314> Inv16
xi2729 net1092 wl<318> Inv16
xi2725 net690 wl<290> Inv16
xi2721 net629 wl<286> Inv16
xi2717 net631 wl<282> Inv16
xi2713 net627 wl<278> Inv16
xi2709 net625 wl<274> Inv16
xi2705 net638 wl<270> Inv16
xi2701 net634 wl<266> Inv16
xi2697 net642 wl<262> Inv16
xi2693 net691 wl<293> Inv16
xi3104 net765 wl<500> Inv16
xi3100 net767 wl<504> Inv16
xi3096 net790 wl<508> Inv16
xi3016 net987 wl<466> Inv16
xi3012 net810 wl<462> Inv16
xi3006 net832 wl<456> Inv16
xi3002 net817 wl<452> Inv16
xi2998 net813 wl<448> Inv16
xi2994 net1002 wl<444> Inv16
xi2758 net887 wl<358> Inv16
xi2754 net1077 wl<256> Inv16
xi2750 net693 wl<297> Inv16
xi2746 net695 wl<301> Inv16
xi2742 net697 wl<305> Inv16
xi2738 net622 wl<309> Inv16
xi2734 net620 wl<313> Inv16
xi2730 net555 wl<317> Inv16
xi2726 net556 wl<291> Inv16
xi2722 net1082 wl<287> Inv16
xi2718 net565 wl<283> Inv16
xi2714 net563 wl<279> Inv16
xi2710 net1084 wl<275> Inv16
xi2706 net568 wl<271> Inv16
xi2702 net1080 wl<267> Inv16
xi2698 net1078 wl<263> Inv16
xi2694 net572 wl<259> Inv16
xi5 net886 wl<0> Inv16
xi2121 net539 wl<2> Inv16
.END

