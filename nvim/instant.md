## How to use instant.nvim

### PC 1
Vim
---

Start server :InstantStartServer

Start Share :InstantStartSingle 0.0.0.0 8080

terminal
---

ngrok http 8080 or ngrok tcp 8080

copy the URL (say https://foobar.ngrok.io)


PC 2
---

Vim
---

Join :InstantJoinSingle foobar.ngrok.io 80 (for example)
