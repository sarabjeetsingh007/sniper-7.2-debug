../run-sniper -c IvyBridge -d ../Results/memlow --traces=../../SPECtraces/557.sift,../../SPECtraces/531.sift,../../SPECtraces/526.sift,../../SPECtraces/523.sift,../../SPECtraces/549.sift,../../SPECtraces/548.sift,../../SPECtraces/511.sift,../../SPECtraces/541.sift -s stop-by-icount:20500000000:500000000 --roi-script -g --scheduler/type=sequential -g --scheduler/sequential/sequence="1|1|1|1|1|1|1|1" -g --scheduler/sequential/sequence_file="FILE.OUT" --sim-end=last
