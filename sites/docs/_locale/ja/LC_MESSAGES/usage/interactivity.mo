Þ             +         È  l  É  	   6     @     \  í   n     \  à   q     R    Y     m  r       ò  ¾   	  Ñ   C
  =    s  S  b  Ç      *  ·   K  1       5    F  z   _  v   Ú    Q  Å  d  ü   *  E  '  >  m    ¬  û   ½  ½  ¹  ú  w     r  -        ¶    Ê     g!    !  	   "  q  ¦"     $  Ï  1$      &  Þ   ¢&    '  ³  ¡(  è  U*    >,  -   C.    q.  }  /     1    1  ®   2  ¢   M3  \  ð3  ¥  M5    ó7    9  ¼  ;  l  F=  f  ³>     
                                                                                    	                                                       As a final note, keep in mind that use of pseudo-terminals effectively implies combining stdout and stderr -- in much the same way as the :ref:`combine_stderr <combine_streams>` setting does. This is because a terminal device naturally sends both stdout and stderr to the same place -- the user's display -- thus making it impossible to differentiate between them. Buffering Combining stdout and stderr Combining the two Conversely, users requiring a distinct stderr stream at the Python level and who aren't bothered by garbled user-facing output (or who are hiding stdout and stderr from the command in question) may opt to set this to ``False`` as needed. Crossing the streams Due to this default setting, output will appear correctly, but at the cost of an empty ``.stderr`` attribute on the return values of `~fabric.operations.run`/`~fabric.operations.sudo`, as all output will appear to be stdout. Echoes Fabric 0.9.x and earlier, and Python itself, buffer output on a line-by-line basis: text is not printed to the user until a newline character is found. This works fine in most situations but becomes problematic when one needs to deal with partial-line output such as prompts. Fabric's approach Fabric's primary operations, `~fabric.operations.run` and `~fabric.operations.sudo`, are capable of sending local input to the remote end, in a manner nearly identical to the ``ssh`` program. For example, programs which display password prompts (e.g. a database dump utility, or changing a user's password) will behave just as if you were interacting with them directly. For situations requiring the pty behavior turned off, the :option:`--no-pty` command-line argument and :ref:`always-use-pty` env var may be used. However, as with ``ssh`` itself, Fabric's implementation of this feature is subject to a handful of limitations which are not always intuitive. This document discusses such issues in detail. However, at the Fabric level, the two groups of settings are distinct from one another and may be combined in various ways. The default is for both to be set to ``True``; the other combinations are as follows: However, it's possible for programs to be run without a tty or pty present at all (consider cron jobs, for example) and in this situation, any stdin data being fed to the program won't be echoed. This is desirable for programs being run without any humans around, and it's also Fabric's old default mode of operation. In addition to allowing normal echo behavior, a pty also means programs that behave differently when attached to a terminal device will then do so. For example, programs that colorize output on terminals but not when run in the background will print colored output. Be wary of this if you inspect the return value of `~fabric.operations.run` or `~fabric.operations.sudo`! In the interests of security and meeting the principle of least surprise (insofar as users are typically expecting things to behave as they would when run in a terminal emulator), Fabric 1.0 and greater force a pty by default. With a pty enabled, Fabric simply allows the remote end to handle echoing or hiding of stdin and does not echo anything itself. Interaction with remote programs Line-buffered output can make programs appear to halt or freeze for no reason, as prompts print out text without a newline, waiting for the user to enter their input and press Return. Newer Fabric versions buffer both input and output on a character-by-character basis in order to make interaction with prompts possible. This has the convenient side effect of enabling interaction with complex programs utilizing the "curses" libraries or which otherwise redraw the screen (think ``top``). Pseudo-terminals Readers unfamiliar with the basics of Unix stdout and stderr pipes, and/or terminal devices, may wish to visit the Wikipedia pages for `Unix pipelines <http://en.wikipedia.org/wiki/Pipe_(Unix)>`_ and `Pseudo terminals <http://en.wikipedia.org/wiki/Pseudo_terminal>`_ respectively. The first issue to be aware of is that of the stdout and stderr streams, and why they are separated or combined as needed. The other main issue to consider when presenting interactive prompts to users is that of echoing the user's own input. To solve this problem, Fabric uses a setting in our SSH layer which merges the two streams at a low level and causes output to appear more naturally. This setting is represented in Fabric as the :ref:`combine-stderr` env var and keyword argument, and is ``True`` by default. Typical terminal applications or bona fide text terminals (e.g. when using a Unix system without a running GUI) present programs with a terminal device called a tty or pty (for pseudo-terminal). These automatically echo all text typed into them back out to the user (via stdout), as interaction without seeing what you had just typed would be difficult. Terminal devices are also able to conditionally turn off echoing, allowing secure password prompts. Unfortunately, in the context of executing commands via Fabric, when no pty is present to echo a user's stdin, Fabric must echo it for them. This is sufficient for many applications, but it presents problems for password prompts, which become insecure. Unfortunately, printing to stderr and stdout simultaneously (as many programs do) means that when the two streams are printed independently one byte at a time, they can become garbled or meshed together. While this can sometimes be mitigated by line-buffering one of the streams and not the other, it's still a serious issue. ``run("cmd", pty=False, combine_stderr=False)``: with both settings ``False``, Fabric will echo stdin and won't issue a pty -- and this is highly likely to result in undesired behavior for all but the simplest commands. However, it is also the only way to access a distinct stderr stream, which is occasionally useful. ``run("cmd", pty=False, combine_stderr=True)``: will cause Fabric to echo all stdin itself, including passwords, as well as potentially altering ``cmd``'s behavior. Useful if ``cmd`` behaves undesirably when run under a pty and you're not concerned about password prompts. ``run("cmd", pty=True, combine_stderr=False)``: valid, but won't really make much of a difference, as ``pty=True`` will still result in merged streams. May be useful for avoiding any edge case problems in ``combine_stderr`` (none are presently known). Project-Id-Version: Fabric 1.8
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-02-15 23:24+0900
PO-Revision-Date: 2014-06-27 15:58+0900
Last-Translator: JOTAKI, Taisuke <tekapo@gmail.com>
Language-Team: Japanese (http://www.transifex.com/projects/p/fabric-docs-1_8_2/language/ja/)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
Language: ja
X-Generator: Poedit 1.6.5
 æå¾ã®æ³¨æç¹ã¨ãã¦ãæ¬ä¼¼ã¿ã¼ããã«ã®å©ç¨ã¯äºå®ä¸ãæ¨æºåºåã¨æ¨æºã¨ã©ã¼åºåãçµ±åããã¨ãããã¨ã§ããããã¯ :ref:`combine_stderr <combine_streams>` ã®è¨­å®ãè¡ãã®ã¨ã¾ã£ããåãæ¹æ³ã§ããããã¯ã¿ã¼ããã«ããã¤ã¹ãå½ç¶ãªããæ¨æºåºåã¨æ¨æºã¨ã©ã¼åºåã®ä¸¡æ¹ãåãå ´æãã¦ã¼ã¶ã¼ã®ãã£ã¹ãã¬ã¤ã«éãããã§ããããã£ã¦ããã«ããä¸¡èã®ååãä¸å¯è½ã«ãªã£ã¦ãã¾ã ãããã¡ãªã³ã° æ¨æºåºåã¨æ¨æºã¨ã©ã¼åºåã®çµå ãã®2ã¤ã®çµ±å éã«ãPythonã¬ãã«ã§ã®æ¨æºã¨ã©ã¼åºåã®ã¹ããªã¼ã ãåºå¥ããå½¢ã§å¿è¦ã¨ããã¦ã¼ã¶ã¼ãã¦ã¼ã¶ã¼ãç®ã«ããåºåãæå­åããã¦ãã¦ãæ§ããªãã¦ã¼ã¶ã¼(ãããã¯ãåé¡ã¨ãªãæ¨æºåºåãæ¨æºã¨ã©ã¼åºåãã³ãã³ãããé ãã¦ããã¦ã¼ã¶ã¼)ã¯ãå¿è¦ã«å¿ãã¦ãã®å¤ã ``False`` ã«ã»ãããããã¨ãã§ãã¾ãã ã¹ããªã¼ã ã®äº¤å·® ãã®ããã©ã«ãã®è¨­å®ã®ãããã§åºåãæ­£ããè¡¨ç¤ºããã¾ããã`~fabric.operations.run`/`~fabric.operations.sudo` ã®è¿ãå¤ã«ç©ºã® ``.stderr`` å±æ§ã¨ããä»£åãæã£ã¦ãã¦ããã¹ã¦ã®åºåãæ¨æºåºåã«è¡¨ç¤ºããã¦ãã¾ãã¾ãã ã¨ã³ã¼ Fabric 0.9.xä»¥åã§ã¯ãã¾ãPythonèªèº«ã§ãããããã¡ã¼ã®åºåã¯ååçã«è¡ãã¨ã§ãæ°ããæå­ãç¾ããã¾ã§ãã­ã¹ãã¯ã¦ã¼ã¶ã¼ã«è¡¨ç¤ºããã¾ããã§ãããããã¯å¤§æµã®å ´åã¯åé¡ããã¾ãããããã­ã³ããã®ããã«ä¸é¨åã®è¡ã®åºåãæ±ãå¿è¦ãããå ´åã«ã¯åé¡ã¨ãªãã¾ãã Fabricã®ã¢ãã­ã¼ã Fabricã®ä¸»ãªæä½ã `~fabric.operations.run` ã¨ `~fabric.operations.sudo` ã§ã¯ãããæå³ ``ssh`` ã¨ã»ã¨ãã©åãããã«ã­ã¼ã«ã«ã®å¥åããªã¢ã¼ãå´ã«éããã¨ãã§ãã¾ããä¾ãã°ããã¹ã¯ã¼ãã®ãã­ã³ãããè¡¨ç¤ºãããã­ã°ã©ã (ä¾ãã°ããã¼ã¿ãã¼ã¹ã®ãã³ãã¦ã¼ãã£ãªãã£ãã¦ã¼ã¶ã¼ãã¹ã¯ã¼ãã®å¤æ´ãªã©)ã¯ç´æ¥ããåãããã¦ããããã«æ¯ãèãã¾ãã ptyã®æåã®ç¡å¹ãæ±ããããå ´åã¯ã :option:`--no-pty` ã®ã³ãã³ãã©ã¤ã³å¼æ°ã¨ :ref:`always-use-pty` envå¤æ°ãå©ç¨å¯è½ã§ãã ã¨ã¯è¨ãã ``ssh`` ã¨åæ§ã«ãFabricã®ãã®æ©è½ã®å®è£ãç´æçã¨ã¯éããªãããã¤ãã®å¶éã«å½±é¿ããã¾ãããã®ãã­ã¥ã¡ã³ãã§ã¯ããããåé¡ã«ã¤ãã¦è©³è¿°ãã¾ãã ã¨ã¯è¨ããFabricã¬ãã«ã§ã¯ãã®2ã¤ã®è¨­å®ã°ã«ã¼ãã¯ããããæç¢ºã«åºå¥ãããæ§ããªæ¹æ³ã§çµ±åãããã¨ãã§ãã¾ããããã©ã«ãã§ã¯ãä¸¡æ¹ã¨ã ``True`` ã«ã»ããããã¦ãã¾ããä»ã®çµã¿åããã¯ä»¥ä¸ã«ãªãã¾ãã ã¨ã¯è¨ããttyãptyãã¾ã£ããè¡¨ç¤ºãããªãã¦ããã­ã°ã©ã ã¯å®è¡å¯è½(ä¾ãã°cronã®ã¸ã§ããèãã¦ã¿ã¦ãã ãã)ã§ããã®ãã­ã°ã©ã ã«æ³¨ãè¾¼ã¾ããã©ããªæ¨æºå¥åã®ãã¼ã¿ãã¨ã³ã¼ããã¾ãããããã¯äººéãå¨ãã«ããªãã¦ãå®è¡ããããã­ã°ã©ã ã«ã¨ã£ã¦ã¯æã¾ããæåã§ãFabricã®ä»¥åã®ããã©ã«ãã®æä½ã¢ã¼ãã§ããã éå¸¸ã®ã¨ã³ã¼ã®æåãè¨±å¯ãããã¨ã«å ãã¦ãã¿ã¼ããã«ããã¤ã¹ã«ã¢ã¿ãããããæã«å¥ã®æåãç¤ºããã­ã°ã©ã ã¯ããã®æåãç¤ºãã¾ããä¾ãã°ãã¿ã¼ããã«ä¸ã§ã¯ã«ã©ã¼ã§åºåããããã¯ã°ã©ã¦ã³ãã§ã¯ã«ã©ã¼ã§åºåããªããã­ã°ã©ã ã¯ãptyã¯ã«ã©ã¼ã§åºåãã¾ãã`~fabric.operations.run` ãããã¯ `~fabric.operations.sudo` ã®è¿ãå¤ãèª¿ã¹ãå ´åã¯æ³¨æãã¦ãã ãã! ã»ã­ã¥ãªãã£ä¸ã®çç±ã¨é©ãããã¨ã¯æå°ã«ããã¹ãã¨ããååã«æ²¿ããã(ã¦ã¼ã¶ã¼ãä¸è¬çã«ã¯ã¿ã¼ããã«ã¨ãã¥ã¬ã¼ã¿ã§åä½ãã¦ããã¨ãã¨åããããªæåãæå¾ãã¦ããéãã«ããã¦ã¯)ãFabric 1.0ä»¥ä¸ã§ã¯ããã©ã«ãã§ptyãå¼·å¶ãã¾ããptyãæå¹ã®ã¨ããFabricã¯åã«ãªã¢ã¼ãå´ã§ã¨ã³ã¼ãæ±ãããã«ãããããããã¯æ¨æºå¥åãé ãã¦ã¾ã£ããä½ãã¨ã³ã¼ããªãããã«ãã¾ãã ãªã¢ã¼ããã­ã°ã©ã ã¨ã®ããã¨ã è¡ã§ãããã¡ãããåºåã¯ãã­ã°ã©ã ãçç±ãªãä¸­æ­ããããããªã¼ãºããããããããã«è¦ãã¾ãããã­ã³ããã¯æ°ããè¡ãªãã§ãã­ã¹ããè¡¨ç¤ºããã¦ã¼ã¶ã¼ãå¥åãã¦ãªã¿ã¼ã³ãæ¼ãã®ãå¾ã¡ã¾ãã æ°ããFabricã®ãã¼ã¸ã§ã³ã¯å¥åã¨åºåã®ä¸¡æ¹ã¨ããæå­ãã¨ã«ãããã¡ãããã­ã³ããã¨ã®ããã¨ããå¯è½ã«ãã¾ããããã¯ã "åªããã" ã©ã¤ãã©ãªãæ´»ç¨ããè¤éãªãã­ã°ã©ã ã¨ã®ããã¨ããå¯è½ã«ãã¾ãããããªããã°ã¹ã¯ãªã¼ã³ãåæç»ãã¾ã( ``top`` ãèãã¦ã¿ã¦ãã ãã)ã æ¬ä¼¼ã¿ã¼ããã« Unixã®æ¨æºåºåãæ¨æºã¨ã©ã¼åºåã®ãã¤ãã¨ã¿ã¼ããã«ããã¤ã¹ã«åºç¤ã«é¦´æã¿ã®ãªãèª­èã¯ `Unix ãã¤ã <http://ja.wikipedia.org/wiki/%E3%83%91%E3%82%A4%E3%83%97_%28%E3%82%B3%E3%83%B3%E3%83%94%E3%83%A5%E3%83%BC%E3%82%BF%29>`_ ã `æ¬ä¼¼ç«¯æ« <http://ja.wikipedia.org/wiki/%E6%93%AC%E4%BC%BC%E7%AB%AF%E6%9C%AB>`_ ãåç§ããã¨ããã§ãããã æåã«æ°ã¥ãåé¡ã¯æ¨æºåºåã¨æ¨æºã¨ã©ã¼åºåã®ã¹ããªã¼ã ã§ããªãä¸¡èãéæåé¢ãããçµåãããããã®ãã¨ãããã¨ã§ãã ã¦ã¼ã¶ã¼ã«å¯¾è©±å¼ãã­ã³ãããè¡¨ç¤ºããã¨ãã«èæ®ãã¹ãããä¸ã¤ã®å¤§ããªåé¡ã¯ãã¦ã¼ã¶ã¼èªèº«ã®å¥åã®ã¨ã³ã¼ã§ãã ãã®åé¡ãè§£æ±ºãããããFabricã§ã¯ä½ã¬ãã«ã§ãã®2ã¤ããã¼ã¸ããSSHå±¤ã®è¨­å®ãå©ç¨ããåºåãããèªç¶ã«è¡¨ç¤ºããããã«ãã¦ãã¾ãããã®è¨­å®ã¯Fabricã§ã¯ :ref:`combine-stderr` envå¤æ°ã¨ã­ã¼ã¯ã¼ãå¼æ°ã¨ãã¦è¡¨ãããããã©ã«ãã§ã¯``True`` ãè¨­å®ããã¦ãã¾ãã ä¸è¬çãªã¿ã¼ããã«ã¢ããªã±ã¼ã·ã§ã³ãæ¬ç©ã®ãã­ã¹ãã¿ã¼ããã«(ä¾ãã°ãGUIãªãã§Unixã·ã¹ãã ãä½¿ç¨ãã¦ããæ)ã§ã¯ttyãããã¯pty (pseudo-terminal - æ¬ä¼¼ã¿ã¼ããã«)ã¨å¼ã°ããã¿ã¼ããã«ããã¤ã¹ã¨ã¨ãã«ãã­ã°ã©ã ãè¡¨ç¤ºããã¾ããã¿ã¤ãããæå­ãè¦ãã«ããã¨ãããã®ã¯å°é£ãªããããããã§ã¯ãã¿ã¤ãããããã¹ã¦ã®ãã­ã¹ãã(æ¨æºåºåçµç±ã§)ã¦ã¼ã¶ã¼ã«èªåçã«ã¨ã³ã¼ããã¾ããã¿ã¼ããã«ããã¤ã¹ã§ãã¾ããæ¡ä»¶ä»ãã§ã¨ã³ã¼ãåããã«ã§ãããã¹ã¯ã¼ãã®ãã­ã³ãããå®å¨ã«ã§ãã¾ãã æ®å¿µãªãããFabricçµç±ã§ã³ãã³ããå®è¡ããã¨ãããã¨ã¯ãã¦ã¼ã¶ã¼ã®æ¨æºå¥åãã¨ã³ã¼ããããã®ptyããªãã¨ãã«Fabricããããã¨ã³ã¼ããªãã¦ã¯ãªããªãã¨ãããã¨ã§ããããã¯å¤ãã®ã¢ããªã±ã¼ã·ã§ã³ã§ã¯åé¡ããã¾ãããããã¹ã¯ã¼ããã­ã³ããã«ã¨ã£ã¦ã¯åé¡ã§ãããå®å¨ã§ã¯ããã¾ããã æ®å¿µãªãããæ¨æºã¨ã©ã¼åºåã¨æ¨æºåºåã¸åæã«è¡¨ç¤ºãããã¨ãããã¨ã¯(å¤ãã®ãã­ã°ã©ã ã§è¡ããã¦ãã¾ãã)ããã®2ã¤ã®ã¹ããªã¼ã ãç¡é¢ä¿ã«1ãã¤ããã¤è¡¨ç¤ºãããã¨ããæå³ã§ãããæå­åãããããæ··ãã£ã¦è¡¨ç¤ºãããããããã¨ãããã¾ããããã¯ã¹ããªã¼ã ã®ä¸æ¹ãè¡ã§ãããã¡ãããã¨ã§ç·©åããããã¨ã¯ã§ãã¾ãããéè¦ãªåé¡ã§ãããã¨ã«ã¯å¤ããããã¾ããã ``run("cmd", pty=False, combine_stderr=False)``: ä¸¡æ¹ã®è¨­å®ã ``False`` ã®æãFabricã¯æ¨æºå¥åãã¨ã³ã¼ããptyãçºè¡ãã¾ãããããã¦ããã¯ããã£ã¨ãã·ã³ãã«ãªã³ãã³ãä»¥å¤ã®ãã¹ã¦ã§å¥½ã¾ãããªãæåãããããå¯è½æ§ãé«ããªãã¾ããã¨ã¯è¨ããåºå¥ãããæ¨æºã¨ã©ã¼åºåã«ã¢ã¯ã»ã¹ããå¯ä¸ã®æ¹æ³ã§ãããããããå ´åã«ã¯ä¾¿å©ã§ãã ``run("cmd", pty=False, combine_stderr=True)``: Fabricã¯ãã¹ã¯ã¼ããå«ãããã¹ã¦ã®æ¨æºå¥åãã¨ã³ã¼ãã¾ããã¾ãã ``cmd`` ã®æåãå¤æ´ãããå¯è½æ§ãããã¾ããptyã§åä½ãã¦ãã¦ãã¹ã¯ã¼ãã®ãã­ã³ããã«ã¤ãã¦å¿éãã¦ããªãæã« ``cmd`` ã®æåãå¥½ã¾ãããªãå ´åã«ä¾¿å©ã§ãã	 ``run("cmd", pty=True, combine_stderr=False)``: æå¹ã§ããã``pty=True`` ã¯ããã§ãçµæã¨ãã¦ã¯ã¹ããªã¼ã ã«ãã¼ã¸ããããããå®éã«ã¯å¤§ããéãã¯ããã¾ããã``combine_stderr`` ã§ã¯åé¡ãããã¾ããªã±ã¼ã¹ãé¿ããã«ã¯ä¾¿å©ããããã¾ãã(ã¾ã ç¥ããããã®ã¯ããã¾ããã)ã 