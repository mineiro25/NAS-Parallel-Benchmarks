c CLASS = C
c  
c  
c  This file is generated automatically by the setparams utility.
c  It sets the number of processors and the class of the NPB
c  in this directory. Do not modify it by hand.
c  
        character class
        parameter (class ='C')
        integer m
        parameter (m=32)
        logical  convertdouble
        parameter (convertdouble = .false.)
        character compiletime*11
        parameter (compiletime='12 Apr 2020')
        character npbversion*5
        parameter (npbversion='3.3.1')
        character cs1*17
        parameter (cs1='gfortran -fopenmp')
        character cs2*6
        parameter (cs2='$(F77)')
        character cs3*6
        parameter (cs3='(none)')
        character cs4*6
        parameter (cs4='(none)')
        character cs5*6
        parameter (cs5='(none)')
        character cs6*6
        parameter (cs6='(none)')
        character cs7*6
        parameter (cs7='randi8')
