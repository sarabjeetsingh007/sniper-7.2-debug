# ./getinvalidations_IPC.sh $1
# Valid arguments = "L1 L1L2 L1L2L3"
#allbench="500 502 503 505 507 510 511 519 520 521 523 527 531 538 544 554 557 canneal dedup facesim ferret fluidanimate freqmine raytrace streamcluster parsechigh parsecmed parseclow"
allbench="parsechigh parsecmed parseclow"

if [[ $1 = "L1" ]]
then
	t_L1miss=5	#in cycles
	t_L2miss=0
	t_L3miss=0
elif [[ $1 = "L1L2" ]]
then
	t_L1miss=2
	t_L2miss=10
	t_L3miss=0
elif [[ $1 = "L1L2L3" ]]
then
	t_L1miss=2
	t_L2miss=5
	t_L3miss=340
else
	echo "Invalid argument. Usage: ./getinvalidations_IPC.sh NoRefreshPolicy"
	echo "Valid NoRefreshPolicy = \"L1 L1L2 L1L2L3\""
	exit
fi

cd ../Results/Run2B/
for ben in $allbench
do	
	cd $ben/
	cycles=` ../../../tools/dumpstats.py | grep performance_model.cycle_count | awk '{print substr($3, 1, length($3)-1)}' `
	instructions=` ../../../tools/dumpstats.py | grep core.instructions | awk '{print ($3+$4+$5+$6+$7+$8+$9+$10)}' `
	
    numL1Imiss=` ../../../tools/dumpstats.py | grep "L1-I.ReadsAfterRefreshPeriod = " | awk '{print ($3+$4+$5+$6+$7+$8+$9+$10)}' `
    numL1Dmiss=` ../../../tools/dumpstats.py | grep "L1-D.ReadsAfterRefreshPeriod = " | awk '{print ($3+$4+$5+$6+$7+$8+$9+$10)}' `
    numL1miss=`echo "( $numL1Imiss + $numL1Dmiss )" | bc -l`
    numL2miss=` ../../../tools/dumpstats.py | grep "L2.ReadsAfterRefreshPeriod = " | awk '{print ($3+$4+$5+$6+$7+$8+$9+$10)}' `
    numL3miss=` ../../../tools/dumpstats.py | grep "L3.ReadsAfterRefreshPeriod = " | awk '{print ($3+$4+$5+$6+$7+$8+$9+$10)}' `

    extracycles=`echo "( ($t_L1miss * $numL1miss) + ($t_L2miss * $numL2miss) + ($t_L3miss * $numL3miss) )" | bc -l`

    IPC=`echo "( $instructions / ($cycles + $extracycles) )" | bc -l`
    #../../../tools/dumpstats.py | grep "ipc = " | awk '{print ($3+$4+$5+$6+$7+$8+$9+$10)}'
    echo $IPC
	cd ../
done
cd ../../sarabscripts

