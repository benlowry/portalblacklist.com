using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Net;

namespace PortalBlacklist.Site
{
	public partial class Default : System.Web.UI.Page
	{
		protected override void OnLoad(EventArgs e)
		{
			var blacklist = GetList();

			Blacklist.DataSource = blacklist;
			Blacklist.DataBind();

			if (IsPostBack) 
				return;

			var output = new StringBuilder();

			foreach(var url in blacklist)
				output.AppendLine(url);

			FormList.Text = output.ToString();
		}

		protected void Generate(Object sender, EventArgs e)
		{
			var template = (string)((string) Application["Template"]).Clone();
			var key = RandomName();
			var variables = new [] { "_parentclip_", "_width_", "_height_", "_url_", "_callback_", "_domain_", "_onerror_", "_scanfunction_", "_embedlist_", "_loaded_", "_data_", "_arr_", "_list_", "_spriteclass_", "_cover_", "_textformat_", "_textfield_", "_lang_", "_loaderclass_", "_loader_", "_loaderrequestclass_", "_urlrequestclass_", "_loaderobject_", "_requestobject_", "_XorDecode_", "_XorEncode_", "_urlfield_", "_applyXor_", "_decodeToByteArray_", "_decodeToByteArrayB_", "_BASE64_CHARS_", "_encodeByteArray_", "_encode_", "_bytes_", "_data1_", "_output1_", "_dataBuffer1_", "_outputBuffer1_", "_data2_", "_output2_", "_dataBuffer2_", "_outputBuffer2_", "_data3_", "_output3_", "dataBuffer3_", "_outputBuffer3_", "_data4_", "_inputBuffer5_", "_keyk_", "_outBuffer5_", "_keysBuffer5_", "_offset_", "_inChar_", "_outChar_", "_bitMask_", "_input1_", "_input2_", "_inputBuffer1_", "_inputBuffer2_", "_out1_", "_out2_", "_bytearrayclass_", "_textfieldclass_", "_textformatclass_", "_spriteclass_", "_capabilitiesclass_", "_movieclipclass_", "_addevent_", "_underlay_", "_textformat2_", "_pblfield_", "_note_", "_loader_", "_dloaderclass_", "_images_", "_image1_", "_image2_", "_cn_", "_cr_"};
			var encrypted = new [] { "cs", "da", "ua", "ee", "il", "nl", "fr", "de", "hu", "ru", "hr", "ft", "ja", "ko", "no", "pl", "pt", "ru", "zh-CN", "zh-TW", "es", "sv", "it", "id", "complete", "ioError", "securityError", "graphics", "beginFill", "drawRect", "endFill", "size", "align", "bold", "defaultTextFormat", "multiline", "width", "x", "y", "selectable", "wordWrap", "textColor", "text", "languages", "url", "addEventListener", "language" }; 

			foreach(var var in variables)
			{
				var newname = RandomName();

				template = SetVar(template, var, newname);
			}

			template = encrypted.Aggregate(template, (current, enc) => SetVar(current, "{" + enc + "}", Encrypt(enc, key)));

			template = SetVar(template, "{key}", key);
			template = SetVar(template, "{blacklisturl}", Encrypt("http://pbl.portalblacklist.com/blacklist.txt", key));
			template = SetVar(template, "_classname_", Request.Form["classname"]);
			template = SetVar(template, "_checkfunction_", Request.Form["functionname"]);
			template = SetVar(template, "{center}", Encrypt("center", key));
			template = SetVar(template, "{protocolseperator}", Encrypt("://", key));
			template = SetVar(template, "{slash}", Encrypt("/", key));
			template = SetVar(template, "{http}", Encrypt("http", key));
			template = SetVar(template, "{autoSize}", Encrypt("autoSize", key));
			template = SetVar(template, "{left}", Encrypt("left", key));

			// classes
			template = SetVar(template, "{URLRequest}", Encrypt("flash.net.URLRequest", key));
			template = SetVar(template, "{URLLoader}", Encrypt("flash.net.URLLoader", key));
			template = SetVar(template, "{TextField}", Encrypt("flash.text.TextField", key));
			template = SetVar(template, "{TextFormat}", Encrypt("flash.text.TextFormat", key));
			template = SetVar(template, "{Sprite}", Encrypt("flash.display.Sprite", key));
			template = SetVar(template, "{MovieClip}", Encrypt("flash.display.DisplayObjectContainer", key));
			template = SetVar(template, "{Capabilities}", Encrypt("flash.system.Capabilities", key));
			template = SetVar(template, "{Loader}", Encrypt("flash.display.Loader", key));

			// misc
			template = SetVar(template, "{://}", Encrypt("://", key));
			template = SetVar(template, "{/}", Encrypt("/", key));
			template = SetVar(template, "{:}", Encrypt(":", key));
			template = SetVar(template, "{-}", Encrypt("-", key));
			template = SetVar(template, "{cr}", Encrypt(@"\r", key));
			template = SetVar(template, "{cn}", Encrypt(@"\n", key));

			for(int i=-1; i<300; i++)
				template = SetVar(template, "{" + i + "}", Encrypt(i.ToString(), key));

			template = SetVar(template, "{true}", Encrypt("true", key));
			template = SetVar(template, "{false}", Encrypt("false", key));
			template = SetVar(template, "{inputtype1}", Encrypt("type", key));
			template = SetVar(template, "{inputtype2}", Encrypt("input", key));
			template = SetVar(template, "{0x333333}", Encrypt("0x333333", key));
			template = SetVar(template, "{0xCCCCCC}", Encrypt("0xCCCCCC", key));
			template = SetVar(template, "{0xFFFFFF}", Encrypt("0xFFFFFF", key));
			template = SetVar(template, "{0x000000}", Encrypt("0x000000", key));
			template = SetVar(template, "{pblmessage}", Encrypt("Is this your site?  You're on PortalBlacklist.com!", key));

			// base64 chars
			string charlist = Shuffle("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=");
			template = SetVar(template, "{base64charlista}", charlist.Substring(0, 12));
			template = SetVar(template, "{base64charlistb}", charlist.Substring(12, 12));
			template = SetVar(template, "{base64charlistc}", charlist.Substring(24, 12));
			template = SetVar(template, "{base64charlistd}", charlist.Substring(36));
			template = SetVar(template, "_BASE64_CHARSA_", RandomName());
			template = SetVar(template, "_BASE64_CHARSB_", RandomName());
			template = SetVar(template, "_BASE64_CHARSC_", RandomName());
			template = SetVar(template, "_BASE64_CHARSD_", RandomName());

			// images
			template = SetVar(template, "{image_note}", Encrypt((string)Application["{image_note}"], key));
			template = SetVar(template, "{image_chinese}", Encrypt((string)Application["{image_chinese}"], key));
			template = SetVar(template, "{image_croatian}", Encrypt((string)Application["{image_croatian}"], key));
			template = SetVar(template, "{image_czech}", Encrypt((string)Application["{image_czech}"], key));
			template = SetVar(template, "{image_dutch}", Encrypt((string)Application["{image_dutch}"], key));
			template = SetVar(template, "{image_english}", Encrypt((string)Application["{image_english}"], key));
			template = SetVar(template, "{image_estonian}", Encrypt((string)Application["{image_estonian}"], key));
			template = SetVar(template, "{image_french}", Encrypt((string)Application["{image_french}"], key));
			template = SetVar(template, "{image_german}", Encrypt((string)Application["{image_german}"], key));
			template = SetVar(template, "{image_hebrew}", Encrypt((string)Application["{image_hebrew}"], key));
			template = SetVar(template, "{image_hungarian}", Encrypt((string)Application["{image_hungarian}"], key));
			template = SetVar(template, "{image_indonesian}", Encrypt((string)Application["{image_indonesian}"], key));
			template = SetVar(template, "{image_italian}", Encrypt((string)Application["{image_italian}"], key));
			template = SetVar(template, "{image_korean}", Encrypt((string)Application["{image_korean}"], key));
			template = SetVar(template, "{image_polish}", Encrypt((string)Application["{image_polish}"], key));
			template = SetVar(template, "{image_portuguese}", Encrypt((string)Application["{image_portuguese}"], key));
			template = SetVar(template, "{image_russian}", Encrypt((string)Application["{image_russian}"], key));
			template = SetVar(template, "{image_slovak}", Encrypt((string)Application["{image_slovak}"], key));
			template = SetVar(template, "{image_spanish}", Encrypt((string)Application["{image_spanish}"], key));
			template = SetVar(template, "{image_swedish}", Encrypt((string)Application["{image_swedish}"], key));
			template = SetVar(template, "{image_taiwanese}", Encrypt((string)Application["{image_taiwanese}"], key));
			template = SetVar(template, "{image_ukranian}", Encrypt((string)Application["{image_ukranian}"], key));

			// the block list
			var blacklist = Request.Form["blacklist"].Split('\n');
			var alsoblock = Request.Form["alsoblock"].Split('\n');

			var list = new StringBuilder();
			var first = true;

			foreach(var domain in blacklist)
			{
				if(first == false)
					list.Append(",");
				else
					first = false;

				list.Append("'" + Encrypt(domain, key) + "'");
			}

			first = blacklist.Length == 0;

			foreach (var domain in alsoblock)
			{
				if (first == false)
					list.Append(",");
				else
					first = false;

				list.Append("'" + Encrypt(domain, key) + "'");
			}

			template = SetVar(template, "{embedlistitems}", list.ToString());
			template = SetVar(template, "{gameurl}", Encrypt(Request.Form["gameurl"], key));

			Result.Visible = true;
			Setup.Visible = false;
			ClassName.Text = Request.Form["classname"];
			Initialise.Text = Request.Form["classname"] + "." + Request.Form["functionname"];
			Code.Text = template;
		}

