../run-sniper -c IvyBridge -d ../Results/cutfulllow_mpki --traces=../../SPECtraces10B/557.sift,../../SPECtraces10B/531.sift,../../SPECtraces10B/526.sift,../../SPECtraces10B/523.sift,../../SPECtraces10B/549.sift,../../SPECtraces10B/548.sift,../../SPECtraces10B/511.sift,../../SPECtraces10B/541.sift -s stop-by-icount:80000000000:500000000 --roi-script -g --scheduler/type=sequential -g --scheduler/sequential/sequence="1|1|1|1|1|1|1|1" -g --scheduler/sequential/sequence_file="FILE.OUT"