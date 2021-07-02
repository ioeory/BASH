#!/bin/bash
LOG=/tmp/power.log
MonitorIP=10.0.0.254
TTO=30

dst_check(){
    ping $MonitorIP -c2 -W2 >/dev/null
}

check_status(){
    dst_check
    if [ $? -eq 0 ];then
         echo "$(date -d today +"%Y%m%d %H:%M:%S")-设备通信正常"|tee -a $LOG
    else
        echo "$(date -d today +"%Y%m%d %H:%M:%S")-设备无法通信！将再次尝试……" 
        sleep $TTO
        dst_check
        if [ $? -eq 0 ];then
            echo "$(date -d today +"%Y%m%d %H:%M:%S")-设备恢复正常通信，警报解除"|tee -a $LOG
        else
            echo "$(date -d today +"%Y%m%d %H:%M:%S")-再次尝试通信失败, 准备休眠..."|tee -a $LOG 
            sleep 5
            sudo systemctl hibernate
        fi
    fi
}

main(){
while :; do check_status;sleep 5; done
}

main