		private static string Shuffle(string original)
		{
			var num = new Random();

			var rand = new string(original.ToCharArray().
				OrderBy(s => (num.Next(2) % 2) == 0).ToArray());

			return rand;
		}

		private static string Base64Encode(string str)
		{
			var encbuff = Encoding.UTF8.GetBytes(str);
			return Convert.ToBase64String(encbuff);
		}

		private static string SetVar(string template, string var, string newname)
		{
			while(template.IndexOf(var) > -1)
				template = template.Replace(var, newname);

			return template;			
		}

		private static string Encrypt(string text, string key)
		{
			var result = new StringBuilder();

			for (var c = 0; c < text.Length; c++)
				result.Append((char)(text[c] ^ (uint)key[c % key.Length]));

			return Base64Encode(result.ToString());
		}

		private static string RandomName()
		{
			var length = 16;
			
			if(DateTime.Now.Minute % 4 == 0)
				length = 12;

			else if(DateTime.Now.Minute % 3 == 0)
				length = 9;

			else if(DateTime.Now.Minute %2 == 0)
				length = 7;

			var newname = "";

			while(newname.Length < length)
				newname += CleanGuid(Guid.NewGuid().ToString());

			newname = newname.Substring(0, length);

			return newname;
		}

		private static string CleanGuid(string guid)
		{
			guid = guid.Replace("-", "");

			var nums = new [] { '0','1','2','3','4','5','6','7','8','9'};
			var letters = new [] { 'z', 'x', 't', 'e', 'y', 'v', 'w', 'j', 'k', 'l' };

			for(var i=0; i<10; i++)
				if(guid[0] == nums[i])
					guid = letters[i] + guid.Substring(1);

			if(guid[0] == '0')
				guid = guid.Substring(1);

			return guid;
		}

		private IEnumerable<string> GetList()
		{
			var o = Cache["Blacklist"];

			if(o != null)
				return (List<String>)o;

			string list = null;

			var request = (HttpWebRequest)WebRequest.Create("http://s3files.playtomic.com/blacklist.txt");
			
			using(var response = request.GetResponse())
			{
				using(var stream = response.GetResponseStream())
				{
					if (stream != null)
					{
						using (var reader = new StreamReader(stream))
						{
							list = reader.ReadToEnd();
						}
					}
				}
			}

			if(string.IsNullOrEmpty(list))
				return new List<String>();

			list = list.Replace(@"\r", String.Empty);
			var items = list.Split('\n');

			var blacklist = items.Select(url => url.Trim()).ToList();

			Cache.Insert("Blackist", blacklist, null, DateTime.Now.AddMinutes(5), TimeSpan.Zero);

			return blacklist;
		}
	}
}
