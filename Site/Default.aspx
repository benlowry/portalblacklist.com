<%@ Page CodeBehind="Default.aspx.cs" Inherits="PortalBlacklist.Site.Default" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>Portal Blacklist</title>
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
					<h1>Removal from the list</h1>
					<p>If you're on this list it's because you block links in indie game developers' Flash games, robbing them of revenue and traffic while profiting from their hard work.</p>
					<p>In honor of your contribution to this industry you've won a special place in the hearts of each of the developers you've stolen from, and a place on the Portal Blacklist.</p>
					<p>But if you're willing to change your wicked, wicked ways and play fair with game developers you can be removed from the list!</p>
					<p>Just embed games using allowNetworking="all" and you'll be automatically removed within 1 - 2 days.</p>
					<strong>Don't want to do that?  Then stop stealing our games.</strong>
				</div>

				<h1>The Blacklist</h1>
				<p>These are portals that as recently as 24 hours ago exploit game developers by blocking the links in games, supplemented with the foes from <a href="http://freeourgames.com/">Free Our Games</a>.</p>
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
					<h1>Welcome to the Portal Blacklist</h1>
					<p>The portal blacklist prevent portals from hosting your game if they block the links.    It embeds the current blacklist in your game, and when people play it attempts to get the updated list.  When a known bad site hosts your game it disables it and displays a multi-lingual message asking players to paste your URL into their browser.</p>
					<p>Remember to encrypt your game using either <a href="http://kindisoft.com/">Kindisoft</a> (you can get a discount at <a href="http://flashgamelicense.com/">FGL</a>) or <a href="http://mochimedia.com/">MochiMedia's live updates</a>!</p>

					<p>A gift to the community from <a href="http://playtomic.com/">Playtomic</a> - real time analytics and services for Flash and HTML5 games!</p>
					<a href="http://playtomic.com/"><img src="/Images/Playtomic.png" alt="Flash analytics" /></a>
				</div>

				<form runat="server">

				<h1>Set it up for your game!</h1>
				<p>It's free, just complete this tiny little form and click Generate my code.</p>

				<div class="Field">
					<h2>Where should people play your game</h2>
					<p>When your game is played on a blacklisted site a message will be shown asking users to copy this url into their browser.</p>
					<label>My game's Url</label>
					<input type="text" class="Textfield" name="gameurl" maxlength="100" />
					<br />
				</div>

				<div class="Field">
					<h2>Class name</h2>
					<p>Make it something that will not stand out amongst your .as files, like EnemyController or Leaderboards.</p>
					<label>Name</label>
					<input type="text" class="Textfield" name="classname" maxlength="100" />
					<br />
				</div>
				
				<div class="Field">
					<h2>Function name</h2>
					<p>Again something innocent.  You will call the blacklist with ClassName.FunctionName.</p>
					<label>Name</label>
					<input type="text" class="Textfield" name="functionname" maxlength="100" />
					<br />
				</div>

				<div class="Field">
					<h2>Customize your blacklist</h2>
					<p>If you would like to block sites that aren't on the blacklist enter them here one per line.</p>
					<label>Extra URLs</label>
					<textarea name="alsoblock" rows="5" cols="100">www.example.com</textarea>
					<br />
				</div>

				<div class="Field FieldN">
					<h2>The current blacklist</h2>
					<p>This list gets embedded in your game so if your game can't reach the servers to update its list it can still block bad sites.</p>
					<label>Current Blacklist</label>
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