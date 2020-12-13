export MAX_DOWNLOAD_SPEED=0
tracker_list=$(curl -Ns https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt | awk '$1' | tr '\n' ',')
export MAX_CONCURRENT_DOWNLOADS=5
aria2c --enable-rpc --rpc-listen-all=false --rpc-listen-port 6800 \
   --max-connection-per-server=10 --rpc-max-request-size=1024M \
   --bt-tracker="[$tracker_list]" --bt-max-peers=0 --seed-time=0 --seed-ratio=1.0 --min-split-size=10M \
   --follow-torrent=true --split=10 \
   --daemon=true --allow-overwrite=true --max-overall-download-limit=$MAX_DOWNLOAD_SPEED \
   --max-overall-upload-limit=0 --max-concurrent-downloads=$MAX_CONCURRENT_DOWNLOADS