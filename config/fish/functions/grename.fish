#チェックアウトする
function grename() {
  git branch;
  read -p "change branch >>" branchname;
  git checkout ${branchname};
}

