" jsonを整形
command! JsonFormat :execute '%!python -m json.tool'
      \ | :execute '%!python -c "import re,sys;chr=__builtins__.__dict__.get(\"unichr\", chr);sys.stdout.write(re.sub(r\"\\\\u[0-9a-f]{4}\", lambda x: chr(int(\"0x\" + x.group(0)[2:], 16)).encode(\"utf-8\"), sys.stdin.read()))"'
      \ | :set ft=json
      \ | :1

" 現在のファイルパスをコピー
command! CopyPath
      \ let @*=expand('%') | echo 'copied'

