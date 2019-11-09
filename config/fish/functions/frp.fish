#remote へ push
function frp() {
  git branch;
  read -p "feature/miyazaki/xxxxxxxxxx >> xxxxxxxを入力してください" branchname
  git push -u origin feature/miyazaki/${branchname};
}


