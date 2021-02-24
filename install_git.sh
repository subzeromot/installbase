sudo apt-get install git
git config --global merge.tool diffmerge
git config --global mergetool.diffmerge.cmd "/usr/bin/diffmerge --merge --result=\"\$MERGED\" \"\$LOCAL\" \"\$BASE\" \"\$REMOTE\""
git config --global mergetool.diffmerge.trustExitCode true
git config --global mergetool.keepBackup false
git config --global diff.tool diffmerge
git config --global difftool.diffmerge.cmd "/usr/bin/diffmerge --nosplash \"\$LOCAL\" \"\$REMOTE\""
