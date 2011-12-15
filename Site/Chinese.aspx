<%@ Page CodeBehind="Default.aspx.cs" Inherits="PortalBlacklist.Site.Default" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>欢迎来到 游戏网站黑名单</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<style type="text/css">
	* { font-family: Arial, Verdana, Sans-Serif; font-size: 12px; color: #000; margin: 0px; padding: 0px; list-style-type: none; }
	body { background-color: #FFF; padding: 10px; }
	a { color: #07C; }
	#Container { width: 1000px; margin: 0px auto; }
	#Header { height: 60px; padding: 4px; margin-bottom: 8px; }
	#Footer { clear: both; padding: 4px; margin: 20 0px 8px 0px; border-top: 1px solid #999; }
	#Footer * { font-size: 11px; color: #666; }
	h1 { font-size: 14px; font-weight: bold; margin: 4px 0px; }
	h2 { margin-bottom: 4px; }
	p { line-height: 18px; margin-bottom: 12px; }
	strong { line-height: 18px; display: block; color: #FC0; }
	div.Use { width: 620px; float: left; }
	div.ShitList { float: right; width: 360px; }
	div.ShitList h1 { color: #900; }
	div.ShitList ul { margin: 6px 0px; border-top: 1px dotted #CCC; }
	div.ShitList li { line-height: 20px; font-weight: bold; border-bottom: 1px dotted #CCC; font-size: 11px; }
	div.Removal { background: #000 url(/Images/Black.png) repeat-x; padding: 4px; margin-bottom: 12px; }
	div.Removal h1 { color: #F00; }
	div.Removal p { color: #FFF; }
	.Field { margin-bottom: 12px; padding: 4px 4px 8px 4px; border-bottom: 1px dotted #CCC; }
	.FieldN { border-bottom: none; }
	.Field p  { font-size: 11px; }
	.Field br { height: 1px; line-height: 1px; overflow: hidden; clear: left; }
	label { font-size: 11px; font-weight: bold; display: block; width: 120px; float: left; }
	input.Textfield { width: 300px; padding: 4px; border: 1px solid #999; background-color: #F5F5F5; margin-left: 10px; }
	input.Submit { padding: 4px; background-color: #900; color: #FFF; font-weight: bold; display: block; margin-bottom: 12px; margin-left: 134px; border: none; }
	.Field textarea { width: 300px; height: 100px; padding: 4px; border: 1px solid #999; background-color: #F5F5F5; margin-left: 10px; }
	ul.Instructions { margin-bottom: 12px; }
	ul.Instructions, ul.Instructions li { list-style-type: disc !important; list-style-position: inside !important; }
	ul.Instructions li { margin-bottom: 8px; }
	ul.Instructions pre { margin: 4px 0px; }
	ul.Instructions p { font-size: 11px; color: #666; }
	ul.Instructions strong { display: inline; color: #900; }
	pre, textarea.Code { margin-bottom: 12px; background-color: #EEE; padding: 4px; overflow: auto; border: 1px solid #CCC; width: 950px; font-size: 8pt; font-family: 'Courier New'; }
	textarea.Code { width: 950px; height: 500px; }
	pre .blue { color: blue; }
	pre .olive { color: olive; }
	pre .green { color: green; }
	pre .magenta { color: magenta; }
	pre .red { color: red; }
	.Intro { padding: 6px; background: #FFF url(/Images/Blue.png) repeat-x; margin-bottom: 12px; }
	.Intro * { color: #FFF; }
	.Languages { height: 24px; border-bottom: 1px solid #EEE; margin-bottom: 8px; }
	.Languages li { float: left; margin-right: 10px; }
	.Languages a { color: #07C; }
	</style>
</head>

<body>

	<div id="Container">

		<div id="Header"><a href="http://portalblacklist.com/"><img src="/Images/Logo.png" alt="Portal Blacklist - because allowNetworking better be always, bitch" width="460" height="60" /></a></div>
		<ul class="Languages">
			<li><a href="/">English</a></li>
			<li><a href="/Chinese.aspx">中文</a></li>
		</ul>

		<asp:Panel ID="Setup" runat="server">

			<div class="ShitList">

				<div class="Removal">
					<h1>从列表中移除我的网站</h1>
					<p>如果您在这个列表中，那是因为您禁止游戏中的外链,夺去了开发者应得的收益和流量,它们是开发者辛苦工作而应得的</p>
					<p>介于您对游戏产业的消极贡献, 在那些被您偷过的开发者心目中您赢得了一个特殊的位置, 也恭喜您荣登黑名单</p>
					<p>不过如果您回心转意, 改变缺德无耻的做法, 还给开发者一个公道, 那您将不再出现在这个列表中</p>
					<p>您只需要在嵌入游戏的代码中写allowNetworking="all", 一到两天后您将自会从列表中消失</p>
					<strong>不想成为所有开发者的敌人?请不要偷窃我们的游戏!</strong>
				</div>

				<h1>黑名单</h1>
				<p>这些是最近24小时被开发者们在游戏中屏蔽的网站, 还有一些来自FreeOurGames的foes列表</p>
				<ul>
				<asp:Repeater ID="Blacklist" runat="server">
				<ItemTemplate>
					<li><%# Container.DataItem %></li>
				</ItemTemplate>
				</asp:Repeater>
				</ul>
		
			</div>

			<div class="Use">

				<div class="Intro">
					<h1>欢迎来到 游戏网站黑名单</h1>
					<p>本程序意在屏蔽那些禁止游戏外链的游戏发布网站。它将黑名单嵌入到你的游戏中，并且当有人来玩的时候它还会检查更新的黑名单列表。当一个公认的坏网站发布了你的游戏，本程序将终止游戏并显示多种语言的信息，让玩家粘贴其中的URL到浏览器地址栏访问。</p>
					<p>请记住使用Kindisoft(可以获得FGL的折扣)或者麻球的在线更新!</p>

					<p>这里有一个Playtomic献给社区的礼物 - Flash和HTML5游戏的实时分析和服务</p>
				</div>

				<form runat="server">

				<h1>把程序加入到你的游戏！</h1>
				<p>免费,只需要填写下面的表单然后点击[生成代码]</p>

				<div class="Field">
					<h2>玩家可以在哪里玩到你的游戏？</h2>
					<p>当玩家在包含于黑名单中的网站上运行游戏的时候，将显示这个URL让玩家copy到浏览器的地址栏</p>
					<label>游戏URL</label>
					<input type="text" class="Textfield" name="gameurl" maxlength="100" />
					<br />
				</div>

				<div class="Field">
					<h2>类名</h2>
					<p>请选择一个和你的其他 .as 文件命名风格相近的名字以防止识破，比如EnemyController 或者Leaderboards</p>
					<label>类名</label>
					<input type="text" class="Textfield" name="classname" maxlength="100" />
					<br />
				</div>
				
				<div class="Field">
					<h2>函数名</h2>
					<p>同样是不易被看出真实意图的名字. 你通过ClassName.FunctionName调用黑名单检查</p>
					<label>函数名</label>
					<input type="text" class="Textfield" name="functionname" maxlength="100" />
					<br />
				</div>

				<div class="Field">
					<h2>自定义你的黑名单</h2>
					<p>如果你还需要屏蔽已经列出的网站之外的,请在这里输入,每行一个</p>
					<label>额外的URL</label>
					<textarea name="alsoblock" rows="5" cols="100">www.example.com</textarea>
					<br />
				</div>

				<div class="Field FieldN">
					<h2>当前的黑名单</h2>
					<p>这个列表将被嵌入到你的游戏中,即使你的游戏不能够访问到更新服务器,这些网站也仍将被屏蔽</p>
					<label>黑名单</label>
					<textarea name="blacklist" rows="5" cols="100"><asp:Literal ID="FormList" runat="server" /></textarea>
					<br />
				</div>

				<asp:Button CssClass="Submit" Text="Generate my code" OnClick="Generate" runat="server" />

				</form>
		
			</div>

		</asp:Panel>

		<asp:Panel ID="Result" Visible="false" runat="server">
			<h1>Your code</h1>
			<p>Your code has been obfuscated to hide the strings and other telltale signs, although it's very important you encrypt your game as well!  Thanks to Daniel Sidhion for helping with the obfuscation!</p>

			<h2>Instructions</h2>
			<ul class="Instructions">
				<li>Save the code as <strong><asp:Literal ID="ClassName" runat="server" />.as</strong> in your game directory</li>
				<li>Somewhere discrete add this code to check your blacklist.  Fuzz it up a little so it does this, but doesn't look like this:
					<pre><asp:Literal ID="Initialise" runat="server" />(this, 600, 400, root.loaderInfo.loaderURL, callback)</pre>
					<p>Change 600, 400 to your movie dimensions.  The callback parameter is optional, it is for a function that receives a Boolean.</p>
				</li>
				<li>For maximum fun generate the code a few times and copy that big function into multiple, random locations amongst your game code!</li>
			</ul>

			<h2>Encryption is super important</h2>
			<p>Remember to encrypt your game using either <a href="http://kindisoft.com/">Kindisoft</a> (you can get a discount at <a href="http://flashgamelicense.com/">FGL</a>) or <a href="http://mochimedia.com/">MochiMedia's live updates</a>!</p>

			<h2>Other services you might like:</h2>
			<ul class="Instructions">
				<li><a href="http://playtomic.com/">Playtomic</a> for analytics, leaderboards and level sharing</li>
				<li><a href="http://flashgamelicense.com/">Flash Game License</a> for selling licensing rights in your game</li>
				<li><a href="http://gamersafe.com/">GamerSafe</a> for in-game leaderboards and microtransactions</li>
				<li><a href="http://mochimedia.com/">MochiMedia</a> for in-game advertising, leaderboards and microtransactions</li>
				<li><a href="http://fogdev.com/">FOGDev</a> for an alternative to in-game advertising and bad portal blocking</li>
				<li><a href="http://cpmstar.com/">CPMStar</a> for in-game and portal advertising</li>
				<li><a href="http://playerio.com/">PlayerIO</a> for multiplayer and social services</li>
				<li><a href="http://gameschart.com/">GamesChart</a> for getting paid to promote other games in your game</li>
			</ul>

			<textarea class="Code" rows="50" cols="100"><asp:Literal ID="Code" runat="server" /></textarea>

		</asp:Panel>


		<div id="Footer">
			<span>&copy; 2010 <a href="http://playtomic.com/">Playtomic</a> all rights reserved</span>
		</div>
	
	</div>

	<script type="text/javascript">

		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-4385961-16']);
		_gaq.push(['_trackPageview']);

		(function ()
		{
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		})();

	</script>

</body>
</html>