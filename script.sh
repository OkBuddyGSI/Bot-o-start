SEGFAULT_TOKEN=$1

sudo apt update
sudo apt install tmux -y
mkdir /home/runner/.ssh || true
tmux new-session -d || tmux
tmux send-keys -t 0 'ssh -o "SetEnv SECRET=$SEGFAULT_TOKEN" root@lulz.segfault.net' Enter
sleep 5
tmux send-keys -t 0 'segfault' Enter
sleep 5
tmux send-keys -t 0 "N"
sleep 5
tmux a -t 0 -d
