Þ          L      |       ¨      ©      Æ     Ø      å  |   ö    s             k  1       ¶   ¶                                         Fabfile construction and use Fabfile discovery Fabric is capable of loading Python modules (e.g. ``fabfile.py``) or packages (e.g. a ``fabfile/`` directory containing an ``__init__.py``). By default, it looks for something named (to Python's import machinery) ``fabfile`` - so either ``fabfile/`` or ``fabfile.py``. Importing Fabric This document contains miscellaneous sections about fabfiles, both how to best write them, and how to use them once written. Project-Id-Version: Fabric 1.8
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-02-15 23:24+0900
PO-Revision-Date: 2014-04-13 13:15+0900
Last-Translator: JOTAKI, Taisuke <tekapo@gmail.com>
Language-Team: Fabric ja <tekapo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
Language: ja_JP
X-Generator: Poedit 1.6.4
 fabfileã®æ§æã¨ä½¿ãæ¹ fabfileã®æ¢ç´¢ Fabricã¯Pythonã®ã¢ã¸ã¥ã¼ã«(ä¾ãã° ``fabfile.py``)ãããã±ã¼ã¸(ä¾ãã°  ``__init__.py`` ãå«ãã§ãã ``fabfile/`` ãã£ã¬ã¯ããª)ãèª­ã¿è¾¼ããã¨ãã§ãã¾ããããã©ã«ãã§ã¯ã(Pythonã®ã¤ã³ãã¼ãæ©æ§ã«ãããã£ã¦) ``fabfile`` ã¨åä»ãããã ``fabfile/`` ãããã¯ ``fabfile.py`` ãæ¢ãã¾ãã Fabricã®ã¤ã³ãã¼ã ãã®ãã­ã¥ã¡ã³ãã¯fabfileã«é¢ããéå¤ãªã»ã¯ã·ã§ã³ãå«ãã§ãã¾ããåªããfabfileã®ä½ææ¹æ³ã¨ä½æå¾ã®å©ç¨ã®ä»æ¹ã®ä¸¡æ¹ãå«ã¿ã¾ãã 