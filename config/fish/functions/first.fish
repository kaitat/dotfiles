function first() {
  git checkout develop;
  git pull;
  git branch;
  read -p "feature/miyazaki/xxxxxxxx >>  branch名を入力してください" branchname;
  git checkout -b feature/miyazaki/${branchname};
  blankco;
  git push -u origin feature/miyazaki/${branchname};

}

