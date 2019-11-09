#featureなんちゃらにチェックアウト
function fcob() {
  git branch;
  read -p "feature/miyazaki/xxxxxxxx >>  xxxxxを入力してください" branchname;
  git checkout -b feature/miyazaki/${branchname};
}

