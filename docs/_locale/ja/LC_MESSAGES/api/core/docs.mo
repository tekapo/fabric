Þ    
      l      ¼       ð      ñ   0        8  H   Æ       n  ­  ø          >        ß     l  ,     Ã   ¸  h   |  ¤   å  Õ  	    `  Ë   û  >   Ç     	         
                               Documentation helpers For example, at the bottom of your ``conf.py``:: If you run this within an actual Fabric-code-using session (instead of within a Sphinx ``conf.py``), please seek immediate medical attention. Replace task objects on ``module`` with their wrapped functions instead. Specifically, look for instances of `~fabric.tasks.WrappedCallableTask` and replace them with their ``.wrapped`` attribute (the original decorated function.) This is intended for use with the Sphinx autodoc tool, to be run near the bottom of a project's ``conf.py``. It ensures that the autodoc extension will have full access to the "real" function, in terms of function signature and so forth. Without use of ``unwrap_tasks``, autodoc is unable to access the function signature (though it is able to see e.g. ``__doc__``.) You can go above and beyond, and explicitly **hide** all non-task functions, by saying ``hide_nontasks=True``. This renames all objects failing the "is it a task?" check so they appear to be private, which will then cause autodoc to skip over them. ``hide_nontasks`` is thus useful when you have a fabfile mixing in subroutines with real tasks and want to document *just* the real tasks. `~fabric.tasks.WrappedCallableTask`, `~fabric.decorators.task` Project-Id-Version: Fabric 1.8
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-02-15 23:24+0900
PO-Revision-Date: 2014-09-23 14:06+0900
Last-Translator: JOTAKI, Taisuke <tekapo@gmail.com>
Language-Team: Fabric ja <tekapo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
Language: ja
X-Generator: Poedit 1.6.9
 ãã­ã¥ã¡ã³ããã«ãã¼ ä¾ãã°ã``conf.py`` ã®æå¾ã®æ¹ã§:: ããå®éã®ã»ãã·ã§ã³ãä½¿ç¨ãã¦ããFabricã³ã¼ãåã§(Sphinxã® ``conf.py`` åã§ã¯ãªã)ãããå®è¡ããã®ãªããããã«çé¢ã§è¨ºã¦ããã£ã¦ãã ããã ``ã¢ã¸ã¥ã¼ã«`` ä¸ã®ã¿ã¹ã¯ãªãã¸ã§ã¯ããã©ãããããé¢æ°ã«ç½®ãæãã¾ãã ç¹ã« `~fabric.tasks.WrappedCallableTask` ã®ã¤ã³ã¹ã¿ã³ã¹ãæ¢ãããã® ``.wrapped`` å±æ§(åã®ãã³ã¬ã¼ããããé¢æ°)ã¨ç½®ãæãã¾ãã ããã¯Sphinxã®autodocãã¼ã«ã¨ã¨ãã«ä½¿ç¨ããããæå³ããã¦ãã¦ããã­ã¸ã§ã¯ãã® ``conf.py`` ã®æå¾ã®ã»ãã§å®è¡ããã¾ããautodocæ¡å¼µæ©è½ãé¢æ°ã·ã°ããã£ãªã©ã«ããã "å®éã®" é¢æ°ã«å¯¾ãã¦å®å¨ãªã¢ã¯ã»ã¹ãç¢ºå®ã«æã¤ããã«ãã¾ãã ``unwrap_tasks`` å©ç¨ãªãã§ã¯autodocã¯é¢æ°ã·ã°ããã£ã«ã¢ã¯ã»ã¹ã§ãã¾ãã(``__doc__`` ãªã©ã§è¦ããã¨ã¯ã§ãã¾ãã)ã ããä»¥ä¸ã®ãã¨ãå¯è½ã§ãã``hide_nontasks=True`` ã¨æå®ãããã¨ã«ãã£ã¦ã¿ã¹ã¯ä»¥å¤ã®ãã¹ã¦ã®é¢æ°ãæç¤ºçã« **é ã** ãã¨ãã§ãã¾ããããã«ãããã¹ã¦ã®ãªãã¸ã§ã¯ãã§ "ããã¯ã¿ã¹ã¯?" ã®ãã§ãã¯ã«å¤±æããããã«ãªãããã®ãããã©ã¤ãã¼ãã®ããã«è¦ãããã®çµæautodocã¯ããããã¹ã­ãããã¾ãã ãããã£ã¦ã``hide_nontasks`` ã¯ãfabfileã«å®éã®ã¿ã¹ã¯ãæã¤ãµãã«ã¼ãã³ãå¥ã£ã¦ãã¦ãæ¬å½ã®ã¿ã¹ã¯ *ã ã* ããã­ã¥ã¡ã³ãåãããã¨ãã«ä¾¿å©ã§ãã `~fabric.tasks.WrappedCallableTask`, `~fabric.decorators.task` 