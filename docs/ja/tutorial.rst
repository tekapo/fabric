=====================
概要とチュートリアル
=====================

.. Welcome to Fabric!

Fabric へようこそ !

..
    This document is a whirlwind tour of Fabric's features and a quick guide to its
    use. Additional documentation (which is linked to throughout) can be found in
    the :ref:`usage documentation <usage-docs>` -- please make sure to check it out.
    
このドキュメントは Fabric の機能を紹介する駆け足のツアーであり、使い方のクイックガイドでも
あります。さらに詳しいドキュメント (全体にリンクされています) は :ref:`使用方法 <usage-docs>`
にあります。ぜひご覧になってください。

.. What is Fabric?

Fabric とは ?
===============

.. As the ``README`` says:

``README`` によると:

    .. include:: README.rst
        :end-before: It provides

.. More specifically, Fabric is:

もっと具体的に言うと、Fabricとは:

..
	* A tool that lets you execute **arbitrary Python functions** via the **command
	  line**;
	* A library of subroutines (built on top of a lower-level library) to make
	  executing shell commands over SSH **easy** and **Pythonic**.

* **コマンドライン** 経由で **任意の Python 関数** を実行するツールです。
* (低レベルライブラリの上に構築された) サブルーチンのライブラリで、SSH 経由で **簡単に** かつ 
  **Python 風に** シェルコマンドを実行します。

..
	Naturally, most users combine these two things, using Fabric to write and
	execute Python functions, or **tasks**, to automate interactions with remote
	servers. Let's take a look.

当然、たいていのユーザーはこの2つを組み合わせます。Fabric を使って Python の関数もしくは
**タスク** を作成し、実行して、リモートサーバとのやりとりを自動化します。ではちょっと見てみましょう。

Hello, ``fab``
==============

.. This wouldn't be a proper tutorial without "the usual"::

"いつもの"がないと正しいチュートリアルではないですよね::

    def hello():
        print("Hello world!")

..
    Placed in a Python module file named ``fabfile.py`` in your current working
    directory, that ``hello`` function can be executed with the ``fab`` tool
    (installed as part of Fabric) and does just what you'd expect::

上のコードを ``fabfile.py`` という名前のPythonモジュールファイルとしてカレントのワーキング
ディレクトリに置くと、 ``fab`` ツール(Fabricのパーツとしてインストールされています)
で ``hello`` 関数を実行することができ、期待した通りに動きます::

    $ fab hello
    Hello world!

    Done.

..
    That's all there is to it. This functionality allows Fabric to be used as a
    (very) basic build tool even without importing any of its API.

どうってことはありませんね。この機能性により、自身のAPIを何もインポートしなくても(とても)
ベーシックなビルドツールとしてFabricを利用することができます。

.. note::

    ..
        The ``fab`` tool simply imports your fabfile and executes the function or
        functions you instruct it to. There's nothing magic about it -- anything
        you can do in a normal Python script can be done in a fabfile!

    ``fab`` ツールは単にあなたのfabfileをインポートしてその指示にしたがって
    ひとつもしくは複数の関数を実行します。何かマジックがあるわけではありません。
    通常の Python スクリプトで可能なすべてのことが fabfile 内でも可能なのです!

.. seealso:: :ref:`execution-strategy`, :doc:`/usage/tasks`, :doc:`/usage/fab`


.. Task arguments

タスク引数
============

..
    It's often useful to pass runtime parameters into your tasks, just as you might
    during regular Python programming. Fabric has basic support for this using a
    shell-compatible notation: ``<task name>:<arg>,<kwarg>=<value>,...``. It's
    contrived, but let's extend the above example to say hello to you personally::

Fabricでは実行時引数をタスクに渡せるので便利なことも多いです。ちょうと通常のPython
プログラミングのようなものです。Fabricはこの基本的なサポートを持っていて、
シェル互換ノーテーションを使っています: ``<task name>:<arg>,<kwarg>=<value>,...``
不自然な感じがするかもしれませんが、上の例を拡張してあなたに say hello と言うようにしてみましょう::

    def hello(name="world"):
        print("Hello %s!" % name)

..
    By default, calling ``fab hello`` will still behave as it did before; but now
    we can personalize it::

