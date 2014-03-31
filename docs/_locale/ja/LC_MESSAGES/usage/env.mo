Þ    v      Ì     |      ð	     ñ	     
  "   
  6   @
  !   w
  "   
     ¼
      Ð
     ñ
  &        +     ?     R     i               ª     ¾     Ú     î  
   ÿ  
   
          2  $   N     s       (   «  f   Ô     ;     Q     d  *   ~  +   ©     Õ  D   å  .   *     Y     r               ±  Â   Ã  à        g       ÿ            }   ¶  7  4  Â   l  #   /     S  7   Þ  Ë     #   â  q       x               ³     Á     Ô     è     û          $     0     H     P     a     y          ¢     ®     À     Ì     Ü  	   å     ï     ý               #     2     ?     K     \     i  °   v     '     5     >     L     U  
   a     l     }          «  	   ¸  	   Â     Ì     ß     ó            	   !     +     7     E     X  ë   a     M     Y     g       ©       Æ     ä  ?     >   B  )     *   «     Ö  (   ò        1   6      h                  ¾      Ü      ú      !  #   3!     W!     s!  
   !  
   !     !     ·!  $   Ó!     ø!     "  (   0"  f   Y"     À"     Ö"     é"  *   #  +   .#     Z#  D   j#  .   ¯#     Þ#     ÷#     $     $     6$    H$    e%     r&  '   &    ³&     È'  Æ   á'  Ù  ¨(  -  *  ?   °+  ©   ð+  K   ,    æ,     .     .  ³  ®.     b0     v0     0     0     ¬0     À0     Ó0     è0     ü0     1      1     (1     91     Q1     h1     z1     1     1     ¤1     ´1  	   ½1     Ç1     Õ1     æ1     î1     û1     
2     2     #2     42     A2    N2     T3     b3     k3     y3     3  
   3     3     ª3     Ã3     Ø3  	   å3  	   ï3     ù3     4      4     04     @4  	   N4     X4     d4     r4     4  V  4     å5     ñ5  Ò   ÿ5     Ò6     a      -         d          4   N   U   Z   m           1       q              M             D               F   (   !   ,                8   >   A   &   
   p   k   u         7   E   f   l       %           h          ^           "      K   R   )          T   +       `   _   ?   W   6              G   i   ]   2       Q          n   3   9         =       :      j   X   L         e   @      V   '      $   /                         .       Y   5      P   [   t   I   c   H       v       J       *   \   g          b   r           B           <       O           o   #   	   S   0   s   ;   C    **Default** ``False`` **Default**: ``True`` **Default:** User's local username **Default:** ``"sudo -S -p '%(sudo_prompt)s' " % env`` **Default:** ``"sudo password:"`` **Default:** ``$HOME/.ssh/config`` **Default:** ``''`` **Default:** ``/bin/bash -l -c`` **Default:** ``0`` **Default:** ``0`` (i.e. no keepalive) **Default:** ``10`` **Default:** ``1`` **Default:** ``False`` **Default:** ``None`` **Default:** ``True`` **Default:** ``[0]`` **Default:** ``[]`` **Default:** ``fabfile.py`` **Default:** ``{}`` :doc:`execution` :doc:`fab` :doc:`ssh` :option:`--abort-on-prompts` :option:`--command-timeout` :option:`--fabfile <-f>`, :doc:`fab` :option:`--forward-agent <-A>` :option:`--gateway <-g>` :option:`--hosts <-H>`, :doc:`execution` :option:`--initial-password-prompt <-I>`, :ref:`env.passwords <passwords>`, :ref:`password-management` :option:`--keepalive` :option:`--no-pty` :option:`--no_agent <-a>` :option:`--parallel <-P>`, :doc:`parallel` :option:`--pool-size <-z>`, :doc:`parallel` :option:`--set` :option:`--skip-bad-hosts`, :ref:`excluding-hosts`, :doc:`execution` :option:`--ssh-config-path`, :ref:`ssh-config` :option:`--version <-V>` :option:`-k` :ref:`linewise-output` :ref:`password-management` :ref:`ssh-config` A simple but integral aspect of Fabric is what is known as the "environment": a Python dictionary subclass, which is used as a combination settings registry and shared inter-task data namespace. As mentioned, the ``env`` object is simply a dictionary subclass, so your own fabfile code may store information in it as well. This is sometimes useful for keeping state between multiple tasks within a single execution run. Environment as configuration Environment as shared state For example, there are many situations where setting ``warn_only`` (see below) is useful. To apply it to a few lines of code, use ``settings(warn_only=True)``, as seen in this simplified version of the ``contrib`` `~fabric.contrib.files.exists` function:: Full list of env vars In future versions, Fabric will become threadsafe, at which point ``env`` may be the only easy/safe way to keep global state. In many situations, it's useful to only temporarily modify ``env`` vars so that a given settings change only applies to a block of code. Fabric provides a `~fabric.context_managers.settings` context manager, which takes any number of key/value pairs and will use them to modify ``env`` within its wrapped block. Most of Fabric's behavior is controllable by modifying ``env`` variables, such as ``env.hosts`` (as seen in :ref:`the tutorial <defining-connections>`). Other commonly-modified env vars include: Remote command timeout, in seconds. See the :doc:`../api/core/context_managers` API documentation for details on `~fabric.context_managers.settings` and other, similar tools. The `~fabric.context_managers.settings` context manager The environment dict is currently implemented as a global singleton, ``fabric.state.env``, and is included in ``fabric.api`` for convenience. Keys in ``env`` are sometimes referred to as "env variables". The environment dictionary, ``env`` There are a number of other env variables; for the full list, see :ref:`env-vars` at the bottom of this document. This aspect of ``env`` is largely historical: in the past, fabfiles were not pure Python and thus the environment was the only way to communicate between tasks. Nowadays, you may call other tasks or subroutines directly, and even keep module-level shared state if you wish. ``abort_exception`` ``abort_on_prompts`` ``all_hosts`` ``always_use_pty`` ``colorize_errors`` ``combine_stderr`` ``command_prefixes`` ``command_timeout`` ``command`` ``connection_attempts`` ``cwd`` ``dedupe_hosts`` ``disable_known_hosts`` ``eagerly_disconnect`` ``exclude_hosts`` ``fabfile`` ``forward_agent`` ``gateway`` ``host_string`` ``host`` ``hosts`` ``keepalive`` ``key_filename`` ``key`` ``linewise`` ``local_user`` ``no_agent`` ``no_keys`` ``ok_ret_codes`` ``parallel`` ``password`` ``password``: Used to explicitly set your default connection or sudo password if desired. Fabric will prompt you when necessary if this isn't set or doesn't appear to be valid. ``passwords`` ``path`` ``pool_size`` ``port`` ``prompts`` ``rcfile`` ``real_fabfile`` ``reject_unknown_hosts`` ``remote_interrupt`` ``roledefs`` ``roles`` ``shell`` ``skip_bad_hosts`` ``ssh_config_path`` ``sudo_prefix`` ``sudo_prompt`` ``sudo_user`` ``tasks`` ``timeout`` ``use_shell`` ``use_ssh_config`` ``user`` ``user``: Fabric defaults to your local username when making SSH connections, but you can use ``env.user`` to override this if necessary. The :doc:`execution` documentation also has info on how to specify usernames on a per-host basis. ``version`` ``warn_only`` ``warn_only``: a Boolean setting determining whether Fabric exits when detecting errors on the remote end. See :doc:`execution` for more on this behavior. `~fabric.operations.sudo` Project-Id-Version: Fabric 1.8
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-02-15 23:24+0900
PO-Revision-Date: 2014-03-31 18:29+0900
Last-Translator: JOTAKI, Taisuke <tekapo@gmail.com>
Language-Team: LANGUAGE <tekapo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
Language: ja
X-Generator: Poedit 1.6.4
X-Poedit-SourceCharset: UTF-8
 **ããã©ã«ã** ``False`` **ããã©ã«ã**: ``True`` **ããã©ã«ã:** ã¦ã¼ã¶ã¼ã®ã­ã¼ã«ã«ã¦ã¼ã¶ã¼å **ããã©ã«ã:** ``"sudo -S -p '%(sudo_prompt)s' " % env`` **ããã©ã«ã:** ``"sudo password:"`` **ããã©ã«ã:** ``$HOME/.ssh/config`` **ããã©ã«ã:** ``''`` **ããã©ã«ã:** ``/bin/bash -l -c`` **ããã©ã«ã:** ``0`` **ããã©ã«ã:** ``0`` (ä¾: keepaliveç¡ã) **ããã©ã«ã:** ``10`` **ããã©ã«ã:** ``1`` **ããã©ã«ã:** ``False`` **ããã©ã«ã:** ``None`` **ããã©ã«ã:** ``True`` **ããã©ã«ã:** ``[0]`` **ããã©ã«ã:** ``[]`` **ããã©ã«ã:** ``fabfile.py`` **ããã©ã«ã:** ``{}`` :doc:`execution` :doc:`fab` :doc:`ssh` :option:`--abort-on-prompts` :option:`--command-timeout` :option:`--fabfile <-f>`, :doc:`fab` :option:`--forward-agent <-A>` :option:`--gateway <-g>` :option:`--hosts <-H>`, :doc:`execution` :option:`--initial-password-prompt <-I>`, :ref:`env.passwords <passwords>`, :ref:`password-management` :option:`--keepalive` :option:`--no-pty` :option:`--no_agent <-a>` :option:`--parallel <-P>`, :doc:`parallel` :option:`--pool-size <-z>`, :doc:`parallel` :option:`--set` :option:`--skip-bad-hosts`, :ref:`excluding-hosts`, :doc:`execution` :option:`--ssh-config-path`, :ref:`ssh-config` :option:`--version <-V>` :option:`-k` :ref:`linewise-output` :ref:`password-management` :ref:`ssh-config` Fabricã®ã·ã³ãã«ã ããã©ãä¸å¯æ¬ ãªå´é¢ã¯ "(ç°å¢)environment" ã¨ãã¦ç¥ããã¦ãããã®ã§ããããã¯Pythonã®è¾æ¸ãµãã¯ã©ã¹ã§ãè¨­å®ã¬ã¸ã¹ããªã®çµã¿åããã¨ãã¦å©ç¨ãããã¿ã¹ã¯éã®ãã¼ã¿ç©ºéã§å±æããã¾ãã åè¿°ã®ã¨ããã ``env`` ãªãã¸ã§ã¯ãã¯åç´ãªè¾æ¸ãµãã¯ã©ã¹ã§ãèªåã®fabfileã³ã¼ãã«ãä¿ç®¡ãããã¨ãã§ãã¾ããããã¯åä¸ã®å®è¡åã«è¤æ°ã®ã¿ã¹ã¯éã§ç¶æãä¿æããã®ã«ä¾¿å©ãªãã¨ãæãã¾ãã è¨­å®ã¨ãã¦ã®ç°å¢ å±æãããç¶æã¨ãã¦ã®ç°å¢ ä¾ãã°ã ``warn_only`` (ä¸ãåç§)è¨­å®ãä¾¿å©ãªç¶æ³ã¯ããããããã¨æãã¾ãããããä½è¡ãã®ã³ã¼ãã«é©ç¨ããã«ã¯ ``contrib`` `~fabric.contrib.files.exists` é¢æ°ã«ããããã«ã ``settings(warn_only=True)`` ãä½¿ãã¾ãã:: envå¤æ°ã®å¨ãªã¹ã å°æ¥ã®ãã¼ã¸ã§ã³ã§ã¯ãFabricã¯ã¹ã¬ããã»ã¼ãã«ãªãããã®æç¹ã§ ``env`` ã¯ã°ã­ã¼ãã«ãªç¶æãä¿æããå¯ä¸ã®ç°¡åã§å®å¨ãªæ¹æ³ã«ãªãã§ãããã å¤ãã®ã±ã¼ã¹ã§ãä¸æçã« ``env`` å¤æ°ã®å¤æ´ãã§ãã¦ãä¸ããããè¨­å®å¤æ´ãããã³ã¼ããã­ãã¯ã ãã«é©ç¨ãããæ¹ãä¾¿å©ãªãã¨ããã¾ããFabricã¯ `~fabric.context_managers.settings` ã³ã³ãã­ã¹ãããã¼ã¸ã£ãæä¾ãã¦ãã¾ããããã¯ä»»æã®æ°ã®ã­ã¼/ããªã¥ã¼ã®ãã¢ãåããã¨ãã§ããããã§ã©ããããããã­ãã¯åã® ``env`` ãå¤æ´ããã®ã«å©ç¨ã§ãã¾ãã Fabricã®ã»ã¨ãã©ã®æåã¯ ``env`` å¤æ°ãä¾ãã° :ref:`ãã¥ã¼ããªã¢ã« <defining-connections>` ã§è¦ããã ``env.hosts`` ãªã©ãå¤æ´ãããã¨ã«ãã£ã¦ã³ã³ãã­ã¼ã«ããã¾ããããå¤æ´ããã¦å©ç¨ããã ``env``  å¤æ°ã¯ä»¥ä¸ã®ãã®ãããã¾ã: ãªã¢ã¼ãã³ãã³ãã®ã¿ã¤ã ã¢ã¦ããç§ã§æå®ã `~fabric.context_managers.settings` ã¨ãã®ä»é¡ä¼¼ã®ãã¼ã«ã«é¢ããè©³ç´°ã¯ :doc:`../api/core/context_managers` APIãã­ã¥ã¡ã³ãããè¦§ãã ããã `~fabric.context_managers.settings` ã®ã³ã³ãã­ã¹ãããã¼ã¸ã£ã¼ ãã®ç°å¢è¾æ¸ã¯ã°ã­ã¼ãã«ãªã·ã³ã°ã«ãã³ã ``fabric.state.env`` ã¨ãã¦ç¾å¨ã¯å®è£ããã¦ãã¦ãä¾¿å©ãªããã« ``fabric.api`` åã«å«ã¾ãã¦ãã¾ãã ``env`` ã®ã­ã¼ã¯ "env variables(ç°å¢å¤æ°)" ã¨ãã¦è¨åãããã¨ãããã¾ãã ç°å¢è¾æ¸ã ``env`` ä»ã«ãããããã® env å¤æ°ãæãã¾ããå®å¨ãªä¸è¦§ã¯ãã®ãã­ã¥ã¡ã³ãã®ä¸ã :ref:`env-vars` ããè¦§ãã ããã ``env`` ã®ãã®å´é¢ã¯å¤åã«æ­´å²çãªãã®ã§ããä»¥åã¯ãfabfileã¯ç´ç²ãªPythonã§ã¯ããã¾ããã§ããã®ã§ããã®ãç°å¢ããã¿ã¹ã¯éã§ããã¨ãããããã®å¯ä¸ã®æ¹æ³ã§ãããç¾å¨ã§ã¯ãä»ã®ã¿ã¹ã¯ããµãã«ã¼ãã³ããã¤ã¬ã¯ãã«å¼ã³åºããã¨ãã§ããå¿è¦ãªãã¢ã¸ã¥ã¼ã«ã¬ãã«ã§ã®å±æãããç¶æãä¿æãããã¨ããã§ãã¾ãã ``abort_exception`` ``abort_on_prompts`` ``all_hosts`` ``always_use_pty`` ``colorize_errors`` ``combine_stderr`` ``command_prefixes`` ``command_timeout`` ``command`` ``connection_attempts`` ``cwd`` ``dedupe_hosts`` ``disable_known_hosts`` ``eagerly_disconnect`` ``exclude_hosts`` ``fabfile`` ``forward_agent`` ``gateway`` ``host_string`` ``host`` ``hosts`` ``keepalive`` ``key_filename`` ``key`` ``linewise`` ``local_user`` ``no_agent`` ``no_keys`` ``ok_ret_codes`` ``parallel`` ``password`` ``password``: å¿è¦ã«å¿ãã¦ããã©ã«ãæ¥ç¶ãsudoã®ãã¹ã¯ã¼ããè¨­å®ããããã«ä½¿ç¨ãã¾ããFabricã¯ããã®å¤ãè¨­å®ããã¦ããªãå ´åãæ­£ãããªãå ´åã«å¿è¦ã«ãªã£ãæã«ãã­ã³ãããè¡¨ç¤ºãã¾ãã ``passwords`` ``path`` ``pool_size`` ``port`` ``prompts`` ``rcfile`` ``real_fabfile`` ``reject_unknown_hosts`` ``remote_interrupt`` ``roledefs`` ``roles`` ``shell`` ``skip_bad_hosts`` ``ssh_config_path`` ``sudo_prefix`` ``sudo_prompt`` ``sudo_user`` ``tasks`` ``timeout`` ``use_shell`` ``use_ssh_config`` ``user`` ``user``: SSHæ¥ç¶ãå®è¡ããã¨ãã®Fabricã®ããã©ã«ãã®å¤ã¯ãèªåã®ã­ã¼ã«ã«ã¦ã¼ã¶ã¼åã§ãå¿è¦ãªã ``env.user`` ãä½¿ã£ã¦ãªã¼ãã¼ã©ã¤ãã§ãã¾ããã¾ãããã­ã¥ã¡ã³ãã® :doc:`execution` ã«ã¯ãã¹ããã¨ã«ã¦ã¼ã¶ã¼åãæå®ããããã®æå ±ãè¨è¼ããã¦ãã¾ãã ``version`` ``warn_only`` ``warn_only``: ãªã¢ã¼ãå´ã§ã¨ã©ã¼ãæ¤ç¥ããã¨ãã«Fabricãçµäºãããã©ãããæ±ºãããã¼ã«è¨­å®ã§ãããã®æåã«é¢ããè©³ç´°ã¯ :doc:`execution` ããè¦§ãã ããã `~fabric.operations.sudo` 