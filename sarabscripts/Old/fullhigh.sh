../run-sniper -c IvyBridge -d ../Results/fullhigh --traces=../../SPECtraces/507.sift,../../SPECtraces/505.sift,../../SPECtraces/502.sift,../../SPECtraces/500.sift,../../SPECtraces/520.sift,../../SPECtraces/523.sift,../../SPECtraces/527.sift,../../SPECtraces/503.sift -s stop-by-icount:20500000000:500000000 --roi-script -g --scheduler/type=sequential -g --scheduler/sequential/sequence="1|1|1|1|1|1|1|1" -g --scheduler/sequential/sequence_file="FILE.OUT" --sim-end=last