Þ    X      Ü                     °  (   À     é  ,   ÿ  3   ,  -   `  R     R   á     4	     O	  T   a	  £   ¶	     Z
  ù   u
  ÷   o  Ï   g     7  Ë   W     #  	   D  x   N     Ç  -   Ü  m   
  ¤  x  c     ý     i     ±   é          (  D   Å     
  Ä        Y    ã  \   ë  '   H  -   p         ²  æ   Å     ¬  E   ¼  f     Y   i  |   Ã     @     Ï  U   X  :   ®  P   é  i   :     ¤     1   V   µ   ¢   !  x   ¯!     ("  N   ²"  x   #  Z   z#  2   Õ#  z   $     $     
%     %  £   £%  %  G&     m'  æ   	(  ^  ð(  ô   O*  A   D+  m   +  |   ô+  Ë   q,  @  =-  #   ~.     ¢.  =  À.  3   þ/     20     R0  >   S1  6   1  Ä  É1     3     ¥3  (   µ3     Þ3  ,   ô3  3   !4  -   U4  R   4  R   Ö4     )5     D5  g   V5     ¾5  G   S6  ý   6  1  7  Ô   Ë8  -    9  û   Î9  =  Ê:     <     <  '   ©<  :   Ñ<  o   =  þ  |=  u   {?  0  ñ?  b   "A  ã   A  §   iB     C  M   ¨C  ~   öC  ä   uD  £   ZE  4  þE  t   3G  3   ¨G  B   ÜG    H     8I    HI     fJ  c   vJ  q   ÚJ  u   LK     ÂK     XL  «   ÷L     £M  K   %N  a   qN  |   ÓN  Ë   PO     P  c   ±P     Q  {   ´Q     0R  [   ¿R      S  z   ¼S  <   7T     tT     U     U  ©   ¨U  ·   RV  W  
W     bX  ò   íX    àY    c[  L   h\     µ\  ¥   A]    ç]    _  ,   %`      R`    s`  3   b  ,   7b     db  ,   c  5   ²c     O   3       @       ;   &         7           P       #         /       T   -   0   R                  N   ?   >                 U       I          	   (       +      "       <       Q   $      :   B   6      A   L   =                     D   S       K       1   .          %                     
   !                         8                 M       F       J   V       X   2                           W      '       )   5   H   E   ,   9   *      G   C          4           :doc:`/usage/parallel` :doc:`fabfiles` :option:`--initial-password-prompt <-I>` :option:`--list <-l>` :option:`--shortlist`, :option:`--list <-l>` :option:`--shortlist`, :option:`--list-format <-F>` :ref:`env.command_timeout <command-timeout>`, :ref:`env.connection_attempts <connection-attempts>`, :ref:`env.timeout <timeout>` :ref:`env.timeout <timeout>`, :ref:`env.connection_attempts <connection-attempts>` :ref:`password-management` :ref:`ssh-config` A comma-separated list of :doc:`output levels <output_controls>` to hide by default. A quick overview of all possible command line options can be found via ``fab --help``. If you're looking for details on a specific option, we go into detail below. Added docstring to output. Again, since the ``hosts`` kwarg is removed from the argument list sent to the ``new_user`` task function, the actual Python invocation would be ``new_user('myusername')``, and the function would be executed on a host list of ``['host1', 'host2']``. Allows control over the output format of :option:`--list <-l>`. ``short`` is equivalent to :option:`--shortlist`, ``normal`` is the same as simply omitting this option entirely (i.e. the default), and ``nested`` prints out a nested namespace tree. Allows you to set default values for arbitrary Fabric env vars. Values set this way have a low precedence -- they will not override more specific env vars which are also specified on the command line. E.g.:: Arbitrary remote shell commands As detailed in :doc:`../tutorial` and :doc:`execution`, this will run ``task1`` followed by ``task2``, assuming that Fabric was able to find a fabfile nearby containing Python functions with those names. As mentioned in :ref:`the section on task execution <hosts-per-task-cli>`, there are a handful of per-task keyword arguments (``host``, ``hosts``, ``role`` and ``roles``) which do not actually map to the task functions themselves, but are used for setting per-task host and/or role lists. Basic use By default, Fabric looks for ``~/.fabricrc``, and this may be overridden by specifying the :option:`-c` flag to ``fab``. Command-line options Displays Fabric's version number, then exits. Displays a standard help message, with all possible options and a brief overview of what they do, then exits. Fabric currently honors a simple user settings file, or ``fabricrc`` (think ``bashrc`` but for ``fab``) which should contain one or more key-value pairs, one per line. These lines will be subject to ``string.split('=')``, and thus can currently only be used to specify string settings. Any such key-value pairs will be used to update :doc:`env <env>` when ``fab`` runs, and is loaded prior to the loading of any fabfile. Fabric leverages a lesser-known command line convention and may be called in the following manner:: For example, if your typical SSH login username differs from your workstation username, and you don't want to modify ``env.user`` in a project's fabfile (possibly because you expect others to use it as well) you could write a ``fabricrc`` file like so:: For example, let's say you just wanted to get the kernel info for a bunch of systems; you could do this:: Forces a password prompt at the start of the session (after fabfile load and option parsing, but before executing any tasks) in order to pre-fill :ref:`env.password <password>`. Forces output to be buffered line-by-line instead of byte-by-byte. Often useful or required for :ref:`parallel execution <linewise-output>`. However, it's possible to expand this simple usage into something more flexible, by using the provided options and/or passing arguments to individual tasks. If both args are given, you can again give them as positional args:: If both the plural and singular forms of these kwargs are given, the value of the plural will win out and the singular will be discarded. Imports a fabfile as normal, but then prints a list of all discovered tasks and exits. Will also print the first line of each task's docstring, if it has one, next to it (truncating if necessary.) In its most simple form, ``fab`` may be called with no options at all, and with one or more arguments, which should be task names, e.g.:: Most of the time you will want to just write out the task in your fabfile (anything you use once, you're likely to use again) but this feature provides a handy, fast way to quickly dash off an SSH-borne command while leveraging your fabfile's connection settings. Multiple ``KEY=VALUE`` pairs may be comma-separated, e.g. ``fab --set var1=val1,var2=val2``. Or mix and match, just like in Python:: Or treat it as an explicit keyword argument:: Other than basic string values, you may also set env vars to True by omitting the ``=VALUE`` (e.g. ``fab --set KEY``), and you may set values to the empty string (and thus a False-equivalent value) by keeping the equals sign, but omitting ``VALUE`` (e.g. ``fab --set KEY=``.) Per-task arguments Prints the entire docstring for the given task, if there is one. Does not currently print out the task's function signature, so descriptive docstrings are a good idea. (They're *always* a good idea, of course -- just moreso here.) Roles and hosts Set connection timeout in seconds. Sets :ref:`env.timeout <timeout>`. Set number of times to attempt connections. Sets :ref:`env.connection_attempts <connection-attempts>`. Set remote command timeout in seconds. Sets :ref:`env.command_timeout <command-timeout>`. Sets :ref:`env.abort_on_prompts <abort-on-prompts>` to ``True``, forcing Fabric to abort whenever it would prompt for input. Sets :ref:`env.disable_known_hosts <disable-known-hosts>` to ``True``, preventing Fabric from loading the user's SSH :file:`known_hosts` file. Sets :ref:`env.exclude_hosts <exclude-hosts>` to the given comma-delimited list of host strings to then keep out of the final host list. Sets :ref:`env.forward_agent <forward-agent>` to ``True``, enabling agent forwarding. Sets :ref:`env.gateway <gateway>` to ``HOST`` host string. Sets :ref:`env.hosts <hosts>` to the given comma-delimited list of host strings. Sets :ref:`env.keepalive <keepalive>` to the given (integer) value, specifying an SSH keepalive interval. Sets :ref:`env.no_agent <no_agent>` to ``True``, forcing our SSH layer not to talk to the SSH agent when trying to unlock private key files. Sets :ref:`env.no_keys <no_keys>` to ``True``, forcing the SSH layer to not look for SSH private key files in one's home directory. Sets :ref:`env.parallel <env-parallel>` to ``True``, causing tasks to run in parallel. Sets :ref:`env.password <password>` to the given string; it will then be used as the default password when making SSH connections or calling the ``sudo`` program. Sets :ref:`env.pool_size <pool-size>`, which specifies how many processes to run concurrently during parallel execution. Sets :ref:`env.rcfile <rcfile>` to the given file path, which Fabric will try to load on startup and use to update environment variables. Sets :ref:`env.roles <roles>` to the given comma-separated list of role names. Sets :ref:`env.shell <shell>` to the given string, overriding the default shell wrapper used to execute remote commands. Sets :ref:`env.skip_bad_hosts <skip-bad-hosts>`, causing Fabric to skip unavailable hosts. Sets :ref:`env.ssh_config_path <ssh-config-path>`. Sets :ref:`env.user <user>` to the given string; it will then be used as the default username when making SSH connections. Sets :ref:`env.warn_only <warn_only>` to ``True``, causing Fabric to continue execution even when commands encounter error conditions. Settings files Similar to :option:`--list <-l>`, but without any embellishment, just task names separated by newlines with no indentation or docstrings. The fabfile name pattern to search for (defaults to ``fabfile.py``), or alternately an explicit file path to load as the fabfile (e.g. ``/path/to/my/fabfile.py``.) The most common method for utilizing Fabric is via its command-line tool, ``fab``, which should have been placed on your shell's executable path when Fabric was installed. ``fab`` tries hard to be a good Unix citizen, using a standard style of command-line switches, help output, and so forth. The value entered into this prompt will *overwrite* anything supplied via :ref:`env.password <password>` at module level, or via :option:`--password <-p>`. Then, when running ``fab``, your fabfile would load up with ``env.user`` set to ``'ssh_user_name'``. Other users of that fabfile could do the same, allowing the fabfile itself to be cleanly agnostic regarding the default username. These special kwargs are **removed** from the args/kwargs sent to the task function itself; this is so that you don't run into TypeErrors if your task doesn't define the kwargs in question. (It also means that if you **do** define arguments with these names, you won't be able to specify them in this manner -- a regrettable but necessary sacrifice.) This is useful for fire-and-forget runs (especially parallel sessions, in which runtime input is not possible) when setting the password via :option:`--password <-p>` or by setting :ref:`env.password <password>` in your fabfile, is undesirable. Use a colon (``:``) to separate the task name from its arguments; Use commas (``,``) to separate arguments from one another (may be escaped by using a backslash, i.e. ``\,``); Use equals signs (``=``) for keyword arguments, or omit them for positional arguments. May also be escaped with backslashes. When set to a file path, will load the given file as an SSH identity file (usually a private key.) This option may be repeated multiple times. Sets (or appends to) :ref:`env.key_filename <key-filename>`. When using the plural form of these arguments, one must use semicolons (``;``) since commas are already being used to separate arguments from one another. Furthermore, since your shell is likely to consider semicolons a special character, you'll want to quote the host list string to prevent shell interpretation, e.g.:: You can specify just the username:: ``fab`` options and arguments ``fab`` uses Python's `optparse`_ library, meaning that it honors typical Linux or GNU style short and long options, as well as freely mixing options and arguments. E.g. ``fab task1 -H hostname task2 -i path/to/keyfile`` is just as valid as the more straightforward ``fab -H hostname -i path/to/keyfile task1 task2``. `~fabric.operations.run`, `~fabric.operations.sudo` as if it were executed thusly:: where everything after the ``--`` is turned into a temporary `~fabric.operations.run` call, and is not parsed for ``fab`` options. If you've defined a host list at the module level or on the command line, this usage will act like a one-line anonymous task. which would be literally equivalent to the following fabfile:: will result in ``env.password = 'bar'``, not ``'foo'`` Project-Id-Version: fabric docs 1_8_2
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-02-15 23:41+0900
PO-Revision-Date: 2014-03-22 09:56+0900
Last-Translator: JOTAKI, Taisuke <tekapo@gmail.com>
Language-Team: Japanese (http://www.transifex.com/projects/p/fabric-docs-1_8_2/language/ja/)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Language: ja
Plural-Forms: nplurals=1; plural=0;
X-Generator: Poedit 1.6.4
 :doc:`/usage/parallel` :doc:`fabfiles` :option:`--initial-password-prompt <-I>` :option:`--list <-l>` :option:`--shortlist`, :option:`--list <-l>` :option:`--shortlist`, :option:`--list-format <-F>` :ref:`env.command_timeout <command-timeout>`, :ref:`env.connection_attempts <connection-attempts>`, :ref:`env.timeout <timeout>` :ref:`env.timeout <timeout>`, :ref:`env.connection_attempts <connection-attempts>` :ref:`password-management` :ref:`ssh-config` ããã©ã«ãã§é ãã³ã³ãã§åºåã£ã :doc:`output levels <output_controls>` ã®ãªã¹ãã å©ç¨å¯è½ãªã³ãã³ãã©ã¤ã³ã»ãªãã·ã§ã³ã®æ¦è¦ã¯ ``fab --help`` ã§è¡¨ç¤ºã§ãã¾ãããªãã·ã§ã³ã®è©³ç´°ã¯ä»¥ä¸ã§ãã åºåã«ãã­ã¥ã¡ã³ãã¼ã·ã§ã³æå­å(docstring)ãè¿½å ã  ``new_user`` ã¿ã¹ã¯é¢æ°ã«éãããã¨ã ``hosts`` kwarg ã¯å¼æ°ãªã¹ãããé¤ããã¾ããå®éãPython ã®å¼ã³åºãã¯ ``new_user('myusername')`` ã§, ``['host1', 'host2']`` ã®ãã¹ããªã¹ãã§é¢æ°ãå®è¡ããã¾ãã :option:`--list <-l>` ã®åºåãã©ã¼ããããå¶å¾¡ãã¾ãã. ``short`` ã¯ :option:`--shortlist` ã¨åãã ``normal`` ã¯åã«ãã®ãªãã·ã§ã³ã®çç¥ã¨åãã§ã(ããªãã¡ããã©ã«ã)ãããã¦ ``nested`` ã¯ãã¹ããããååç©ºéã®ããªã¼ãåºåãã¾ãã Allows you to set default values for arbitrary Fabric env vars. Values set this way have a low precedence -- they will not override more specific env vars which are also specified on the command line. ä¾ãã°:: ä»»æã®ãªã¢ã¼ãã·ã§ã«ã»ã³ãã³ã  :doc:`../tutorial` ã¨ :doc:`execution` ã§è©³ããèª¬æããã¦ãã¾ãããããã¯ ``task1`` ã«ç¶ã ``task2`` ãå®è¡ãã¾ãããã ã Fabricããããã®ååã®Pythoné¢æ°ãå«ãã fabfileãè¦ã¤ããããã°ã§ããã :ref:`the section on task execution <hosts-per-task-cli>` ã§è¨åããããã«ããã¤ãã® per-task ã­ã¼ã¯ã¼ãå¼æ°ãããã¾ãã(``host``, ``hosts``, ``role`` ,``roles``) ããã¯å®éã«ã¯ã¿ã¹ã¯é¢æ°ã«ãããããã¾ããã per-task host ã roleãªã¹ãã®è¨­å®ã«ä½¿ããã¾ãã åºæ¬çãªä½¿ãæ¹ ããã©ã«ãã§ Fabric ã¯ ``~/.fabricrc`` æ¢ãã¾ãããããã¯ ``fab`` ã®ãªãã·ã§ã³ :option:`-c` ã§å¤æ´ã§ãã¾ãã ã³ãã³ãã©ã¤ã³ã»ãªãã·ã§ã³ Fabric ã®ãã¼ã¸ã§ã³ãè¡¨ç¤ºãã¦çµäºãã¾ãã ãã¹ã¦ã®ãªãã·ã§ã³ã¨ç°¡åãªèª¬æããããã«ãã¡ãã»ã¼ã¸ãè¡¨ç¤ºãã¦çµäºãã¾ãã Fabric ã¯ç¾å¨ã·ã³ãã«ãªã¦ã¼ã¶ã¼è¨­å®ãã¡ã¤ã«ã``fabricrc`` (``fab`` ã®ããã® ``bashrc`` ã®ãããª)ãä½¿ãã¾ããããã«ã¯ä¸ã¤ä»¥ä¸ã® ã­ã¼/å¤ ã®ãã¢ã®è¡ãããã¾ããæ¸å¼ã¯ ``string.split('=')`` ã«å¾ãã¾ããç¾å¨ã¯ç¹å®ã®æå­åã®è¨­å®ã«ä½¿ããã¾ãããã®ãããªã­ã¼/å¤ã®ãã¢ã¯ ``fab`` ãå®è¡ãããã¨ãã« :doc:`env <env>` ã®æ´æ°ã«ä½¿ããã¾ããããã¯ fabfile ãèª­ã¿è¾¼ã¾ããåã«ã­ã¼ãããã¾ãã Fabric ã¯ãã¾ãç¥ããã¦ããªãã³ãã³ãã©ã¤ã³ã®è¨è¿°ã§æ¬¡ã®ããã«å¼ã¶ãã¨ãã§ãã¾ã:: ä¾ãã°ã¯ã¼ã¯ã¹ãã¼ã·ã§ã³ã®ã¦ã¼ã¶ã¼åã¨ SSH ã­ã°ã¤ã³ã®ã¦ã¼ã¶ã¼åãéãã¨ãã«ãã­ã¸ã§ã¯ãã§ä½¿ã fabfile ã® ``env.user`` ãå¤æ´ãããã¯ãªãã§ãããã(æããä»ã®äººãä½¿ãã§ããããã) ``fabricrc`` ãã¡ã¤ã«ããã®æ§ã«ãã¾ã:: ä¾ãã°ã·ã¹ãã ã®ã«ã¼ãã«æå ±ãã¾ã¨ãã¦åå¾ããã«ã¯ãã®æ§ã«ãã¾ã:: pre-fill :ref:`env.password <password>` ã®ããã«ã»ãã·ã§ã³éå§æã«ãã¹ã¯ã¼ããè¦æ±ããããã«å¼·å¶ãã¾ãã(fabfile ãã­ã¼ããã¦ãªãã·ã§ã³ãè§£æãã¦ã¿ã¹ã¯ãå®è¡ããç´å)ã åºåãããã¡ããã¤ããã¨ã§ãªãè¡ãã¨ã«å¼·å¶ãã¾ãã:ref:`parallel execution <linewise-output>` ã«æå¹ã§ããã¾ãå¿è¦ã«ãªãã¾ãã ããããªãã·ã§ã³ãããããã®ã¿ã¹ã¯ã«æ¸¡ãããå¼æ°ãä½¿ã£ã¦ããã«ãã¬ã­ã·ãã«ã«æ¡å¼µãããã¨ãã§ãã¾ãã ããä¸¡æ¹ãä¸ããããããåã³ä½ç½®ãã©ã¡ã¼ã¿ã¼ã¨ãã¦:: kwargs ã« plural ã¨ singular ã®ä¸¡æ¹ãä¸ããããããplural ã®å¤ãåªåãã singular ã¯æ£ã¦ããã¾ãã éå¸¸éã fabfile ãã¤ã³ãã¼ããã¦è¦ã¤ãã£ãã¿ã¹ã¯ã®ãªã¹ããè¡¨ç¤ºãã¦çµäºãã¾ããã¾ãã¿ã¹ã¯ã®ãã­ã¥ã¡ã³ãæå­åã®æåã®è¡ãè¡¨ç¤ºãã¾ããå¿è¦ãªãåãè©°ãã¾ãã æãã·ã³ãã«ãªãã®ã§ã¯ ``fab`` ã¯å¨ããªãã·ã§ã³ãªãã§ããããã¯1ã¤ã2ã¤ã®ã¿ã¹ã¯åãå¼æ°ã¨ãã¦å¼ã°ãã¾ããä¾ãã°:: ã»ã¨ãã©ã®å ´åã¿ã¹ã¯ã¯ fabfile ã«æ¸ããã¨ã«ãªãã§ãããã(ä¸åº¦ä½¿ã£ããã®ã¯ãããä¸åº¦ä½¿ããã¨ã«ãªãã§ããããã) ããããã®æ©è½ã¯ fabfile ã®æ¥ç¶è¨­å®ãå©ç¨ãã¦ããæã«ã§æè»½ã§ãã°ãã SSH-borne ã³ãã³ããå®è¡ã§ãã¾ãã è¤æ°ã® ``KEY=VALUE`` ã¯ã«ã³ãã§åºåãã¾ããä¾ãã° ``fab --set var1=val1,var2=val2`` ã®ããã«ã ãããã¯ Python ã®ããã« mix and matchã§:: ãããã¯ä»»æã®ã­ã¼ã¯ã¼ãå¼æ°ã¨ãã¦æ±ãã¾ãã Other than basic string values, you may also set env vars to True by omitting the ``=VALUE`` (ä¾ãã° ``fab --set KEY``), and you may set values to the empty string (and thus a False-equivalent value) by keeping the equals sign, but omitting ``VALUE`` (e.g. ``fab --set KEY=``.) Per-task å¼æ° æå®ããã¿ã¹ã¯ã®ãã­ã¥ã¡ã³ãæå­åããã¹ã¦è¡¨ç¤ºãã¾ããã¿ã¹ã¯ã®é¢æ°ã®ã·ã°ããã£ã¼ã¯è¡¨ç¤ºãã¾ããã ãã­ã¥ã¡ã³ãæå­åãèª¬æã«ä½¿ãã®ã¯è¯ãã¢ã¤ãã¢ã§ãã(They're *always* a good idea, of course -- just moreso here.) Roles ã¨ hosts æ¥ç¶ã®ã¿ã¤ã ã¢ã¦ããç§ã§æå®ãã¾ãã :ref:`env.timeout <timeout>` ãã»ããã æ¥ç¶ãè©¦ã¿ãåæ°ãæå®ã:ref:`env.connection_attempts <connection-attempts>` ãã»ãããã¾ãã ãªã¢ã¼ãã³ãã³ãã®ã¿ã¤ã ã¢ã¦ããç§ã§æå®ãã¾ãã:ref:`env.command_timeout <command-timeout>`  :ref:`env.abort_on_prompts <abort-on-prompts>` ã ``True`` ã«ã»ãããå¥åãè¦æ±ãããã Fabric ãä¸­æ­ããããå¼·å¶ãã¾ãã :ref:`env.disable_known_hosts <disable-known-hosts>` ã ``True`` ã«ã»ãããFabric ã¯ã¦ã¼ã¶ã¼ã® SSH :file:`known_hosts` ãã­ã¼ããã¾ããã æçµãã¹ããªã¹ãã®ä»ã« :ref:`env.exclude_hosts <exclude-hosts>` ã«ä¸ããããã³ã³ã¾ã§åºåã£ããã¹ãæå­åã®ãªã¹ããã»ãããã¾ãã :ref:`env.forward_agent <forward-agent>` ã ``True`` ã«ã»ãããã¨ã¼ã¸ã§ã³ãã®ãã©ã¯ã¼ããæå¹ã«ãã¾ãã :ref:`env.gateway <gateway>` ã ``HOST`` ãã¹ãæå­åã«ã»ããã :ref:`env.hosts <hosts>` ãã³ã³ãã§åºåã£ããã¹ãæå­åã®ãªã¹ãã«ã»ããã :ref:`env.keepalive <keepalive>` ãæå®ããæ´æ°ã«ã»ãããSSH ã­ã¼ãã¢ã©ã¤ãã®ééãæå®ãã¾ãã :ref:`env.no_agent <no_agent>` ã ``True`` ã«ã»ãããSSH ã¬ã¤ã¤ã¼ã«ãã©ã¤ãã¼ãã­ã¼ãã¢ã³ã­ãã¯ããã¨ãã« SSH ã¨ã¼ã¸ã§ã³ãã¨æ¥ç¶ããªãããã«å¼·å¶ãã¾ãã :ref:`env.no_keys <no_keys>` ã ``True`` ã«ã»ãããSSH ã¬ã¤ã¤ã¼ã¯ãã¼ã ã®ãã©ã¤ãã¼ãã»ã­ã¼ãã¡ã¤ã«ãæ¢ãã¾ããã :ref:`env.parallel <env-parallel>` ã ``True`` ã«ã»ãããã¿ã¹ã¯ãä¸¦è¡å¦çãã¾ãã :ref:`env.password <password>` ãæå®ããæå­åã«ã»ãããSSHæ¥ç¶ã ``sudo`` ãã­ã°ã©ã ã§ä½¿ãããã©ã«ãã®ãã¹ã¯ã¼ãã§ãã :ref:`env.pool_size <pool-size>` ãã»ãããä¸¦è¡å¦çã§åæã«å®è¡ãããã­ã»ã¹ã®æ°ãæå®ãã¾ãã :ref:`env.rcfile <rcfile>` ãæå®ã®ãã¡ã¤ã«ã«ã»ãããFabric ã¯ãããèµ·åæã«èª­ã¿è¾¼ã¿ç°å¢å¤æ°ãæ´æ°ãã¾ãã :ref:`env.roles <roles>` ãã³ã³ãã§åºåããã roleåã®ãªã¹ãã«ã»ããã  :ref:`env.shell <shell>` ãæå®ããæå­åã«ã»ããããªã¢ã¼ãã³ãã³ãã®å®è¡ã«ä½¿ç¨ããããã©ã«ãã»ã·ã§ã«ãå¤æ´ãã¾ãã :ref:`env.skip_bad_hosts <skip-bad-hosts>` ãã»ãããFabric ã¯å©ç¨ã§ããªããã¹ããã¹ã­ãããã¾ãã :ref:`env.ssh_config_path <ssh-config-path>` ãã»ããã :ref:`env.user <user>` ãæå®ã®æå­åã«ã»ãããSSH æ¥ç¶ãè¡ãªãã¨ãã«ããã©ã«ãã®ã¦ã¼ã¶ã¼åã¨ãã¦ä½¿ããã¾ãã :ref:`env.warn_only <warn_only>` ã ``True`` ã«ã»ãããFabric ã¯ã³ãã³ããã¨ã©ã¼ãèµ·ããã¦ãå®è¡ãç¶ãã¾ãã è¨­å®ãã¡ã¤ã« :option:`--list <-l>` ã«ä¼¼ã¦ãããã©ããªä¿®é£¾ããªãã¤ã³ãã³ãã¼ã·ã§ã³ããã­ã¥ã¡ã³ãæå­åããªãæ¹è¡ã§åºåãããã¿ã¹ã¯åã fabfile ãæ¤ç´¢ãããã¿ã¼ã³(ããã©ã«ãã¯ ``fabfile.py``)ããããã¯ fabfile ã¨ãã¦ã­ã¼ãããä»»æã®ãã¡ã¤ã«ãã¹(ä¾ãã° ``/path/to/my/fabfile.py``) Fabric ã®æãæ®éã®ä½¿ãæ¹ã¯ã³ãã³ãã©ã¤ã³ã»ãã¼ã«ã¨ãã¦ã§ãã``fab`` ã¯Fabricãã¤ã³ã¹ãã¼ã«ãããæã«ã·ã§ã«ã®å®è¡ãã¹ã«ç½®ããã¦ããã¯ãã§ãã ``fab`` ã¯Unixã®è¯ãä½æ°ã«ãªããã¨åªåãã¦ãã¾ããæ¨æºã®ã³ãã³ãã©ã¤ã³ã»ã¹ã¤ããããã«ãåºåãªã©ã ããã§ã®å¥åã¯ã¢ã¸ã¥ã¼ã«ã¬ãã«ã® :ref:`env.password <password>` ã :option:`--password <-p>` ã *ä¸æ¸ã* ãã¾ãã ããã§ ``fab`` ãå®è¡ããã¨ãã« fabfile ã® ``env.user`` ã¯ ``'ssh_user_name'`` ã«ãªãã¾ããä»ã®ã¦ã¼ã¶ã¼ã® fabfile ãåæ§ã«ããã¨ fabfile ã§ããã©ã«ãã®ã¦ã¼ã¶ã¼åãæ°ã«ããªãã¦æ¸ã¿ã¾ãã ãããã®ç¹æ®ãª kwargs ã¯ args/kwargs ãã **åãé¤ããã¦** ã¿ã¹ã¯é¢æ°ã«éããã¾ããfunction itself; this is so that you don't run into TypeErrors if your task doesn't define the kwargs in question. (It also means that if you **do** define arguments with these names, you won't be able to specify them in this manner -- a regrettable but necessary sacrifice.) ããã¯ãã¹ã¯ã¼ãã :option:`--password <-p>` ã fabfileã® :ref:`env.password <password>` ã§è¨­å®ããããªãæã«(ç¹ã«å®è¡æã«å¥åãä¸å¯è½ãªä¸¦è¡ã»ãã·ã§ã³ã§)èµ°ããã¦æ¾ç½®(fire-and-forget)ã§ããã®ã§ä¾¿å©ã§ãã å¼æ°ã¨ã¿ã¹ã¯åãåºå¥ããã«ã¯ã³ã­ã³ (``:``) ãä½¿ãã¾ã; ã³ã³ã (``,``) ãå¼æ°ãåºå¥ããããã«ä½¿ãã¾ãã(ããã¯ã¹ã©ãã·ã¥ã§ã¨ã¹ã±ã¼ããã¾ããä¾ãã° ``\,``); ã¤ã³ã¼ã« (``=``) ã¯ã­ã¼ã¯ã¼ãå¼æ°ããããã¯ä½ç½®ãã©ã¡ã¼ã¿ã¼ã®çç¥ã«ä½¿ãã¾ããããã¯ã¹ã©ãã·ã¥ã§ã¨ã¹ã±ã¼ããã¾ãã ãã¡ã¤ã«ã®ãã¹ãã»ããããã¨ SSHèªè¨¼ãã¡ã¤ã«ã¨ãã¦ã­ã¼ããã¾ãã(éå¸¸ã¯ãã©ã¤ãã¼ãéµ) ãã®ãªãã·ã§ã³ã¯ä½åº¦ãç¹°ãè¿ãããããããã¾ããã:ref:`env.key_filename <key-filename>` ã«ã»ãã(ãããã¯è¿½å )ãã¾ãã ãããã®å¼æ°ã« plural ãä½¿ãã¨ãã»ãã³ã­ã³(``;``)ãä½¿ãã¾ããã³ã³ãã¯å¼æ°ã§ä½¿ãã¾ããããã«ã·ã§ã«ãã»ãã³ã­ã³ãç¹æ®æå­ã¨ãã¦æ±ããªãããã«ãã¹ããªã¹ãã«ã¯ã¯ã©ã¼ããä½¿ãã»ããããã§ããããä¾ãã°:: ã¦ã¼ã¶ã¼åã ããæå®ã§ãã¾ã:: ``fab`` ãªãã·ã§ã³ã¨å¼æ° ``fab`` ã¯ Python ã® `optparse` ã©ã¤ãã©ãªãä½¿ãã¾ããããã¯ Linux ã GNU ã¹ã¿ã¤ã«ã®ã·ã§ã¼ããã­ã³ã°ãªãã·ã§ã³ãä½¿ããã¨ãããã¨ã§ããã¾ãèªç±ã«ãªãã·ã§ã³ã¨å¼æ°ãä½¿ãã¾ããä¾ãã° ``fab task1 -H hostname task2 -i path/to/keyfile`` ã¯ãã£ã¨ãããããã ``fab -H hostname -i path/to/keyfile task1 task2`` ã¨æ¸ãã¾ãã `~fabric.operations.run`, `~fabric.operations.sudo` ã¾ãã§ãããå®è¡ãããããã«::  ``--`` ã®å¾ã¯ãã¹ã¦ä¸æçãª `~fabric.operations.run` ã³ã¼ã«ã¨ãªã ``fab`` ãªãã·ã§ã³ã¨ã¯è§£éãã¾ãããã¢ã¸ã¥ã¼ã«ã¬ãã«ãã³ãã³ãã©ã¤ã³ã§ãã¹ããªã¹ããå®ç¾©ããã°ãããã¯ä¸è¡ã® anonymous ã¿ã¹ã¯ã®ããã«ä½¿ãã¾ãã ããã¯ä»¥ä¸ã® fabfile ã¨åãã§ã:: ããã¯ ``env.password = 'bar'`` ã¨ãªãã¾ãã 