デフォルトでは、 ``fab hello`` を呼び出しても以前と同じ動きをします。今度はこれを
パーソナライズしてみましょう::

    $ fab hello:name=Jeff
    Hello Jeff!

    Done.

..
    Those already used to programming in Python might have guessed that this
    invocation behaves exactly the same way::

Pythonプログラミングに慣れた方なら、この呼び出しでもまったく同じ挙動をすることが
想像できると思います::

    $ fab hello:Jeff
    Hello Jeff!

    Done.

..
    For the time being, your argument values will always show up in Python as
    strings and may require a bit of string manipulation for complex types such
    as lists. Future versions may add a typecasting system to make this easier.

差し当たりは、引数の値は常に文字列としてPythonに現れ、リストなどの複雑な型では少し
文字列操作が必要になります。将来のバージョンではこれをより簡単にするため、型キャストシステム
が追加されるかもしれません。

.. seealso:: :ref:`task-arguments`

.. Local commands

ローカルコマンド
=================

..
    As used above, ``fab`` only really saves a couple lines of
    ``if __name__ == "__main__"`` boilerplate. It's mostly designed for use with
    Fabric's API, which contains functions (or **operations**) for executing shell
    commands, transferring files, and so forth.

上の例では、 ``fab`` は ``if __name__ == "__main__"`` の定型文の何行かを省略できるに
過ぎません。たいていはFabricのAPIと利用するためにデザインされます。APIには
シェルコマンドの実行、ファイルの転送などの関数 (もしくは **操作**) が含まれます。

..
    Let's build a hypothetical Web application fabfile. This example scenario is
    as follows: The Web application is managed via Git on a remote host
    ``vcshost``. On ``localhost``, we have a local clone of said Web application.
    When we push changes back to ``vcshost``, we want to be able to immediately
    install these changes on a remote host ``my_server`` in an automated fashion.
    We will do this by automating the local and remote Git commands.

では、仮定のウェブアプリケーションの fabfile を作ってみましょう。この例のシナリオは次の
ようなものです: このウェブアプリケーションはリモートホスト ``vcshost`` 上にGit経由で管理されています。
``localhost`` 上ではこのウェブアプリケーションのローカルクローンがあります。``vcshost`` 
に変更をプッシュすると、すぐに、そして自動的にリモートホスト ``my_server`` に変更を反映させたいと思います。
これを、ローカルとリモートのGitコマンドを自動化することによって実施させてみましょう。

..
    Fabfiles usually work best at the root of a project::

通常は、fabfileはプロジェクトのルートに置くのがいいでしょう::

    .
    |-- __init__.py
    |-- app.wsgi
    |-- fabfile.py <-- わたしたちの fabfile!
    |-- manage.py
    `-- my_app
        |-- __init__.py
        |-- models.py
        |-- templates
        |   `-- index.html
        |-- tests.py
        |-- urls.py
        `-- views.py

.. note::

    ..
        We're using a Django application here, but only as an example -- Fabric is
        not tied to any external codebase, save for its SSH library.
	
    ここではDjangoアプリケーションを使用していますが、単に例として用いているだけで
    FabricはSSHライブラリは別として、どんな外部のコードベースにもひも付けられていません。

..
    For starters, perhaps we want to run our tests and commit to our VCS so we're
    ready for a deploy:: 

まず第一にこのテストを実行し、VCSにコミットしてみましょう。
そしてデプロイを準備をします::

    from fabric.api import local

    def prepare_deploy():
        local("./manage.py test my_app")
        local("git add -p && git commit")
        local("git push")

.. The output of which might look a bit like this 

出力はだいたい次のようになるでしょう::

    $ fab prepare_deploy
    [localhost] run: ./manage.py test my_app
    Creating test database...
    Creating tables
    Creating indexes
    ..........................................
    ----------------------------------------------------------------------
    Ran 42 tests in 9.138s

    OK
    Destroying test database...

    [localhost] run: git add -p && git commit

    <interactive Git add / git commit edit message session>

    [localhost] run: git push

    <git push session, possibly merging conflicts interactively>

    Done.

..
    The code itself is straightforward: import a Fabric API function,
    `~fabric.operations.local`, and use it to run and interact with local shell
    commands. The rest of Fabric's API is similar -- it's all just Python.

このコード自身は単純です。FabricのAPI関数 `~fabric.operations.local` をインポートし、
それを利用してローカルのシェルコマンドを実行し、やりとりを行います。他のFabricのAPIも似ていて
すべてただのPythonです。

.. seealso:: :doc:`api/core/operations`, :ref:`fabfile-discovery`


.. Organize it your way

好きなように構造化する
=======================

..
    Because Fabric is "just Python" you're free to organize your fabfile any way
    you want. For example, it's often useful to start splitting things up into
    subtasks::

Fabricは"ただのPython"なのでfabfileは好きなように自由に構造化できます。
例えば、サブタスクに分けることから始めると便利でしょう::

    from fabric.api import local

    def test():
        local("./manage.py test my_app")

    def commit():
        local("git add -p && git commit")

    def push():
        local("git push")

    def prepare_deploy():
        test()
        commit()
        push()

..
    The ``prepare_deploy`` task can be called just as before, but now you can make
    a more granular call to one of the sub-tasks, if desired.

``prepare_deploy`` タスクは以前と同じように呼び出すことができますが、今回は必要であれば
サブタスクの一つとしてより粒度を細かくして呼び出しをすることができます。

.. Failure

失敗
====

..
    Our base case works fine now, but what happens if our tests fail?  Chances are
    we want to put on the brakes and fix them before deploying.

基本的な動きは問題ないですが、もしテストに失敗したらどうなるでしょうか? デプロイの前にブレーキを
かけて修正する機会があります。

..
    Fabric checks the return value of programs called via operations and will abort
    if they didn't exit cleanly. Let's see what happens if one of our tests
    encounters an error::

Fabricは操作経由で呼び出されたプログラムの返り値をチェックして、正常に終了しなかった場合には
停止します。テストのひとつがエラーに出くわしたときにどうなるか見てみましょう。::

    $ fab prepare_deploy
    [localhost] run: ./manage.py test my_app
    Creating test database...
    Creating tables
    Creating indexes
    .............E............................
    ======================================================================
    ERROR: testSomething (my_project.my_app.tests.MainTests)
    ----------------------------------------------------------------------
    Traceback (most recent call last):
    [...]

    ----------------------------------------------------------------------
    Ran 42 tests in 9.138s

    FAILED (errors=1)
    Destroying test database...

    Fatal error: local() encountered an error (return code 2) while executing './manage.py test my_app'

    Aborting.

..
    Great! We didn't have to do anything ourselves: Fabric detected the failure and
    aborted, never running the ``commit`` task.

素晴らしい! 私たち自身では何もする必要がありませんでした。Fabricが失敗を検知して停止し、
``commit`` タスクは決して実行されることはありません

.. seealso:: :ref:`Failure handling (usage documentation) <failures>`

.. Failure handling

失敗の扱い
------------

..
    But what if we wanted to be flexible and give the user a choice? A setting
    (or **environment variable**, usually shortened to **env var**) called
    :ref:`warn_only` lets you turn aborts into warnings, allowing flexible error
    handling to occur.

さて、これを柔軟にしてユーザーに選択をさせるにはどうすれいいでしょう? :ref:`warn_only` と
呼ばれる設定 (もしくは **environment variable**、通常は短く **env var**) が停止を
警告に変え、柔軟なエラーの扱いを可能にします。

..
    Let's flip this setting on for our ``test`` function, and then inspect the
    result of the `~fabric.operations.local` call ourselves

``test`` 関数でこの設定を有効にして、`~fabric.operations.local` 呼び出しの結果を調べて
見ましょう::

    from __future__ import with_statement
    from fabric.api import local, settings, abort
    from fabric.contrib.console import confirm

    def test():
        with settings(warn_only=True):
            result = local('./manage.py test my_app', capture=True)
        if result.failed and not confirm("Tests failed. Continue anyway?"):
            abort("Aborting at user request.")

    [...]

.. In adding this new feature we've introduced a number of new things:

この新しい機能を追加するにあたり、新しいことをたくさん導入しました:

..
    * The ``__future__`` import required to use ``with:`` in Python 2.5;
    * Fabric's `contrib.console <fabric.contrib.console>` submodule, containing the
      `~fabric.contrib.console.confirm` function, used for simple yes/no prompts;
    * The `~fabric.context_managers.settings` context manager, used to apply
      settings to a specific block of code;
    * Command-running operations like `~fabric.operations.local` can return objects
      containing info about their result (such as ``.failed``, or
      ``.return_code``);
    * And the `~fabric.utils.abort` function, used to manually abort execution.

* Python 2.5 では ``with:`` を使うために ``__future__`` のインポートが必要です。
* Fabricの `contrib.console <fabric.contrib.console>` サブモジュールは
  `~fabric.contrib.console.confirm` 関数を含んでいて、簡単なイエス/ノープロンプトに使われます。
* `~fabric.context_managers.settings` コンテキストマネージャーはコードの特定のブロックに
  設定を適用するのに使われます。
* `~fabric.operations.local` のようなコマンドランニング操作は、その結果 (``.failed``
  や ``.return_code`` など) に関する情報を含むオブジェクトを返すことができます。
* そして `~fabric.utils.abort` 関数は手動で停止を実行するために使われます。

..
    However, despite the additional complexity, it's still pretty easy to follow,
    and is now much more flexible.

とは言え、この追加的な複雑性を別にすれば、理解するのはとても簡単でより柔軟になったと思います。

.. seealso:: :doc:`api/core/context_managers`, :ref:`env-vars`


Making connections
==================

接続する
==========

Let's start wrapping up our fabfile by putting in the keystone: a ``deploy``
task that is destined to run on one or more remote server(s), and ensures the
code is up to date

では今度は、肝心な部分を入れてfabfileを仕上げましょう。 ``deploy`` タスクは一つもしくは
複数のリモートサーバーで実行され、コードが確実に最新になるにようにします。::

    def deploy():
        code_dir = '/srv/django/myproject'
        with cd(code_dir):
            run("git pull")
            run("touch app.wsgi")

Here again, we introduce a handful of new concepts:
今回もまた、たくさんの新しいコンセプトが導入されています:

* Fabric is just Python -- so we can make liberal use of regular Python code
  constructs such as variables and string interpolation;
* `~fabric.context_managers.cd`, an easy way of prefixing commands with a ``cd
  /to/some/directory`` call. This is similar to  `~fabric.context_managers.lcd`
  which does the same locally.
* `~fabric.operations.run`, which is similar to `~fabric.operations.local` but
  runs **remotely** instead of locally.
* FabricはただのPythonです。したがって、変数や文字列の操作などの通常のPythonコードの
  概念を自由に利用することができます。
* `~fabric.context_managers.cd` はコマンドに``cd /どこ/かの/ディレクトリ`` 呼び出しを
  追加する簡単な方法です。これは同じことをローカルで実行する `~fabric.context_managers.lcd`
  と似ています。
* `~fabric.operations.run` は `~fabric.operations.local` に似ていますが、ローカルではなく
  **リモートで** 動作します。

We also need to make sure we import the new functions at the top of our file::
また、ファイルの一番上で新しい関数を確実にインポートするようにします::

    from __future__ import with_statement
    from fabric.api import local, settings, abort, run, cd
    from fabric.contrib.console import confirm

With these changes in place, let's deploy::
これらを変更したら、デプロイしてみましょう::

    $ fab deploy
    No hosts found. Please specify (single) host string for connection: my_server
    [my_server] run: git pull
    [my_server] out: Already up-to-date.
    [my_server] out:
    [my_server] run: touch app.wsgi

    Done.

We never specified any connection info in our fabfile, so Fabric doesn't know
on which host(s) the remote command should be executed. When this happens,
Fabric prompts us at runtime. Connection definitions use SSH-like "host
strings" (e.g. ``user@host:port``) and will use your local username as a
default -- so in this example, we just had to specify the hostname,
``my_server``.

このfabfileでは接続情報は指定していません。したがって、Fabricはどのホスト(複数可)でこの
リモートコマンドが実行されるべきなのかが分かりません。このようなとき、Fabricは起動時に入力を
促します。接続定義はSSHのような"ホスト文字列"(例えば ``user@host:port``)を使い、
デフォルトではローカルのユーザー名が使われます。そのため、この例では単にホスト名
``my_server`` だけを指定しています。

Remote interactivity
--------------------

リモートとの双方向性
---------------------

``git pull`` works fine if you've already got a checkout of your source code --
but what if this is the first deploy? It'd be nice to handle that case too and
do the initial ``git clone``::

チェックアウトしたソースコードがすでにあるのなら ``git pull`` で問題ないでしょう。
しかし最初のデプロイだったらどうでしょう? そうしたケースも扱えて、最初の ``git clone``
も実行するようにするといいでしょう::

    def deploy():
        code_dir = '/srv/django/myproject'
        with settings(warn_only=True):
            if run("test -d %s" % code_dir).failed:
                run("git clone user@vcshost:/path/to/repo/.git %s" % code_dir)
        with cd(code_dir):
            run("git pull")
            run("touch app.wsgi")

As with our calls to `~fabric.operations.local` above, `~fabric.operations.run`
also lets us construct clean Python-level logic based on executed shell
commands. However, the interesting part here is the ``git clone`` call: since
we're using Git's SSH method of accessing the repository on our Git server,
this means our remote `~fabric.operations.run` call will need to authenticate
itself.

上の `~fabric.operations.local` との場合と同じように `~fabric.operations.run` もまた、
シェルコマンドの実行をベースにきれいなPythonレベルのロジックを組み立てることができます。
しかし、ここでの興味深い部分は ``git clone`` 呼び出しで、Gitサーバ上のリポジトリへの
アクセスにGitのSSHメソッドを利用します。つまりリモートの `~fabric.operations.run`
呼び出しは、自身の認証を必要とするのです。 

Older versions of Fabric (and similar high level SSH libraries) run remote
programs in limbo, unable to be touched from the local end. This is
problematic when you have a serious need to enter passwords or otherwise
interact with the remote program.

Fabricの以前のバージョン(と、同じようなハイレベルなSSHライブラリ)では、リモートプログラムの
の実行は中途半端な状態で、ローカル側からは触れませんでした。これはパスワードの入力が本当に
必要な場合やリモートプログラムとの情報のやりとりが必要な場合に解決が難しい問題でした。

Fabric 1.0 and later breaks down this wall and ensures you can always talk to
the other side. Let's see what happens when we run our updated ``deploy`` task
on a new server with no Git checkout

Fabric 1.0以降ではこの問題を解決し、リモート側と常にやりとりできることを確保しています。
では、Gitチェックアウトがないときに新しいサーバー上でアップデートした ``deploy`` タスクを
実行したときに何が起こるか見てみましょう::

    $ fab deploy
    No hosts found. Please specify (single) host string for connection: my_server
    [my_server] run: test -d /srv/django/myproject

    Warning: run() encountered an error (return code 1) while executing 'test -d /srv/django/myproject'

    [my_server] run: git clone user@vcshost:/path/to/repo/.git /srv/django/myproject
    [my_server] out: Cloning into /srv/django/myproject...
    [my_server] out: Password: <enter password>
    [my_server] out: remote: Counting objects: 6698, done.
    [my_server] out: remote: Compressing objects: 100% (2237/2237), done.
    [my_server] out: remote: Total 6698 (delta 4633), reused 6414 (delta 4412)
    [my_server] out: Receiving objects: 100% (6698/6698), 1.28 MiB, done.
    [my_server] out: Resolving deltas: 100% (4633/4633), done.
    [my_server] out:
    [my_server] run: git pull
    [my_server] out: Already up-to-date.
    [my_server] out:
    [my_server] run: touch app.wsgi

    Done.

Notice the ``Password:`` prompt -- that was our remote ``git`` call on our Web server, asking for the password to the Git server. We were able to type it in and the clone continued normally.

``Password:`` プロンプトは、ウェブサーバ上のリモートの ``git`` 呼び出しで、Gitサーバーへのパスワードへの
問い合わせであることに留意してください。パスワードをここで入力することができ、クローンは通常のように継続されます。

.. seealso:: :doc:`/usage/interactivity`


.. _defining-connections:

Defining connections beforehand
-------------------------------

予め接続を定義する
------------------

Specifying connection info at runtime gets old real fast, so Fabric provides a
handful of ways to do it in your fabfile or on the command line. We won't cover
all of them here, but we will show you the most common one: setting the global
host list, :ref:`env.hosts <hosts>`.

起動時に接続情報を指定するのはすぐにうんざりしてくると思います。そのためFabricでは、fabfile
内やコマンドライン上でこれを行うためのたくさんの手段を提供しています。ここではすべてをカバー
しませんが、もっともよくある手段、グローバルなホストリストの設定 :ref:`env.hosts <hosts>`
をお見せしましょう。

:doc:`env <usage/env>` is a global dictionary-like object driving many of
Fabric's settings, and can be written to with attributes as well (in fact,
`~fabric.context_managers.settings`, seen above, is simply a wrapper for this.)
Thus, we can modify it at module level near the top of our fabfile like so

:doc:`env <usage/env>` はFabricのたくさんの設定を操作するグローバルな辞書のようなオブジェクトで、
さらに属性とともに書くことも可能です。(実際のところ、上にみられるように
`~fabric.context_managers.settings` はこれの単なるラッパーです)
したがって、モジュールレベルで、自分のfabfileの一番上に近いところで次のように変更が可能です::

    from __future__ import with_statement
    from fabric.api import *
    from fabric.contrib.console import confirm

    env.hosts = ['my_server']

    def test():
        do_test_stuff()

When ``fab`` loads up our fabfile, our modification of ``env`` will execute,
storing our settings change. The end result is exactly as above: our ``deploy``
task will run against the ``my_server`` server.

``fab`` がfabfileを読み込むとき、今回変更した ``env`` が実行され、設定の変更を格納します。
その結果は上の通りになり、``deploy`` タスクが ``my_server`` に対して実行されます。

This is also how you can tell Fabric to run on multiple remote systems at once:
because ``env.hosts`` is a list, ``fab`` iterates over it, calling the given
task once for each connection.

また、このようにして、Fabricに対して一度に複数のリモートシステム上で実行させることもできます。
``env.hosts`` はリストなので ``fab`` はこのリストを順に処理し、各接続に対して与えられた
タスクを呼び出します。

.. seealso:: :doc:`usage/env`, :ref:`host-lists`


Conclusion
==========

まとめ
======

Our completed fabfile is still pretty short, as such things go. Here it is in
its entirety

完成したfabfileは、それでもかなり短いものです。全体では以下になります::

    from __future__ import with_statement
    from fabric.api import *
    from fabric.contrib.console import confirm

    env.hosts = ['my_server']

    def test():
        with settings(warn_only=True):
            result = local('./manage.py test my_app', capture=True)
        if result.failed and not confirm("Tests failed. Continue anyway?"):
            abort("Aborting at user request.")

    def commit():
        local("git add -p && git commit")

    def push():
        local("git push")

    def prepare_deploy():
        test()
        commit()
        push()

    def deploy():
        code_dir = '/srv/django/myproject'
        with settings(warn_only=True):
            if run("test -d %s" % code_dir).failed:
                run("git clone user@vcshost:/path/to/repo/.git %s" % code_dir)
        with cd(code_dir):
            run("git pull")
            run("touch app.wsgi")

This fabfile makes use of a large portion of Fabric's feature set:

このfabfileはFabricの機能セットのうちのかなりの部分を利用しています:

* defining fabfile tasks and running them with :doc:`fab <usage/fab>`;
* calling local shell commands with `~fabric.operations.local`;
* modifying env vars with `~fabric.context_managers.settings`;
* handling command failures, prompting the user, and manually aborting;
* and defining host lists and `~fabric.operations.run`-ning remote commands.
* fabfileのタスクを定義し、それを :doc:`fab <usage/fab>` で実行
* `~fabric.operations.local` でローカルのシェルコマンドを呼び出し
* `~fabric.context_managers.settings` で env 変数を変更
* コマンド失敗の扱い、ユーザーにプロンプト表示、手動アボート
* ホストリストの定義と `~fabric.operations.run` のリモートコマンド実行

However, there's still a lot more we haven't covered here! Please make sure you
follow the various "see also" links, and check out the documentation table of
contents on :ref:`the main index page <documentation-index>`.

とは言え、ここではカバーしていないこともまだたくさんあります ! ぜひさまざまな "see also"
リンクをたどってみてください。また、 :ref:`the main index page <documentation-index>`
のドキュメンテーションの目次もチェックしてみてください。

Thanks for reading!

お読みいただきありがとうございます !
